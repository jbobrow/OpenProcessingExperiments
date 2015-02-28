
/*
Melissa Alleyne
EMS II - Generative Text
Presents a random quote from the database
Click on a word
if that word is contained in another quote in the database
present that quote.
Otherwise we hang forever. 
*/
PFont f;
String m1 = "WHAT EDDINGTON SAYS ABOUT THE DIRECTION OF TIME AND THE LAW OF ENTROPY COMES TO THIS: TIME WOULD CHANGE ITS DIRECTION I MEN SHOULD START WALKING BACKWARDS ONE DAY. OF COURSE YOU CAN CALL IT THAT IF YOU LIKE; BUT THEN YOU SHOULD BE CLEAR IN YOUR MIND THAT YOU HAVE SAID NO MORE THAN THAT PEOPLE HAVE CHANGED THE DIRECTION THEY WALK IN. ";
String m2 = "Time you enjoy wasting is not wasted time. ";
String m3 = "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away. ";
String m4 = "You miss 100 percent of the shots you never take. ";
String m5 = "To the man who only has a hammer, everything he encounters begins to look like a nail. ";
String m6 = "Work like you don’t need money, love like you’ve never been hurt, and dance like no one’s watching ";
String m7 = "Try a thing you haven’t done three times. Once, to get over the fear of doing it. Twice, to learn how to do it. And a third time, to figure out whether you like it or not. ";
String m8 = "People often say that motivation doesn’t last. Well, neither does bathing – that’s why we recommend it daily. ";
String m9 = "Believe those who are seeking the truth. Doubt those who find it. ";
String m10 = "An inventor is simply a fellow who doesn’t take his education too seriously ";
String m11 = "Some people like my advice so much that they frame it upon the wall instead of using it. ";
String m12 = "Well, it's not the men in your life that counts, it's the life in your men. ";
String m13 = "Of all the gin joints in all the towns in all the world, she walks into mine. ";
String m14 = "People here are funny. They work so hard at living they forget how to live. ";
String m15 = "To you, my little prairie flower: I'm thinkin' of you every hour. Though now you're just a friend to me, I wonder what the end will be. Oh, you would make my life divine If you would change your name to mine. ";

String[] phrases = {m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15};

int chosenSentence;
ArrayList sentenceFadeOut;
// An array of Letter objects
Letter[] letters;
ArrayList sentences;
int x, y;
int mLength;
Word blueW;
boolean stopClicking = false;
int counter = 0;

void setup() {
  background(255);
  size(1000, 500);
  // Load the font
  int charSize = 20;
  f = createFont("Times",charSize,true);
  textFont(f);
  

  blueW = null;
  sentenceFadeOut = new ArrayList();
  ArrayList sentence; //holds all words in a phrase
  sentences = new ArrayList();
  
  for (int i = 0; i < 15; i++) {
    x = 50;
    y = height/2;
    String sent = phrases[i].toUpperCase();
    int mLength = sent.length();
    sentence = new ArrayList(); //holds all words in sentence
    ArrayList currentWord = new ArrayList();
    // Initialize Letters at the correct x location
  
    for (int j = 0; j < mLength; j++) {
      char c = sent.charAt(j);
      if( c == ' ') {
        currentWord.add(new Letter(x,y,c));
        sentence.add(new Word(currentWord, charSize, color(0,0,0)));
        currentWord = new ArrayList();
      }
      else {
        currentWord.add(new Letter(x,y,c));
      }
      
      x+=textWidth(c);
      if (x > width-50) {
        x = 100;
        y += charSize;
      }
     
    }
    sentences.add(sentence);
  }
  
  chosenSentence = round(random(sentences.size()-1));
  ArrayList s = (ArrayList) sentences.get(chosenSentence);
    
  for(int i = 0; i < s.size(); i++) {
    Word w = (Word) s.get(i);
    w.display();
  }
} 

void draw() { 
    int nextSentence = -1;
    if(!stopClicking) {
      if (mousePressed) {
        float mouse_x = mouseX;
        float mouse_y = mouseY;
        sentenceFadeOut = (ArrayList) sentences.get(chosenSentence);
        blueW = findWord(sentenceFadeOut, mouse_x, mouse_y);
        color c = color(77,188,233);
        if (blueW != null) {
          blueW.c = c;
          nextSentence = getNextSentence(blueW);
          stopClicking = true;
        }
      } 
    }
 
    
    background(255);
    for( int i = 0; i < sentenceFadeOut.size(); i++) {
      Word w = (Word) sentenceFadeOut.get(i);
      w.c+=1;
      w.display();
      if(nextSentence != -1 && blueW != null) {
        //stopClicking = false;
        //blueW.c = color(0);
        chosenSentence = nextSentence;
        w.c = 0;
        stopClicking = false;
      }
    } 
    

}

int getNextSentence(Word w) {
  int returnV = -1;
  ArrayList<Integer> numsLeft = new ArrayList<Integer>();
  numsLeft.add(0); numsLeft.add(1);numsLeft.add(2);numsLeft.add(3);numsLeft.add(4);numsLeft.add(5);numsLeft.add(6);numsLeft.add(7);numsLeft.add(8);numsLeft.add(9);numsLeft.add(10);numsLeft.add(11);numsLeft.add(12);numsLeft.add(13);numsLeft.add(14);
  

  while (!numsLeft.isEmpty()) {
      int randomSelected = round(random(numsLeft.size()-1));
      ArrayList s = (ArrayList) sentences.get(numsLeft.get(randomSelected));
      for( int i = 0; i < s.size(); i++) {
        Word checkW = (Word) s.get(i);
        
          
        if(w.equal(checkW)) {
          returnV = (int) numsLeft.get(randomSelected);
        }
      }
      numsLeft.remove(randomSelected);
  }
  return returnV; //couldn't find word
}

//find word determined by mouse click in sentence 
Word findWord(ArrayList sentence, float mx, float my) {
  for( int i = 0; i < sentence.size(); i++) {
      Word w = (Word) sentence.get(i);
      if(w.onWord(mx, my)) {
        return w;
      }
  }
  return null;
}

class Word {
  float fx, ft, lx, fb;
  int charSize, alphaV;
  ArrayList word; 
  color c;
 
  Word(ArrayList letters, int charSize_, color c) {
    word = letters;
    charSize = charSize_;
    Letter firstL = (Letter) letters.get(0);
    Letter lastL = (Letter) letters.get(letters.size()-1);
    fx = firstL.x;
    ft = firstL.y - charSize;
    fb = firstL.y;
    lx = lastL.x;
    c = color(0,0,0);
  }
  
  boolean equal(Word w2) {
    if (word.size() != (w2.word).size()) 
      return false;
    
    for(int i = 0; i < word.size(); i++) {
      Letter l1 = (Letter) word.get(i);
      Letter l2 = (Letter) w2.word.get(i);
          
         if (l1.letter != l2.letter)
            return false;
     }
     return true;
  }
  
  boolean onWord(float x_, float y_) {
    if (x_ >= fx && x_ <= lx && y_ >= ft && y_ <= fb) {
      return true;
    }
    return false;
  }
  
  void display() {
    for(int i = 0; i < word.size(); i++) {
      Letter letter = (Letter) word.get(i);
      letter.display(c);
    }
  }
  
  /*String toString() {
    for(int i = 0; i < word.size(); i++) {
      Letter letter = (Letter) word.get(i);
      //s += letter.letter + ":(" + letter.x + ")";
    }
   // return s;
  }*/
}
// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
  }

  // Display the letter
  void display(color c) {
    fill(c);
    textAlign(CENTER);
    text(letter,x,y);
  }

  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }

  // Return the letter home
  void home() {
    x = homex;
    y = homey; 
  }
}

