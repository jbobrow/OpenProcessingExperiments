
// RASA, or the Random Appearance of Symbols from Alice, is an interactive
// visual work/poem/game that takes a text file of a classical literature
// of work and presents it in a new, three-dimensional way.

// Author Florence Hope, 2013.

// import readers and scanners.
import java.util.*;
import java.io.*;

// initialise Booleans, camera angles, and other needed fields.
PFont f;  
PFont sf;
private Scanner reader;
String aWord;
String thisWord;
Scanner rabbits;
int wordCount;
ArrayList<String> allWords;
ArrayList<String> rules;
float rd = 155;
float bl = 170;
float gr = 220;
Random rnd = new Random();
float eyeX = width/2; 
float eyeY = height/2; 
float eyeZ = 120;
float centerX =  width/2.0; 
float centerY = height/2.0; 
float centerZ = 0;
float upX = 0;
float upY = 1;
float upZ = 0;
int [][] twodPixels;
boolean go = false;
boolean rabbit = false;
boolean hatter = false;
boolean queen = false;
boolean bad = false;
boolean dodo = false;
int mushroomEnd;
char badChar;
int start;
int end;
int dodoStart;
int dodoEnd;
int dodoTime;
int questionTime;
int rabbitEnd;
int hatterEnd;
int queenEnd;
int frames = 30;
boolean desk = false;
boolean mushroom = false;

void setup(){
  
  size(800, 600 ,P3D);
  if (frame != null) {
    frame.setResizable(true);
  }
  
  f = createFont("Georgia",12,true);
  sf = createFont("Georgia",16,true);

  background(0);
  
  try{
    allWords = getWords();
  }
  
  catch(Exception e){
    println(e);
  }
  wordCount = allWords.size();
  frameRate(100);
  
}

// Enter main draw loop.
void draw(){
  
  frameRate(frames);
  
  // Test booleans to determine mode. 
  
  if(go == false && dodo == false){
    startMessage();
  }
  
  // enter dodo mode
  if (go == false && dodo == true){
    
    // enlarge font
    textFont(sf);
    
    //place word.
    text("dodo", mouseX, mouseY,-500 + random(500));
    
    // the user can't change the camera angle. 
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);    
    
    // time's up.
    if(frameCount > dodoTime){
      questionTime = frameCount + 200;
      go = false;
      desk = true;
      dodo = false;
      textFont(f);
      }  
  }  
  
  // Display message "why is a raven like a writing desk?" for 
  if (dodo == false && desk == true){

    go = false;
    background(0,0,0);   
    text("Why is a raven like a writing desk?", 300,300,0);
    if (frameCount > questionTime){
        background(0,0,0);
        desk = false;
        go = true;
        mushroom = false;
      }
  }
  
  // Enter mushroom mode.
  if (mushroom == true ){
    String anyWord = getWord();
    fill(rd + random(100),gr+random(35), bl+random(80));
    text(anyWord, (float)rnd.nextGaussian()*random(100) + mouseX+300, (float)rnd.nextGaussian()*200 + mouseY*2,-500 + random(800));
    if (frameCount > mushroomEnd){
        mushroom = false;  
        go = true;
    } 
  }
  
  // Finished testing booleans, the system is operating in its normal mode.
  if (dodo == false && go == true && mushroom == false){
  String anyWord = getWord();
  fill(255,255,255);
  stroke(255,255,255);
  
  // Look for event words, if found start timer and display in their colour. 
  if(anyWord.equals("mushroom")){
    fill(205,50,120);
    mushroomEnd = frameCount + 200;
    fill(155,170,220);
    text(anyWord, (float)rnd.nextGaussian()*random(100) + mouseX, (float)rnd.nextGaussian()*200 + mouseY,-500 + random(800));  
  }
  
  if (anyWord.equals("rabbit")){;
    fill(0,200,255);
    rabbitEnd = frameCount + 200;
    text(anyWord, (float)rnd.nextGaussian()*random(100) + mouseX, (float)rnd.nextGaussian()*200 + mouseY,-500 + random(800));  
  }
  
  if(anyWord.equals("hatter")){
    fill(205,50,120);
    hatterEnd = frameCount + 200;
    text(anyWord, (float)rnd.nextGaussian()*random(100) + mouseX, (float)rnd.nextGaussian()*200 + mouseY,-500 + random(800));  
  }
  
  if(anyWord.equals("dodo")){
    dodoStart = frameCount;
    dodoEnd = dodoStart + 200;
    fill(255,140,0);
    text(anyWord, (float)rnd.nextGaussian()*100 + mouseX, (float)rnd.nextGaussian()*200 + mouseY,-500 + random(800));
  }
  
  if(anyWord.equals("queen")){
    fill(190,0,0);
    queenEnd = frameCount + 200;
    text(anyWord, (float)rnd.nextGaussian()*random(100) + mouseX, (float)rnd.nextGaussian()*200 + mouseY,-500 + random(800));  
  }
  
  // Not an event word, place on canvas in white.
  else{
    stroke(255,255,255);
    fill(255,255,255);
    text(anyWord, (float)rnd.nextGaussian()*random(100) + mouseX, (float)rnd.nextGaussian()*200 + mouseY,-1000 + random(1500));
  }
  
}
}
// respond to user input. 
void keyPressed(){
  
  // determine course of action.
  if (key == CODED) {
    
    if (keyCode == LEFT) {
      eyeX++;
    }
    if (keyCode == RIGHT) {
      eyeX--;
    }
    
    if (keyCode == UP){
      eyeY++;
    }
    if (keyCode == DOWN){
      eyeY--;
    }
  }
  
  if (key == 'z'){
    eyeZ++;
  }
  if (key == 'x'){
    eyeZ--;
  }
  
  if (key == 'p' && frames < 100){
    frames++;
  }
  if (key == 'o' && frames > 10){
    frames--;
  }
  
  if(key == 'r' && frameCount < rabbitEnd){
    background(0,100,200);
  }
  
  if(key == 'm' && frameCount < mushroomEnd){
    background(54,0,28);
    mushroom = true;
    mushroomEnd = frameCount + 200;
  }
  
  if(key == 'h' && frameCount < hatterEnd){
    background(205,50,120);
  }
  
    if(key == 'q' && frameCount <queenEnd){
    background(190,0,0);
  }
  
  if(key == 'd' && frameCount < dodoEnd){
    background(0,0,0);
    dodo = true;
    go = false;
    dodoTime = frameCount + 1000;
  }
  
  if(key == BACKSPACE){
    eyeX = width/2; eyeY = height/2; eyeZ = 120;
    centerX =  width/2.0; centerY = height/2.0; centerZ = 0;
    upX = 0;
    upY = 1;
    upZ = 0;
  } 
    camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
}


// Create arrayList of words.
public ArrayList<String> getWords() throws java.io.IOException{
  
  // import text file into a scanner.  
  File queen = new File("/Users/florencehope/Documents/Processing/alicemover/alicewhole.txt");
  rabbits = new Scanner(new BufferedReader(new FileReader(queen)));
  
  // initialise arrayList.    
  ArrayList<String> allWords = new ArrayList<String>();

  // iterate over scanner item, add each word to allWords in lower case without punctuation.
  while (rabbits.hasNext()){
    String thisWord = rabbits.next().replaceAll("[^a-zA-Z]","").toLowerCase();         
    allWords.add(thisWord);
  }
  return(allWords);
}

// Return a random word. 
private String getWord(){
  int index = int(random(wordCount));
  aWord = allWords.get(index);
  return aWord;
}


// clear background.
void mousePressed(){
  background(0,0,0);
}


//Display start message.
void startMessage(){
      background(0);
      textFont(sf);
      fill(255);
      text("Hello!", 20, 40);
      
      if (frameCount > 100){
        background(0);
        text("We're going to play a game.", 20, 40);
      }
      
      if (frameCount > 200){
        background(0);
        text("I'm not going to tell you the rules.", 20, 40);
      }
      
      if (frameCount > 300){
        background(0);
        text("Ready?", 20, 40);
      }
      
      if (frameCount > 320){
        background(0);
        text("Go!", 20, 40);
      }
      
      // enter main loop.
      if (frameCount > 340){
        background(0);
        go = true;
            eyeX = width/2; eyeY = height/2; eyeZ = 120;
            centerX =  width/2.0; centerY = height/2.0; centerZ = 0;
            upX = 0;
            upY = 1;
            upZ = 0;
      textFont(f);
      } 
}

// run in full size. 
//boolean sketchFullScreen() {
//  return true;
//}


