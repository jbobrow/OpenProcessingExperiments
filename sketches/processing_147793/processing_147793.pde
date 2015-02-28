
//Risa Hiyama 
//Project 01 
//Game discription : Eat the fruit to win!
//You will need a FaceOSC to function this game

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// a template for receiving face tracking osc messages from
// Kyle McDonald's FaceOSC https://github.com/kylemcdonald/ofxFaceTracker
//
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
//
// adapted from from Greg Borenstein's 2011 example
// http://www.gregborenstein.com/
// https://gist.github.com/1603230


import oscP5.*;
OscP5 oscP5;

Minim minim;
AudioPlayer s1,s2,s3;



// num faces found
int found;

// pose
float poseScale;
PVector posePosition = new PVector();
PVector poseOrientation = new PVector();

// gesture
float mouthHeight;
float mouthWidth;
float eyeLeft;
float eyeRight;
float eyebrowLeft;
float eyebrowRight;
float jaw;
float nostrils;

color yellow=color(255, 185, 15);
color red=color(255, 106, 106);
color orange=color(255, 127, 36);
color brown=color(139, 71, 38);
color []fruitColor = {red,yellow,orange,brown};

float []xFood = new float[4] ;
float []yFood = new float[4] ;

//to count things 
int life;
int energy;
int startTime, currentTime, timeLimit, timeLapsed;
boolean gameOn;

void setup() {
  //setting up general rule 
  size(640, 480);
  noCursor();
  frameRate(30);
  textSize( 24 );
  
  minim = new Minim(this);
  s1 = minim.loadFile("S1.wav");

  //life and death
  life = 3;
  energy =0;
  timeLimit = 30;
  
  //faceOSC function
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "posePosition", "/pose/position");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "eyeLeftReceived", "/gesture/eye/left");
  oscP5.plug(this, "eyeRightReceived", "/gesture/eye/right");
  oscP5.plug(this, "eyebrowLeftReceived", "/gesture/eyebrow/left");
  oscP5.plug(this, "eyebrowRightReceived", "/gesture/eyebrow/right");
  oscP5.plug(this, "jawReceived", "/gesture/jaw");
  oscP5.plug(this, "nostrilsReceived", "/gesture/nostrils");
 
 //show  food at random location
 for(int i=0; i<xFood.length; i++){
   xFood[i]=random(width/4,width*3/4);
   yFood[i]=random(height/4,height*3/4);
 }
}

void prepareWindow( )
{
   rect( 0, 0, width*2, height*2 );
}

void showInstructions( ){
//is only don once so it has to quit soon 
//so i used keyPressed so that when a key is pressed the game starts

   // background(0);
   //why dont it cover the whole thing?
   fill(255);
   text("See the fruit?", 10, 50 );
   text("Eat it to gain energy!", 10, 80 );
   text("How good are you??? -- Give it a try!!!" , 10, 110 ); 
   text("Get 3 fruit before it reaches 30 seconds!", 10, 210);
   text("You will lose lives if you eat the bomb!", 10, 240);
   text("You have 3 lives!", 10, 270);
   text("Press any key to start.", 10, 300 );
}

void keyPressed ()
{ 
  if (!gameOn){
   gameOn=true;
   startTime = millis( );  // start the clock
  }
}

void draw() {  
  prepareWindow();
  if (!gameOn){//if no key is pressed 
    background(brown);
    showInstructions( );
  }
  
  //start the game 
  else {
      stroke(0);
      background(255);
      
      drawFace();
      drawFood();
      checkLife();
      if (!(timeLimit-timeLapsed <= 0)){
        showTime();
      }
      //if the mouth center hits the color while opening the mouth
      //change the location, add energy if ftuit, take away life it bomb
      //I got the mouth position by looking at println data 
      color pixelColor = get(int(posePosition.x),int(posePosition.y)+10);
      if( mouthHeight >5 ){
        if( pixelColor == red ) {
          xFood[0]=random(width/4,width*3/4);
          yFood[0]=random(height/4,height*3/4);
          background(255, 20, 147);
          energy++;
          s1.play();
          s1.rewind();
        }
        if( pixelColor == yellow ) {
          xFood[1]=random(width/4,width*3/4);
          yFood[1]=random(height/4,height*3/4);
          background(255, 20, 147);
          energy++;
          s1.play();
          s1.rewind();
        }
        if( pixelColor == orange ) {
          xFood[2]=random(width/4,width*3/4);
          yFood[2]=random(height/4,height*3/4);
          background(255, 20, 147);
          energy++;
          s1.play();
          s1.rewind();
          }
        if( pixelColor == brown ) {
          xFood[3]=random(width/4,width*3/4);
          yFood[3]=random(height/4,height*3/4);
          background(139, 105, 105);
          life--;
        }
      }    
   }
}


// OSC CALLBACK FUNCTIONS
// I had to get rid of the scale and tranlate funtion so that 
// I can write other things on the canvas
void drawFace(){
  if(found > 0) {
    //translate(posePosition.x, posePosition.y);
    //scale(poseScale);
    
    noFill();
    ellipse(posePosition.x-60, posePosition.y+eyeLeft * -27, 60, 21);
    ellipse(posePosition.x+60, posePosition.y+eyeRight * -27, 60, 21);
    ellipse(posePosition.x, posePosition.y+10, mouthWidth* 9, mouthHeight * 9);
    ellipse(posePosition.x-15, posePosition.y+nostrils * - 6, 21, 9);
    ellipse(posePosition.x+15, posePosition.y+nostrils * - 6, 21, 9);
    rectMode(CENTER);
    fill(0);
    rect(posePosition.x-60, posePosition.y+eyebrowLeft * -15, 75, 15);
    rect(posePosition.x+60, posePosition.y+eyebrowRight * -15, 75, 15);
  }
}


void drawFood(){
  for(int i=0; i<xFood.length; i++){ 
    noStroke();
    fill(fruitColor[i]);
    if( fruitColor[i] == red ) {
      ellipse(xFood[i],yFood[i],45,42); 
      triangle(xFood[i]+3,yFood[i]-30,xFood[i],yFood[i]-15,xFood[i]-3,yFood[i]-30);
      triangle(xFood[i]-2,yFood[i]-25,xFood[i]+10,yFood[i]-23,xFood[i]+15,yFood[i]-33);
    }    
    else if( fruitColor[i] == orange ) {
      ellipse(xFood[i],yFood[i],44,44); 
      triangle(xFood[i],yFood[i]-33, xFood[i]+5,yFood[i]-15, xFood[i]-5,yFood[i]-15 );
      triangle(xFood[i]+3,yFood[i]-25,xFood[i]-10,yFood[i]-20,xFood[i]-18,yFood[i]-30);  
    }
    else if( fruitColor[i] == yellow ) {
      ellipse(xFood[i],yFood[i],35,42); 
      triangle(xFood[i]+3,yFood[i]-22,xFood[i]-10,yFood[i]-27,xFood[i]-5,yFood[i]-21);
      triangle(xFood[i]-3,yFood[i]-22,xFood[i]+10,yFood[i]-27,xFood[i]+5,yFood[i]-21);
     
      triangle(xFood[i]-2,yFood[i]-24,xFood[i]+5,yFood[i]-26,xFood[i]+10,yFood[i]-36);
      triangle(xFood[i]+2,yFood[i]-24,xFood[i]-5,yFood[i]-26,xFood[i]-10,yFood[i]-36);

      triangle(xFood[i]+1,yFood[i]-45,xFood[i],yFood[i]-25,xFood[i]-5,yFood[i]-35);
      triangle(xFood[i]-1,yFood[i]-45,xFood[i],yFood[i]-25,xFood[i]+5,yFood[i]-35);
    }
     else if( fruitColor[i] == brown ) {     
     ellipse(xFood[i],yFood[i],40,40); 
     rect(xFood[i]-5,yFood[i]-22,10,5);
     
     strokeWeight(1.5);
     stroke(brown);  
     noFill(); 
     beginShape();   
     curveVertex(xFood[i]-4,yFood[i]-28);
     curveVertex(xFood[i]-4,yFood[i]-28);
     curveVertex(xFood[i],yFood[i]-26);
     curveVertex(xFood[i],yFood[i]-25); 
     curveVertex(xFood[i],yFood[i]-23);
     curveVertex(xFood[i],yFood[i]-20);
     endShape(CLOSE);
    
     noStroke();
     fill(brown);
     beginShape();
     vertex(xFood[i]-10, yFood[i]-30-50/5);
     vertex(xFood[i]-10+14/6, yFood[i]-30-20/6);
     vertex(xFood[i]-10+47/6, yFood[i]-30-15/6);
     vertex(xFood[i]-10+23/6, yFood[i]-30+7/6);
     vertex(xFood[i]-10+29/6, yFood[i]-30+40/6);
     vertex(xFood[i]-10, yFood[i]-30+25/6);
     vertex(xFood[i]-10-29/6, yFood[i]-30+40/6);
     vertex(xFood[i]-10-23/6, yFood[i]-30+7/6);
     vertex(xFood[i]-10-47/6, yFood[i]-30-15/6);
     vertex(xFood[i]-10-14/6, yFood[i]-30-20/6);
     endShape(CLOSE);     
    }
  }
}


public void found(int i) {
  println("found: " + i);
  found = i;
}

public void poseScale(float s) {
  println("scale: " + s);
  poseScale = s;
}

public void posePosition(float x, float y) {
  println("pose position\tX: " + x + " Y: " + y );
  posePosition.set(x, y, 0);
}

public void poseOrientation(float x, float y, float z) {
  println("pose orientation\tX: " + x + " Y: " + y + " Z: " + z);
  poseOrientation.set(x, y, z);
}

public void mouthWidthReceived(float w) {
  println("mouth Width: " + w);
  mouthWidth = w;
}

public void mouthHeightReceived(float h) {
  println("mouth height: " + h);
  mouthHeight = h;
}

public void eyeLeftReceived(float f) {
  println("eye left: " + f);
  eyeLeft = f;
}

public void eyeRightReceived(float f) {
  println("eye right: " + f);
  eyeRight = f;
}

public void eyebrowLeftReceived(float f) {
  println("eyebrow left: " + f);
  eyebrowLeft = f;
}

public void eyebrowRightReceived(float f) {
  println("eyebrow right: " + f);
  eyebrowRight = f;
}

public void jawReceived(float f) {
  println("jaw: " + f);
  jaw = f;
}

public void nostrilsReceived(float f) {
  println("nostrils: " + f);
  nostrils = f;
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if(m.isPlugged() == false) {
    println("UNPLUGGED: " + m);
  }
}

//----------------------------------------------------------------------------
//game function

void checkLife()
{
   if (timeLimit-timeLapsed <= 0)
     gameOver("you lose");
}

void gameOver(String text){
      background( brown );
      textSize( 30 );
      fill(255);
      text( "Energy earned: " + energy, width/2, height-50 ); 
      currentTime = millis( );
      timeLapsed = (currentTime - startTime)/1000;  // covert to seconds
      
      //great (no collision) . good (1-3 collision) . bad (4-5 collision) 
      if ( life <= 0 || energy <=3 ){
        
        text( "You lost!", width/2, height/2 ); 
      }
      else if ( life >= 1 ) {
        text( "You won!", width/2, height/2 ); 
      }
      noLoop( );  // stops iteration of draw( )
} 

void showTime( )
{
  fill( brown );
  text( "Energy: ", width/2+130, height-50 );
  rect( width/2+225, height-55, energy*10,20);
  
  currentTime = millis( );
  timeLapsed = (currentTime - startTime)/1000;  // covert to seconds
  text( "Time: " + (timeLimit-timeLapsed), width/2+130, height - 80 ); 
  text( "Life: " + (life), width/2+130, height - 110 ); 
}


