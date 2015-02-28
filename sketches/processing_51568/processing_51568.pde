

int firstWord = 100;
int lastWord = 140;

Word[] frankList = new Word[1];
ArrayList circleWordList = new ArrayList();

void setup() {
  size(800, 800);
  background(0);
  smooth();
  // Order the words from Frankenstein according to frequency
  frankList = countAndOrderWords("franklist.rtf", frankList);  // Frankenstein
    
  //int zIndex = 100;
  int fontSize = 144;
    
  
  for (int i=firstWord; i < lastWord; i++)
  {
    CircleWord cw = new CircleWord();
    
    cw.red = random(0,200);
    cw.green = random(255);
    cw.blue = random(255);
    //cw.rad = i*2 - 70; //start at 100, subtract 2 every time
    cw.xPos = random(500);
    cw.yPos = random(60, 800);
    //cw.zIndex = zIndex;
    cw.xSpeed = random(15);
    cw.ySpeed = random(15);
    cw.fontSize = fontSize;
    cw.word = frankList[i].ww;
    circleWordList.add(cw);
    //zIndex--;
    fontSize -= 3;
  } 
}



void draw(){
  
  background(255);
  smooth();
  
  for (int i=circleWordList.size()-1; i>0; i--)
  {
    CircleWord cw = (CircleWord)circleWordList.get(i);
    
    
    cw.xPos += cw.xSpeed;
    //cw.yPos += cw.ySpeed;
    
    PFont font = createFont("serif", cw.fontSize, true);
    textFont(font);
    fill(cw.red);
   
    text(cw.word, cw.xPos, cw.yPos);
    
    if( (cw.yPos > height) )
    {
      cw.ySpeed *= -1;
    }
    
    if( (cw.xPos + textWidth(cw.word) > width) || cw.xPos < 0)
    {
      cw.xSpeed *= -1;
    }  
    
  }
}




Word[] countAndOrderWords(String textFile, Word[] wordList) {

  String[] lines = loadStrings(textFile);
  wordList[0] = new Word("");
  boolean started = false;

  for (int i = 0; i < lines.length; i++) {
    if (lines[i].startsWith("*** START OF")) {  
      started = true;
    } 
    else if (lines[i].startsWith("*** END")) {
      started = false;
    } 
    else if (started == true) {
      String separators = WHITESPACE + ",;.:!?()\"-\\";
      String[] thisLine = splitTokens(lines[i], separators);

      for (int j = 0; j < thisLine.length; j++) {

        String word = thisLine[j].toLowerCase();
        //println(word);
        boolean newWord = true;

        for (int w = 0; w < wordList.length; w++) {
          if (word.equals(wordList[w].ww)) {
            newWord = false;
            wordList[w].count++;
            break;
          }
        }

        if (newWord == true) {
          Word next = new Word(word);
          wordList = (Word[])append(wordList, next);
          wordList[wordList.length-1].wordCount = word.length();
        }

      }
    }
  }

  Arrays.sort(wordList); 
  return wordList;
}


class CircleWord
{
  String word;
  float red;
  float green;
  float blue;
  float xPos;
  float yPos;
  //int zIndex;
  float xSpeed;
  float ySpeed;
  int fontSize;
}

// ---------------
// Word.pde
// ---------------
class Word implements Comparable {

  String ww;
  int count = 1;
  int wordCount = 0;

  Word(String txt) {
    ww = txt;
  }

  // If we want to sort based on the count value of Word:
  int compareTo(Object o)
  {
    Word other = (Word)o;
    if(other.count > count) {  
      return 1;
    }
    if(other.count == count) {
      return 0;
    } else {
      return -1;
    }
  }
}

