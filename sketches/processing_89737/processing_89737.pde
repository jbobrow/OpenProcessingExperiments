
import java.util.*;
PFont font = createFont("Arial", 48);
PFont font2 = createFont("times", 16);
int x,y;
ArrayList<Word> words = new ArrayList<Word>();

void setup() {
  size(500,600); 
  x = 5;
  y = 15; 
  smooth();
 
  
  Map<String, ArrayList<String>> wordMap = loadInWords("words.txt");
  /*
  for (String k : wordMap.keySet()) {
   // println("key = " + k); 
  
    List<String> values = wordMap.get(k);
  
    for (String v : values) {
     // println("\tvalue = " + v);
    }   
  }
  */
  
  words = parseGrammar(wordMap, "grammer.txt");
}


/*** 
  Loads in a text file indicating words assoicated with parts of speech, parses it, 
  and returns a Map of each part of speech and its assoicated List of words.
  Assumes each line looks like:

    POS:word1,word2,...,wordN
***/  
Map<String, ArrayList<String>> loadInWords(String filename) {
  
  Map<String, ArrayList<String>> m = new HashMap<String, ArrayList<String>>();
  
  String[] lines = loadStrings(filename);
  
  for (int i = 0 ; i < lines.length; i++) {
    //println(lines[i]);
    String[] chop = split(lines[i], ':');
    
    String POS = chop[0];
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    //println(wordsArr);
    
    ArrayList<String> wordsList = new ArrayList<String>();
    for(int j = 0; j < wordsArr.length; j++){
      //println(wordsArr[j]);
      wordsList.add(wordsArr[j]);
    }
    // = Arrays.asList(wordsArr); //turns array into a List
    
    
   
    for (String tmpStr : wordsList) {
      //println("\t\tword="+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;
}

/***
  Reads through a text file of parts of speech and looks through a Map m for a random word 
  that corresponds to each part of speech. Returns a populated List of Word objects, where
  each type of Word has its own render() method.
***/

ArrayList<Word> parseGrammar( Map<String, ArrayList<String>> m, String filename) {
  
  ArrayList<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  
  
  for(String line : lines) {
    //println(line); 
    
    String[] posArr = line.split(" ");
    //List<String> posList = Arrays.asList(posArr); //turns array into a List
    ArrayList<String> posList = new ArrayList<String>();
    for(int i = 0; i < posArr.length; i++){
      //println("watch for me" + posArr[i]);
      posList.add(posArr[i]);
    }
    
    for (String p : posList) {
      //println("\t" + p);
      
      ArrayList<String> listOfWords = new ArrayList<String>();
      listOfWords = m.get(p);      
      
      int randNum = (int) random(0,listOfWords.size());
       
      String randomWord = listOfWords.get( randNum );
      //println("\t\t" + randomWord);
      Word w;
      if (p.equals("Noun")){
         w = new WordNoun(new PVector(x,y), color(134,55,240), randomWord, p);
         int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
      }else
      
        if (p.equals("Verb")){
          w = new WordVerb(new PVector(x,y), color(220,100,22), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
         }else
      
        if (p.equals("Adjective")){
          w = new WordAdj(new PVector(x,y), color(255,255,0), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+10;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
         }else
      
        if (p.equals("Conjunction")){
          w = new WordConj(new PVector(x,y), color(100,25,100), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
         }else
      
        if (p.equals("Adverb")){
          w = new WordVerb(new PVector(x,y), color(50,155,50), randomWord, p);
          int sw = (int)textWidth(w.word);
        x+=sw+15;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
        }else{  
        
       w = new Word(new PVector(x,y), color(0,255,0), randomWord, p);
        int sw = (int)textWidth(w.word);
        x+=sw+10;
 

       if(x+sw>width){
         x = 5;
         y +=30;
       } 
        
      }
      ws.add(w);
   
  }
  }
  
  // 2. For each POS in the line, get the associated List of words from Map m.
  // 3. Choose a random word from the list.
  // 4. Place this word in a List that we will read from in the draw() loop. 
  
  return ws;
 }



void draw() {
   background(0,0,0,255); 
   for (Word w : words) {
     w.bounce();
     w.move();
     w.render();
    // w.age();
  /*   int sw = (int)textWidth(w.word);
     x+=sw+10;
 

     if(x+sw>width){
       x = 5;
       y +=20;
     }
    */
   }
}

/*
Movement and bouncing based off Richard Spellman's Terminal Velocity
*/
public class Word {
 
  
  PVector start; // the position of the word object
  PVector vel; // velocity of the word object
  PVector acc = new PVector(0, 0.05); // acceleration applied to the word object
  String word; // the character represented by the word object
  color c; // color to print the text
  int age; // age of the word object
  String pos; 
  // Constructor
 
  public Word(PVector _xy, color _c, String _w, String _pos){
    start = _xy; // set initial position
    c = _c; // set color
    word = _w; // set word
    pos = _pos;
    vel = new PVector(0, 0.1); // set initial velocity... down.
  }
 
  // render(): draws the character to the screen. called by draw()
  void render(){
  //  start = new PVector(x,y);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
   
  // move(): increments the position of the Char object. called by draw()
  void move(){
   // if(age > 120){ // wait a while before falling
      start.add(vel); // increment position using current velocity
      vel.add(acc); // apply acceleration to velocity
   // }
  }
   
  // age(): increments the age variable of the Char object. called by draw(). used to determine when to start the
  // character falling, and when to remove it from the ArrayList...
  void age(){
    age++; // increment the age variable by one
  }
   
  // bounce(): inverts the direction of the velocity vector and reduces it's magnitude when the position of the character
  // reaches the bottom of the screen
  void bounce(){
    if(start.y > height){ // if the position of the character reaches the bottom of the screen,
      vel.y = vel.y * -0.9; // invert the direction and reduce the magnitude of the Char object's velocity vector by 30%
    }
  }
} 
  
 

public class WordAdj extends Word{

public WordAdj(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 0.2);
  }

   void render(){
    textFont(font2, 10);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
 
 

}

public class WordAdverb extends Word{

public WordAdverb(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 0.3);
  }

 void render(){
    textFont(font2, 14);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
}
public class WordConj extends Word{

 public WordConj(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 0.5);
  }
 void render(){
    textFont(font2, 18);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
}

public class WordNoun extends Word{

 public WordNoun(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 1);
  }

 void render(){
    textFont(font, 22);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
}

public class WordVerb extends Word{

public WordVerb(PVector _xy, color _c, String _w, String _pos){
    super(_xy, _c, _w, _pos);
    vel = new PVector(0, 0.9);
  }

 void render(){
    textFont(font2, 30);
    fill(c); // text color
    text(word, start.x, start.y); // print character represented by the Char object at it's current position value.
  }
}


