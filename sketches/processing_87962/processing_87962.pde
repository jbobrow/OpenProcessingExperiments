
import java.io.*;
import java.util.Arrays;

class Bigram
{
	private TagSet		Tags;
	private float [][]	Counts;		// Times we've seen A -> B.
	private float [][]	LogProb;	// Probability of A -> B.
	private int SentenceBoundaryIndex;

	public Bigram(TagSet tags)
	{
		Tags	= tags;
		Counts	= new float[Tags.Size()][Tags.Size()];
		LogProb	= new float[Tags.Size()][Tags.Size()];

		SentenceBoundaryIndex = Tags.GetIndexFromString("SNB");
		if (SentenceBoundaryIndex == -1)
		{
			System.out.println("Tag set doesn't have sentence boundary tag.");
			System.out.println("This will probably cause an ArrayIndexOutOfBounds error.");
		}
	}

	public void Load(Reader reader)
	{
		for (int row=0 ; row<Tags.Size() ; ++row)
		{
			for (int col=0 ; col<Tags.Size() ; ++col)
			{
				Counts[row][col] = 0.0f;
			}
		}
		BufferedReader buffer = null;
		try
		{
			buffer = new BufferedReader(reader);
			String line = null;
			
			while ((line = buffer.readLine()) != null)
			{
				String[] tokens = line.split("\\s+");
				if (tokens.length == 3)
				{
					int index_a = Tags.GetIndexFromString(tokens[0]);
					int index_b = Tags.GetIndexFromString(tokens[1]);
					float count = Float.valueOf(tokens[2]).floatValue();
					Counts[index_a][index_b] = count;
				}
			}
		}
		catch (Throwable t){ t.printStackTrace(); throw new RuntimeException(); }
		finally
		{
			if (buffer != null)
				try { buffer.close(); }
				catch (IOException ignored){}
		}
			RefreshLogProbs();
	}

	public void Save(String file_name)
	{
		try
		{
			PrintWriter out = new PrintWriter(new FileWriter(file_name)); 

			for (int row=0 ; row<Tags.Size() ; ++row)
			{
				for (int col=0 ; col<Tags.Size() ; ++col)
				{
					if (Counts[row][col] > 0.0f)
					{
						out.print(Tags.GetStringFromIndex(row) + " ");
						out.print(Tags.GetStringFromIndex(col) + " ");
						out.println("" + (int)Counts[row][col]);
					}
				}
			}
			out.close();
		}
		catch (Throwable t){ t.printStackTrace(); throw new RuntimeException(); }
	}

	public int TagSingleWord(Word word)
	{
		int   snb_tag    = Tags.GetIndexFromString("SNB");
		int   tag        = 0;
		int   best_tag   = 0;
		float best_count = 0.0f;
		while (0 != (tag=Tags.GetNextTagFromBitField(word.Tags, tag)))
		{
			if (Counts[snb_tag][tag] > best_count)
			{
				best_tag   = tag;
				best_count = Counts[snb_tag][tag];
			}
		}
		return best_tag;
	}

	public int [] Viterbi(Word [] words)
	{
		if (words == null	 ||
			words.length == 0 ||
			Arrays.asList(words).contains(null) ||
			Arrays.asList(words).contains(new Long(0L)))
		{
			System.out.println("Viterbi input invalid.");
			return null;
		}

		int [] best_tags = new int[words.length];
		if (words.length == 1)
		{
			best_tags[0] = TagSingleWord(words[0]);
			return best_tags;
		}

		float [][] probabilities  = new float [words.length][Tags.Size()];
		int   [][] back_pointers  = new int   [words.length][Tags.Size()];
		int        back_pointer   = -1;

		// Fill in the matrix
		for (int word_id=1 ; word_id<words.length ; ++word_id)
		{
			float best_log_prob = Float.NEGATIVE_INFINITY;
			long from_tags = words[word_id-1].Tags;
			long to_tags   = words[word_id  ].Tags;
			int  from_tag  = 0;
			while (0 != (from_tag=Tags.GetNextTagFromBitField(from_tags, from_tag)))
			{
				int to_tag = 0;
				while (0 != (to_tag=Tags.GetNextTagFromBitField(to_tags, to_tag)))
				{
					float log_prob = probabilities[word_id-1][from_tag] + LogProb[from_tag][to_tag];
						
					if (probabilities[word_id][to_tag] < log_prob ||
						probabilities[word_id][to_tag] == 0.0f)
					{
						probabilities[word_id][to_tag] = log_prob;
						back_pointers[word_id][to_tag] = from_tag;
					}
					if (log_prob > best_log_prob)
					{
						back_pointer = to_tag;
						best_log_prob = log_prob;
					}
				}
			}
		}

		// Back trace
		float sentence_log_prob = probabilities[words.length-1][back_pointer];
		for (int word_id=words.length-1 ; word_id>=0 ; --word_id)
		{
			best_tags[word_id] = back_pointer;
			back_pointer = back_pointers[word_id][back_pointer];
		}

		return best_tags;
	}

	// Add counts from a tagged corpus. The run-time should
	// only require the resulting list of transition counts.
	public void ReadCorpus(String file_name, int column_of_tags)
	{
		BufferedReader buffer = null;
		try
		{
			buffer = new BufferedReader(new FileReader(file_name));
			int preceding_tag_index = SentenceBoundaryIndex;
			String line = null;

			while ((line = buffer.readLine()) != null)
			{
				String[] tokens = line.split("\\s+");
				if (tokens.length > column_of_tags)
				{
					if (tokens[column_of_tags].equals("-X-"))
					{
						continue;
					}
					
					int tag_index = Tags.GetIndexFromString(tokens[column_of_tags]);
					if (tag_index != -1 &&
						preceding_tag_index != -1 &&
						(tag_index			!= SentenceBoundaryIndex ||
						preceding_tag_index != SentenceBoundaryIndex))
					{
						Counts[preceding_tag_index][tag_index] += 1.0f;
					}
					preceding_tag_index = tag_index;
				}
				else
				{
					preceding_tag_index = SentenceBoundaryIndex;
				}
			}
		}
		catch (Throwable t){ t.printStackTrace(); throw new RuntimeException(); }
		finally
		{
			if (buffer != null)
				try { buffer.close(); }
				catch (IOException ignored){}
		}
		
		RefreshLogProbs();
	}

	private float CalculateLogProb(int [] tags)
	{
		float result = 0.0f;
		
		for (int i=1 ; i<tags.length ; ++i)
		{
			result += LogProb[tags[i-1]][tags[i]];
		}

		return result;
	}
	
	private void RefreshLogProbs()
	{
		// Add K smoothing. This is K:
		final float smoothing = 1.0f;
		
		for (int row=0 ; row<Tags.Size() ; ++row)
		{
			float row_sum = smoothing * (float)Tags.Size();
			for (int col=0 ; col<Tags.Size() ; ++col)
			{
				row_sum += Counts[row][col];
			}
			for (int col=0 ; col<Tags.Size() ; ++col)
			{
				LogProb[row][col] = (float) Math.log((Counts[row][col]+smoothing) / row_sum);
			}
		}
	}
}

