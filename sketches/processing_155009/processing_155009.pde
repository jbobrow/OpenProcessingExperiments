
/*
 * Creative Coding
 * Week 5, 05 - Text agents
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch creates a simple agent-based simulation using text and objects
 * The sketch reads in characters from the keyboard and dynamically creates
 * new objects for each character.
 *
 */
int wordNumber;
int ind = 0;
PFont myFont;
String [] fWord = {"greetings from...robert" , "groovy t-shirts" , "hard",  "art", "logic", "interesting" ,"esoteric" ,"eclectic" ," challenging" , "time consuming" , "hard to debug", "what is popMatrix()", "f**k" ,"frustrating" ,"well presented" ,"inspirational" ,"task orientated" , "surprising","fascinating","demanding"};
;
FloatingWords [] FWwords = new FloatingWords[5];
int currentCount;
PImage myImage;    // PImage is used to store an image in memory


void setup() {
  size(800, 650);
  myImage = loadImage("white_cliffs.JPG");
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  myFont = loadFont("HelveticaNeue-UltraLight-200.vlw");
  textFont(myFont);
  //textMode(SHAPE);
  smooth(8); // enable antialiasing
for (int i = 0; i<FWwords.length; i++){
int wordIndex = (int)random(fWord.length);

float y = random(height);

 FWwords[i] = new FloatingWords(y, fWord[wordIndex]);
 
}
}


void draw() {
   background(360);
image(myImage, 0, 0);
 
  
  for (int i = 0; i<FWwords.length; i++){
 FWwords[i].run();
 boolean temp = true;
 temp = FWwords[i].checkForLife();
 if(temp == false){
   int wordIndex = (int)random(fWord.length);
float y = random(height);
 FWwords[i] = new FloatingWords(y, fWord[wordIndex]);
 }
}
  
}

// class FloatingWords
//
// 
class FloatingWords {

  float x, y;
  String word;
  float nOff_x;
  float nOff_y;
  float size_font;
  float size_shape;
boolean life;
  color zone1;
color zone2;
color zone3;
color zone4;
color fillColour;
int mNumberOfWords;
float factor;
float timeThen;
float timeNow;
int growthFactor;
float fade;
float fadeFactor;

  FloatingWords(float y_, String w_) {
life=true;
    
    y = y_;
    nOff_x = random(3000);
    nOff_y = random(3000);
    word = w_;
    
    //// randomly capitalise letters within the words
   String w_UpperCase = word.toUpperCase();
    
    for(int i=0;i<word.length();i++){
   // noise
    float mNoise = noise(i+random(2));
    if(mNoise>0.5){
     word = replaceCharAt(word, i, w_UpperCase.charAt(i));
    }
  }
    

    textAlign(CENTER);
    size_font = random(10, 100);
    size_shape = size_font + random(10, 50);
 x = random(textWidth(word),width-textWidth(word)/2);
 
    float wid=textWidth(word);
float wid_tw=width-textWidth(word)/2;

println("word  "+word+"   text width  "+wid+"  wid-TW  "+wid_tw+"  x  "+x);
    timeThen = minute()*60+second()+millis()/1000;
growthFactor = (int)random(2);
if(growthFactor==0){
growthFactor = -1;}
else
{growthFactor = 1;
}

//fade the words out
fade = 255;
fadeFactor=1;


    colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100
  color zone1 = color(336,100,100);
color zone2 = color(246,100,100);
color zone3 = color(66,100,100);
color zone4 = color(156,100,100);
if(x<width/2 && y<height/2){
  fillColour = zone1;
}
if(x>=width/2 && y<height/2){
  fillColour = zone2;

}
if(x<width/2 && y>=height/2){
  fillColour = zone3;

}
if(x>=width/2 && y>=height/2){
  fillColour = zone4;
}


}


    // capitalise letters within the words
    String replaceCharAt(String s, int pos, char c) {
      char[] ch = new char[s.length()];
      s.getChars(0, ch.length, ch, 0);
      ch[pos] = c;
      return new String(ch);
    }


  int numberOfWords(){
    return mNumberOfWords;
  }

  void run() {


    // speed of motion
    nOff_x += 0.0005;
    nOff_y += 0.0003;

    x = width*noise(nOff_x);
    y = height*noise(nOff_y);

    visual();
  }

  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual() {
timeNow = minute()*60+second()+millis()/1000;
factor = (timeNow-timeThen)*growthFactor;
textSize(size_font+factor);
    
   if(textWidth(word) > width*0.7 && growthFactor>0){
     fill(156,100,100,fade);
     fade= fade - fadeFactor;
     if(fade<10){
        life = false;}}
else
   { fill(fillColour);}
      noStroke();
      text(word, x, y);
//      colourMod();
      
      if(textAscent() < 1){
        life = false;}
        
        
  }
  
  boolean checkForLife(){
    return life;
  }
  
  void colourMod(){
    loadPixels();
 int count =0;
 for(int i = 0; i<=height-textAscent();i++){
   for(int j = 0;j<=width;j++){
     if(pixels[count] == zone1 && i<height/2 && j<width/2){
       pixels[count] = zone4;}
     if(pixels[count] == zone2 && i<height/2 && j>width/2){
       pixels[count] = zone3;}
       if(pixels[count] == zone3 && i>=height/2 && j<=width/2){
       pixels[count] = zone2;}
       if(pixels[count] == zone4 && i>=height/2 && j>=width/2){
       pixels[count] = zone1;}
        count++;
   }}
   updatePixels();
   count =0;
   
  }
}



