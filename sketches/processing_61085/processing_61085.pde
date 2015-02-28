
// based on a sketch by Diane Lange 
// from http://www.openprocessing.org/sketch/44133
// modified by Thomas Koberger

class TextAnalyzer
{
  private ArrayList fullTxt, words;
  private Word [] wordArray;
  private int last;
  public int sentencesSize ;
  private String [] rawTxt;
  private PFont font;
  private boolean animate, isAnimating;

  public TextAnalyzer (String loadPath, String inputFormat, boolean animate)
  {
    this.animate = animate;
    if (animate) isAnimating = true;
    fullTxt = new ArrayList();
    words = new ArrayList();
    this.font = createFont ("Verdana", 12);
    splitText (loadStrings (loadPath));

    if (!animate) {
      println("created");
      createWordArrayList(inputFormat);
    }
    createWordArray();
  }

  public boolean getAnimation ()
  {
    if (animate && isAnimating) return true;
    else return false;
  }

  public boolean getMode ()
  {
    return animate;
  }

  public int getFullSize()
  {
    return fullTxt.size();
  }

  public int getWordsSize()
  {
    return words.size();
  }

  public float getDiffWordsSize() {
    return (float) words.size() / fullTxt.size() * map(fullTxt.size(), 0, 1000000, 1, 50);
  }

  public Word [] getWordArray()
  {
    createWordArray();
    return wordArray;
  }

  public String getRawTxt ()
  {
    String raw = "";

    for (int i = 0; i < rawTxt.length; i++)
    {
      raw += rawTxt [i] + " ";
    }
    return raw;
  }

  public int getSenteceSize () {
    return sentencesSize;
  }

  public void splitText (String [] rawTxt)
  {
    this.rawTxt = rawTxt;
    String tokens = ",.;:-_!?&\"□▫¶~ +%=()[]{}«»#&%§'|";
    for (int i = 0; i < rawTxt.length; i++)
    {
      if (!rawTxt[i].equals("")) sentencesSize++;
      String [] rowTxt = splitTokens (rawTxt [i], tokens);

      for (int j = 0; j < rowTxt.length; j++)
      {
        fullTxt.add (new String (rowTxt [j]));
      }
    }
  }

  public float getAvgSentenceSize () {
    return fullTxt.size()/sentencesSize;
  }

  private String removeFirstChar (String word)
  {
    char [] c = new char [word.length()-1];
    for (int k = 0; k < c.length; k++)
    {
      c [k] = word.charAt(k+1);
    }

    return new String (c);
  }

  private void createWordArrayList (String textFormat)
  {
    // ertser Eintrag
    boolean found = false;

    for (int i = 0; i < fullTxt.size(); i++)
    {
      String full = (String) fullTxt.get(i);
      if (words.size() == 0)
      {
        //erster Eintrag
        if (textFormat.equals("utf")) full = removeFirstChar(full);
        words.add (new Word (full, 0, 0));
      }
      else {
        found = false;

        for (int j = 0; j < words.size(); j++)
        {
          Word temp = (Word) words.get (j);

          if (temp.getTxt().equals ( full.toLowerCase()))
          {
            // wort in liste gefunden
            temp.increase(i);
            found = true;
          }

          if (found)
          {
            j =  words.size();
            continue;
          }
        }

        if (!found)
        {
          //neues Wort
          quicksort (full.toLowerCase(), words.size(), 0, i);
        }
      }
    }
  }

  private void createWordArrayList (String textFormat, int count)
  {
    // ertser Eintrag
    boolean found = false;

    if (count < fullTxt.size())
    {
      String full = (String) fullTxt.get(count);
      if (words.size() == 0)
      {
        //erster Eintrag
        if (textFormat.equals("utf")) full = removeFirstChar(full);
        words.add (new Word (full, 0, 0));
      }
      else {
        found = false;

        for (int j = 0; j < words.size(); j++)
        {
          Word temp = (Word) words.get (j);

          if (temp.getTxt().equals ( full.toLowerCase()))
          {
            // wort in liste gefunden
            temp.increase(count);
            found = true;
          }

          if (found)
          {
            j =  words.size();
            continue;
          }
        }

        if (!found)
        {
          //neues Wort
          quicksort (full.toLowerCase(), words.size(), 0, count);
        }
      }
    }
    else {
      isAnimating = false;
    }
  }

  private void quicksort (String input, float iSize, float index, int txtIndex)
  {

    if (round (iSize) == 1)
    {
      int i = round (index);
      Word listedWord = (Word) words.get (i);
      String listed = listedWord.getTxt();

      if (compareString (input, listed)) addWord (input, i+1, txtIndex);
      else addWord (input, i, txtIndex);
    }
    else {
      int i = floor (index+iSize/2.0);

      Word listedWord = (Word) words.get (i);
      String listed = listedWord.getTxt();

      if (compareString (input, listed)) quicksort (input, iSize/2.0, index+iSize/2.0, txtIndex);
      else quicksort (input, iSize/2.0, index, txtIndex);
    }
  }

  private boolean compareString (String input, String listed)
  {

    int dir  = input.compareTo(listed);

    if (dir > 0 ) return true;
    else return false;
  }

  private void addWord (String input, int pos, int txtIndex)
  {
    words.add (pos, new Word (input, txtIndex, last));
    last = pos;
  }

  private void createWordArray()
  {
    wordArray = new Word [words.size()];

    for (int i = 0; i < wordArray.length; i++)
    {
      wordArray [i] = (Word) words.get (i);
    }
  }
}


