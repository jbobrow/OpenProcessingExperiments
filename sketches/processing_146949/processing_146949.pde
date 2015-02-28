
import ddf.minim.*;
String title = "--*--*-KEY JAM--*-*";
PImage music;
String function_EffectsToggle = "Effects ON/OFF";
PFont f1, f2, f3;
Boolean eof;
ArrayList particles;
ArrayList particles2;
Minim m;
AudioPlayer note;
int c1=255,c2=255,c3=255,c4=255,c5=255,c6=255;

//Number of minor and major keys, organize them by groups
int numMajorKeys = 14;
int numMinorKeys1 = 2;
int numMinorKeys2 = 3;
int numMinorKeys3 = 2;
int numMinorKeys4 = 3;

//Initialize the groups of minor and major keys
circKey[] majorKeys = new circKey[numMajorKeys];
circKey[] minorKeys1 = new circKey[numMinorKeys1];
circKey[] minorKeys2 = new circKey[numMinorKeys2];
circKey[] minorKeys3 = new circKey[numMinorKeys3];
circKey[] minorKeys4 = new circKey[numMinorKeys4];

PianoKeys[] p = new PianoKeys[25];

void setup(){
 music = loadImage("music.jpg");
 
 eof = true;
 int xPos=130;
 int yPos=200;
 particles = new ArrayList();
 particles2 = new ArrayList();
 
 background(0);
 size(800,300); 
 f1 = createFont("Papyrus", 16, true);
 f2 = createFont("Arial", 10, true);
 f3 = createFont("Arial", 10, true);

 //create array of major keys
 for (int i=0; i <numMajorKeys; i++){
   majorKeys[i] = new circKey(xPos,yPos,255);
   xPos+=40;
 }
 xPos = 150;
 yPos = 180;
 
 //create array of 1st minor group keys
 for (int i=0; i <numMinorKeys1; i++){
   minorKeys1[i] = new circKey(xPos,yPos,60);
   xPos+=40;
 }
 xPos = 271;
 yPos = 180;
 
 //create array of 2nd minor group keys
 for(int i=0; i <numMinorKeys2; i++){
   minorKeys2[i] = new circKey(xPos,yPos,60);
   xPos+=40;
 }
 xPos = 428;
 yPos = 180;
 
 //create array of 3rd minor group keys
 for(int i=0; i <numMinorKeys3; i++){
   minorKeys3[i] = new circKey(xPos,yPos,60);
   xPos+=40;
 }
 xPos = 548;
 yPos = 180;
 
 //create array of 4th minor group keys
 for(int i=0; i <numMinorKeys4; i++){
   minorKeys4[i] = new circKey(xPos,yPos,60);
   xPos+=40;
 }
 
 //create the individual notes
 m = new Minim(this);
 p[0] = new PianoKeys("C","Piano11.mp3",0);
 p[1] = new PianoKeys("C#","Piano12.mp3",1);
 p[2] = new PianoKeys("D","Piano13.mp3",2);
 p[3] = new PianoKeys("D#","Piano14.mp3",3);
 p[4] = new PianoKeys("E","Piano15.mp3",4);
 p[5] = new PianoKeys("F","Piano16.mp3",5);
 p[6] = new PianoKeys("F#","Piano17.mp3",6);
 p[7] = new PianoKeys("G","Piano18.mp3",7);
 p[8] = new PianoKeys("G#","Piano19.mp3",8);
 p[9] = new PianoKeys("A","Piano110.mp3",9);
 p[10] = new PianoKeys("A#","Piano111.mp3",10);
 p[11] = new PianoKeys("B","Piano112.mp3",11);
 p[12] = new PianoKeys("C","Piano113.mp3",12);
 p[13] = new PianoKeys("C#","Piano114.mp3",13);
 p[14] = new PianoKeys("D","Piano115.mp3",14);
 p[15] = new PianoKeys("D#","Piano116.mp3",15);
 p[16] = new PianoKeys("E","Piano117.mp3",16);
 p[17] = new PianoKeys("F","Piano118.mp3",17);
 p[18] = new PianoKeys("F#","Piano119.mp3",18);
 p[19] = new PianoKeys("G","Piano120.mp3",19);
 p[20] = new PianoKeys("G#","Piano121.mp3",20);
 p[21] = new PianoKeys("A","Piano122.mp3",21);
 p[22] = new PianoKeys("A#","Piano123.mp3",22);
 p[23] = new PianoKeys("B","Piano124.mp3",23);
}

void draw(){
  background(0);
  music.resize(0,160);
  image(music,292,15);
  //Begin to draw all key groups
  for(int i=0; i<numMajorKeys; i++){
    majorKeys[i].display();
  }
  for(int i=0; i<numMinorKeys1; i++){
    minorKeys1[i].display();
  }
  for(int i=0; i<numMinorKeys2; i++){
    minorKeys2[i].display();
  }
  for(int i=0; i<numMinorKeys3; i++){
    minorKeys3[i].display();
  }
  for(int i=0; i<numMinorKeys4; i++){
    minorKeys4[i].display();
  }
  
  //Add particle animation1
  if(eof){
    particles.add(new Particle(307,272));
    for(int i=0; i<particles.size(); i++){
      Particle p = (Particle) particles.get(i);
      p.runLeft();
      p.display();
    }
    
    particles2.add(new Particle(468,272));
    for(int i=0; i<particles2.size(); i++){
      Particle p = (Particle) particles2.get(i);
      p.runRight();
      p.display();
    }
  }else{
   particles.clear();
   particles2.clear(); 
  }
  
  if(particles.size() > 80){
    particles.remove(0);
  }
  if(particles2.size() > 80){
    particles2.remove(0);
  }
  fill(200,220,230);
  textFont(f1,20);
  text(title, 290,280);
  textFont(f3,12);
  if((mouseX>=0 && mouseX<80) && (mouseY>=15 && mouseY<26)){
    c5=0;
    c6=0;
  }else{
    c5=255;
    c6=255;
  }
  fill(c4,c5,c6);
  text(function_EffectsToggle, 0, 24);
}

//Plays note depending on key
void keyPressed() {
   if(key=='a'){ 
     p[0].playKey();
     majorKeys[0].isColored();
   }   
   if(key=='q'){ 
     p[1].playKey();
     minorKeys1[0].isColored();
   }
   if(key=='s'){
     p[2].playKey();
     majorKeys[1].isColored();
   }
   if(key=='w'){ 
     p[3].playKey();
     minorKeys1[1].isColored();
   }
   if(key=='d'){ 
     p[4].playKey();
     majorKeys[2].isColored();
   }
   if(key=='f'){ 
     p[5].playKey();
     majorKeys[3].isColored();
   }
   if(key=='r'){
     p[6].playKey();
     minorKeys2[0].isColored();
   }
   if(key=='g'){
     p[7].playKey();
     majorKeys[4].isColored();
   }
   if(key=='t'){
     p[8].playKey();
     minorKeys2[1].isColored();
   }
   if(key=='h'){ 
     p[9].playKey();
     majorKeys[5].isColored();
   }
   if(key=='y'){ 
     p[10].playKey();
     minorKeys2[2].isColored();
   }
   if(key=='j'){
     p[11].playKey();
     majorKeys[6].isColored();
   }
   if(key=='k'){ 
     p[12].playKey();
     majorKeys[7].isColored();
   }
   if(key=='i'){ 
     p[13].playKey();
     minorKeys3[0].isColored();
   }
   if(key=='l'){
     p[14].playKey();
     majorKeys[8].isColored();
   }
   if(key=='o'){ 
     p[15].playKey();
     minorKeys3[1].isColored();
   }
   if(key=='p'){ 
     p[16].playKey();
     majorKeys[9].isColored();
   }
   if(key=='z'){
     p[17].playKey();
     majorKeys[10].isColored();
   }
   if(key=='x'){
     p[18].playKey();
     minorKeys4[0].isColored();
   }
   if(key=='c'){ 
     p[19].playKey();
     majorKeys[11].isColored();
   }
   if(key=='v'){ 
     p[20].playKey();
     minorKeys4[1].isColored();
   }
   if(key=='b'){ 
     p[21].playKey();
     majorKeys[12].isColored();
   }
   if(key=='n'){ 
     p[22].playKey();
     minorKeys4[2].isColored();
   }
   if(key=='m'){ 
     p[23].playKey();
     majorKeys[13].isColored();
   }
}

//Removes key indicator light
void keyReleased(){
  for(int i=0; i<majorKeys.length; i++){
   majorKeys[i].unColor();
  }
  for(int i=0; i<minorKeys1.length; i++){
    minorKeys1[i].unColor();
    minorKeys3[i].unColor();
  }
  for(int i=0; i<minorKeys2.length; i++){
    minorKeys2[i].unColor();
    minorKeys4[i].unColor();
  }
}

void mouseClicked(){
  if((mouseX>=0 && mouseX<80) && (mouseY>=15 && mouseY<26)){
    if(eof){
     eof=false; 
    }else{
      eof=true;
    }
  }
}


//Class that stores, draws, and saves information of individual keys 
class circKey{
  float r;
  int xPos, yPos;
  color c;

  Boolean fillIt = false;  circKey(int xPos, int yPos, color c){
    this.xPos = xPos;
    this.yPos = yPos;
    this.c = c;
    r=10;
  }
  void display(){
    noFill();
    if(fillIt){
     fill(255,0,0); 
    }
    stroke(c);
    ellipse(xPos,yPos,r,r);
  }
  int getX_Coord(){
    return this.xPos;
  }
  int getY_Coord(){
    return this.yPos;
  }

  void isColored(){
    fillIt = true;
  }
  void unColor(){
    fillIt = false; 
  }
}

//Plays piano note depending on key pressed
class PianoKeys{
  String note1;
  String fileName1;
  int code1;
  PianoKeys(String notez, String fileName, int code){
   note1 = notez;
   fileName1 = fileName;
   code1 = code; 
  }
  void playKey(){
    note = m.loadFile(fileName1,3000);
    note.play();
  }
  int returnCode(){
    return code1;
  }
}
















class Particle{
  float xPos, yPos;
  float speedX, speedY;
  Boolean onOff;
  
  Particle(float xPos, float yPos){
    this.xPos = xPos;
    this.yPos = yPos;
    speedX = random(1,3);
    speedY = random(1,3);
    onOff = true;
  }
  void runLeft(){
    xPos-=speedX;
    yPos-=speedY;
  }
  void runRight(){
    xPos+=speedX;
    yPos-=speedY;
  }
  
  void display(){
    if(onOff){
      stroke(200,155,255);
      ellipse(xPos, yPos,.5,.5);
    }
  }
}



