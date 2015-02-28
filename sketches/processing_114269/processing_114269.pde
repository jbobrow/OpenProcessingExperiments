
import ddf.minim.*;  

Minim minim;
AudioPlayer song1, song2;
AudioSample scream;

PImage bg;
PFont font;

void setup(){
bg=loadImage("background.gif"); //load background picture
size(320,289);
font=loadFont("DFYun.vlw"); //load font
textFont(font);
minim=new Minim(this);
song1=minim.loadFile("love.mp3");  //load songs
song2=minim.loadFile("SoleMar.mp3");
scream=minim.loadSample("scream.mp3");

}

void draw(){
  background(bg);
  textSize(36);
  textAlign(CENTER);
  fill(139,0,139);
  text("Music Player",184,83);
  
  textSize(26);
  fill(255,127,127); 
 textAlign(LEFT); 
  text("There are a total of 3 songs.",50,120);
  text("Press button 1, 2, 3",50,160);
  text("to listen them.",50,200);
}

void keyPressed(){
  if(key=='1'){  //when the key is pressed, if "song2" is playing then it will stop and starts to play "song1"
    song2.pause();
    song1.play();
  }else if(key=='2'){
    song1.pause();
    song2.play();
  }else if(key=='3'){ //play the sample "scream"
    scream.trigger();
  }
}

