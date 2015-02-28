
import ddf.minim.*;

Minim minim;
AudioSample laser;
AudioPlayer bgm;
int numFrames = 3;
int i=0;
int x=250,y=650;
PImage[] zam = new PImage[numFrames];
PImage p51,bg;
void setup(){
  size(500,700);
  zam[0] = loadImage("zam.gif");
  zam[1] = loadImage("zam02.gif");//set up the image can be change
  p51=loadImage("p51.gif");//set up the image which player's use
  bg=loadImage("bg.jpg");//set up background image
  bg.resize(500,700);
    minim = new Minim(this);
    laser = minim.loadSample("laser.mp3");//set up sound effect
  bgm = minim.loadFile("bgm.mp3");//set up background music
  bgm.loop();
}

void draw(){
  background(bg);
  imageMode(CENTER);
  image(p51,20,670,30,30);
  image(p51,55,670,30,30);
  image(p51,90,670,30,30);//set up there is any life you still have
  
  image(p51,x,y,70,70);//set up the fighter for player
  assi(x+50,y-5);
  assi(x-50,y-5);
  assi(x+70,y+20);
  assi(x-70,y+20);//set up the assi for players to fight
  frameRate(10);
  image(zam[i],random(150,450),random(150,250),300,350);
  if (mousePressed){
    laser();        //laser will be shoot when pressing the mouse
    laser.trigger();//the sound effect will be played when pressing the mouse
    i=1;}
  else{
      i=0;}      //when mouse is pressed,image[zam]will be hit and change the color
}
void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      y=y-10;}
    else if(keyCode==DOWN){
      y=y+10;}
    else if(keyCode==RIGHT){
      x=x+10;}
    else if(keyCode==LEFT){
      x=x-10;}       // using keyboard to contral the fighter move
  }
}

void assi(int ax,int ay){
  stroke(0);
  strokeWeight(3);
  fill(48,0,240);
  rectMode(CENTER);
  rect(ax,ay,15,15);
  rect(ax,ay,5,25);
  fill(0);
  stroke(0);
  strokeWeight(3);
  ellipseMode(CENTER);
  ellipse(ax,ay+5,15,15); // user function of assi
}
void laser(){
  
    stroke(0,48,210);
    strokeWeight(5);
    line(x+50,y-22,x+50,y-800);
    line(x-50,y-22,x-50,y-800);
    line(x+70,y+3,x+70,y-800);
    line(x-70,y+3,x-70,y-800); 
    
    stroke(255);
    strokeWeight(1);
    line(x+50,y-22,x+50,y-800);
    line(x-50,y-22,x-50,y-800);
    line(x+70,y+3,x+70,y-800);
    line(x-70,y+3,x-70,y-800);
    
    stroke(0,213,16);
    strokeWeight(6);
    line(x+13,y-15,x+13,y-800);
    line(x-13,y-15,x-13,y-800);
    
    stroke(0,48,210);
    strokeWeight(2);
    line(x+13,y-15,x+13,y-800);
    line(x-13,y-15,x-13,y-800);//user function of the laser
}


