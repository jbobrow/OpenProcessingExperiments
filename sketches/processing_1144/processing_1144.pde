
/**
 * Summer of Rage
 *
 * 2009-03-07 v3 spxl
 *
 * Files "preferred.txt" and "alternate.txt" hold lists
 * of words, one word per line.
 * The words need not necessarily be in alphabetic order,
 * but must be grouped by letter.
 */

Dictionary preferredDict; // Preferred words
Dictionary alternateDict; // Alternate words

Acro[] acronym;  // The acronym! (R.A.G.E.)

int fontHeight = 48;
String[] fontFiles =
{
  "Crass-48.vlw",
  "Cambria-Bold-48.vlw",
  "FatBoySmiles-48.vlw",
  "FattyBombatty-48.vlw",
  "Felt_Regular-48.vlw",
  "CODE3X-48.vlw"
};
PFont[] fonts;

int lineHeight = 50;

boolean paused = false;

public class Dictionary
{
  public String[] words;
  public int[] start;     // Start index for each letter
  public int[] end;       // End index for each letter
  
  public Dictionary(String dictFile)
  {
    words = loadStrings(dictFile);
    
    start = new int[26];
    end   = new int[26];

    int li     = -1;  // Letter index
    int prevLi = -1;  // Previous letter index
    int wi;           // Word index
    
    for (wi = 0; wi < words.length; wi++)
    {
      li = letterIndex(words[wi]);
      if (li != prevLi)
      {
        // End previous letter's word range
        if (prevLi >= 0)
        {
          end[prevLi] = wi - 1;
        }

        // Start this letter's word range
        start[li] = wi;
      }
      
      prevLi = li;
    }

    // End last letter's word range
    if (prevLi >= 0)
    {
      end[prevLi] = wi - 1;
    }
  }
  
  public int randomWordIndex(Character letter, int prevIndex)
  {
    int li = letterIndex(letter);
    int wi = int(random(start[li], end[li]));  // Range includes start but not end index
    return (wi < prevIndex) ? wi : wi + 1;     // Return an index not equal to prevIndex
  }

  public int letterIndex(String word)
  {
    return letterIndex(word.charAt(0));
  }

  public int letterIndex(Character letter)
  {
    return Character.toLowerCase(letter) - 'a';
  }
}

public class Acro
{
  public Character letter;
  public String word;
  public PFont font;

  private Dictionary preferred;  // Preferred words
  private Dictionary alternate;  // Alternate words, can be null
  private Dictionary dict;  // Select one of preferred or alternate
  private int wordIndex;
  private PFont fonts[];
  private int fontIndex;
  
  // Note that alternate dictionary can be null
  Acro(Character letter, Dictionary preferred, Dictionary alternate, PFont[] fonts)
  {
    this.letter = Character.toUpperCase(letter);

    this.preferred = preferred;
    this.alternate = alternate;
    this.fonts = fonts;

    randomWord();
    randomFont();
  }
  
  public String randomWord()
  {
    dict = (alternate == null || random(1) < 0.5) ? preferred : alternate;

    wordIndex = dict.randomWordIndex(letter, wordIndex);
    word = dict.words[wordIndex];
    return word;
  }
  
  public PFont randomFont()
  {
    int fi = int(random(fonts.length - 1));
    fontIndex = (fi < fontIndex) ? fi : fi + 1;
    font = fonts[fontIndex];
    return font;
  }
}

void setup()
{
  size(600, 400, P2D);
  frameRate(10);
  
  fonts = new PFont[fontFiles.length];
  for (int i = 0; i < fontFiles.length; i++)
  {
    fonts[i] = loadFont(fontFiles[i]);
  }

  preferredDict = new Dictionary("preferred.txt");
  alternateDict = new Dictionary("alternate.txt");

  String theWord = "rage";
  acronym = new Acro[theWord.length()];
  
  for (int i = 0; i < theWord.length(); i++)
  {
    acronym[i] = new Acro(theWord.charAt(i), preferredDict, alternateDict, fonts);
  }
  
  noLoop();  
}

void keyPressed()
{
  if (key >= '1' && key <= '0' + acronym.length)
  {
    acronym[key - '1'].randomWord();
  }
  else if (key == 'f')
  for (int i = 0; i < acronym.length; i++)
  {
    acronym[i].randomFont();
  }
  else
  for (int i = 0; i < acronym.length; i++)
  {
    acronym[i].randomWord();
    acronym[i].randomFont();
  }

  redraw();
}

void mouseMoved()
{
  int term = rnd(acronym.length);

  if (abs(mouseX - pmouseX) > 0)
    acronym[term].randomFont();

  if (abs(mouseY - pmouseY) > 0)
    acronym[term].randomWord();

  redraw();
}

void draw()
{
  background(0);
  
  int x = 40;
  int y = lineHeight * 3 / 2;

  textFont(fonts[0]);
  fill(255, 255, 0);
  text("Summer of...", x, y);
  
  x += textWidth("n");
  y += lineHeight / 2;

  for (int i = 0; i < acronym.length; i++)
  {
    y += lineHeight;

    if (random(1) < 0.1)
      fill(255, 0, 0);
    else
      fill(255, 255, 255);
      
    textFont(acronym[i].font);
    text(acronym[i].word, x, y);
  }
}

PFont rndFont()
{
  return fonts[rnd(fonts.length)];
}

int rnd(int n)
{
  return int(random(n));
}


