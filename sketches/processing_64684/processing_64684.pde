

    // Properties that can be modified
	private static final int ms_nWindowSize = 256;
	private static final String ms_strFontName = "Arial";
	private static final int ms_nFontSize = 20;
	private static final int ms_nSentenceLength = 256;
	private static final String ms_strStartingSentence = "";

    // Private attributes
	private boolean m_bInPause;
	private Letter m_letter;
	private char[] m_szSentence;

	public void setup(){
		size(256, 256);
		noStroke();
		
		textFont(createFont(ms_strFontName, ms_nFontSize));

		m_bInPause = false;
		m_letter = new Letter();
		m_szSentence = new char[ms_nSentenceLength];

		for (int i = 0; i < ms_nSentenceLength; ++i){
			if (ms_strStartingSentence.length() > i){
				m_szSentence[i] = ms_strStartingSentence.charAt(i);
			}
			else{
				m_szSentence[i] = ' ';
			}
		}
	}
	
	public void draw(){
		if (!m_bInPause){
			background(255);
			fill(0);
			incrementLetter(0);
			text(String.copyValueOf(m_szSentence), 5, 5, ms_nWindowSize, ms_nWindowSize);
		}
	}
	
	public void keyPressed(){
		if (key == 'p' || key == 'P'){
			m_bInPause = !m_bInPause;
		}
	}

	public void incrementLetter(int nIndex){
		m_letter.Value = m_szSentence[nIndex];
		boolean bIncrement = m_letter.increment();
		m_szSentence[nIndex] = m_letter.Value;
		
		if (bIncrement){
			incrementLetter((nIndex+1) % ms_nSentenceLength);
		}
	}
	
	public class Letter{
		public char Value;
		
		public boolean increment(){
			if (Value == 'z'){
				Value = ' ';
				return true;
			}
			else if (Value == ' '){
				Value = 'a';
				return false;
			}
			else if (Value >= 'a' && Value <= 'z'){
				Value++;
				return false;
			}
			else{
				Value = ' ';
				return false;
			}
		}
	}


