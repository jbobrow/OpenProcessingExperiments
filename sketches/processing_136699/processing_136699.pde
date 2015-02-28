
//this is my final project, I want to create like a tool to draw with rectangles some lines and at the same time to share different pics of beautiful beaches
//At the beginning the window is filled with only a color, and if you press the button of your mouse you will draw different rectangles into the window
//if you press the key delete or backspace you will delete all that you have drawn and the window will be filled with a beautiful pic of a beach
//if you press the key enter or return you will see 4 beautiful pics of different beaches
// if you press the key w or W you will listen the sound of the waves of the sea
//description about my job

//import sound
import ddf.minim.*;
Minim minim;
AudioSample waves; //the name of my audiosample variable


//global variable
PImage beach; //global variables to my images
PImage playa;
PImage playa2;
PImage playa3;
PImage playa4;

color [] palette = {#1C418C,#2450A6,#3F77BF,#66A3D9,#B4CBD9};// variable for the color palette

//setup()
void setup(){
  size(900,675);//the size of the canvas
  background(#19EFF5);//the color 
  beach=loadImage("beach.jpg");//the PImage variable beach will load the beach.jpg file 
  playa=loadImage("playa.jpg");//the PImage variable playa will load the playa.jpg file 
  playa2=loadImage("playa2.jpg");//the PImage variable playa2 will load the playa2.jpg file 
  playa3=loadImage("playa3.jpg");//the PImage variable playa3 will load the playa3.jpg file 
  playa4=loadImage("playa4.jpg");//the PImage variable playa4 will load the playa4.jpg file 
  
  minim=new Minim(this);
  waves= minim.loadSample("waves.mp3");  //the audiosample variable called will load the file waves.mp3
}
//draw()
void draw(){
  if(mousePressed){//if we press the mouse 
    pushMatrix();
    translate(mouseX,mouseY);//variables to the x and y mouse situation
   fill(palette[int(random(5))]);//will fill the rectangle with a random color from my palette
  noStroke();//it won't have a stroke
  rect(0,0,50,50);//the coordinates and size of the rectangle
  popMatrix();
  
  } 

}
//keyPressed()
void keyPressed(){//actions if we press a key
  if (key==DELETE ||key==BACKSPACE) { //if we press the key delete or backspace
    image(beach,0,0);} //we will load the image called beach 
  if (key==ENTER || key==RETURN) { //if we press the key enter or return
    image(playa,0,0,width/2,height/2);//we will load this four images
    image (playa2,width/2,0,width/2,height/2);
    image (playa3,0,height/2,width/2,height/2);
    image (playa4,width/2,height/2,width/2,height/2);
}
  if (key=='w' || key=='W'){ //if we press the key w or W we will listen the sound of the waves of the sea
    waves.trigger();
  }
}


  
  


