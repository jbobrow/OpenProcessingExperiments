

//Key Controls:
 //s = background mode: constant background and use shader as fill
 //S = shader background mode: shader is background only
 //1 = use first shader
 //2 = use 2nd shader
 //b = display and use boundaries -- I need to fix this to toggle off/on, and also to make boundaries out of box2d world if no boundaries
 //f = reduce attraction force by 10% 
 //F = increase attraction force by 10%
 //p = particle system; P = box system

// in Box class, 
//     I changed: body.applyForce(worldTarget, bodyVec);
//     to:        body.applyLinearImpulse(worldTarget, bodyVec);
// strength of force is controlled in Class Box: attract function
//
//Mouse: I changed so that attraction is always to the center, not to the mouse position
//Click Mouse Button to Add Boxes
//

import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

import ddf.minim.*;
import ddf.minim.signals.*;  //redundant???
import ddf.minim.analysis.*;

//import controlP5.*;

//import java.util.*;
//import java.text.DecimalFormat;
//import java.lang.Math;

//ControlP5 cp5;
//DropdownList d1;
//DropdownList d2;
//MyDropdownList d2;



// Our "blob" object
Blob blob;

Minim minim;
AudioPlayer mySound;
FFT fftLog;

/*PShader shader1;
PShader shader2;
PShader shader3;
PShader shader4;
PShader shader5;
PShader shader6;
PShader shader7;
PShader shader8;
PShader shader9; */
int shader_num = 4;
//float shader_freq = 500;
float [] shader_freqa = new float[10];
PImage tex00;  //some shaders require (or optional) a PImage to be set as a channel

PImage node_img;
PImage [] node_img_array = new PImage[30];
PImage img_glob;
PImage [] img_array = new PImage[30];


int shade_back = 0;
int bound = 1;

float new_circle_size = 7;
float force = new_circle_size;
float factor = 0.67;
int circle_size = 7;



int particles_on = 0;
int num = 2000; //how many particles we'll have in the system. More particles = slower sketch.
Particle[] particle = new Particle[num]; //Initialise array of particles of length "num"

//for delayed start of music
int savedTime;
int totalTime = 5000;
int node_time = 20000;

float spectrumScale = 4;

// A reference to our box2d world
PBox2D box2d;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

int numNodes;
ArrayList nodes;
int locs; //spacing of locations
int cur_loc;   //x coordingate location of current node
int cur_locy;   //y coordingate location of current node

float force_strength = 0.8;
boolean Shader_On = false;
int gravity = -300;


//----------------------------------------------------------------------------

void setup() {
  size(1280,720);
  colorMode(HSB,358);  //100 defines the range of values 0 - 100
  smooth();
  
/* cp5 = new ControlP5(this);
 
  // create a toggle
  cp5.addToggle("Shader_On")
     .setPosition(490,15)
     .setSize(30,30)
     ;
     
      // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("gravity")
     .setPosition(300,45)
     .setSize(100,20)
     .setRange(-500,0)
     .setValue(-300)
     ;
 
 // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("force_strength")
     .setPosition(300,15)
     .setSize(100,20)
     .setRange(0.1,3.0)
     .setValue(0.8)
     ;
 
  // create a DropdownList
  d1 = cp5.addDropdownList("myList-d1")
          .setPosition(10, 30)
          .setSize(100,100)
          ;
          
  customize(d1); // customize the first list
  d1.captionLabel().set("Objects");
  d1.addItem("fish", 1);
  d1.addItem("smiley", 2);
  d1.addItem("smiley", 3);
  d1.addItem("eyeball green", 4);
  d1.addItem("banana", 5);
  d1.addItem("domi head", 6);
  d1.addItem("obama smiling", 7);
  d1.addItem("obama 2", 8);
  d1.addItem("ice cream", 9);
  d1.addItem("bones", 10);
  d1.addItem("angry_bird", 11);
  d1.addItem("angry_bird", 12);
  d1.addItem("twitter_bird2", 13);
  d1.addItem("macaw_bird", 14);
  d1.addItem("macaw_bird", 15);
  d1.addItem("angry_tucan", 16);
  d1.addItem("angry_tucan", 17);
  d1.addItem("abstract_butterfly", 18);
  d1.addItem("purple_butterfly", 19);
  d1.addItem("red_butterfly", 20);
  d1.addItem("bandw_butterfly", 21);
  d1.addItem("mermaid", 22);
  d1.addItem("mermaid", 23);
  d1.addItem("foot", 24);
  d1.addItem("real_foot", 25);
  
 
  
  img_array[1] = loadImage("Fish_png.png");
  img_array[2] = loadImage("smiley.png");
  img_array[3] = loadImage("smiley.png");
  img_array[4] = loadImage("eye_green.png");
  img_array[5] = loadImage("banana.png");
  img_array[6] = loadImage("domi_head.png");
  img_array[7] = loadImage("obama_smile.png");
  img_array[8] = loadImage("obama.png");
  img_array[9] = loadImage("ice_cream.png");
  img_array[10] = loadImage("bone.png");
  img_array[11] = loadImage("angry_bird.png");
  img_array[12] = loadImage("angry_bird.png");
  img_array[13] = loadImage("twitter_bird2.png");
  img_array[14] = loadImage("macaw_bird.png");
  img_array[15] = loadImage("macaw_bird.png");
  img_array[16] = loadImage("angry_tucan.png");
  img_array[17] = loadImage("angry_tucan.png");
  img_array[18] = loadImage("abstract_butterfly.png");
  img_array[19] = loadImage("purple_butterfly.png");
  img_array[20] = loadImage("red_butterfly.png");
  img_array[21] = loadImage("bandw_butterfly.png");
  img_array[22] = loadImage("mermaid.png");
  img_array[23] = loadImage("mermaid.png");
  img_array[24] = loadImage("foot.png");
  img_array[25] = loadImage("real_foot.png");
  
   
  // create a second DropdownList
  d2 = cp5.addDropdownList("myList-d2")
          .setPosition(120, 30)
          .setSize(100,100)
          ;
  
  customize(d2); // customize the second list
  d2.captionLabel().set("Nodes");
  //d2.setIndex(10);
  d2.addItem("shark", 1);
  d2.addItem("smiley", 2);
  d2.addItem("eyeball green", 3);
  d2.addItem("brain", 4);
  d2.addItem("boob", 5);
  d2.addItem("lips rocky", 6);
  d2.addItem("lips2", 7);
 // d2.addItem("skull", 8);
 // d2.addItem("tree", 9);
  d2.addItem("butt 1", 8);
  d2.addItem("butt 2", 9);   
  d2.addItem("skull", 10);
  d2.addItem("tree", 11);
  d2.addItem("heart", 12);
  d2.addItem("bubble", 13);
  d2.addItem("afro", 14);
  d2.addItem("abstract_butterfly", 15);
  
  
  node_img_array[1] = loadImage("Brain_png.png");
  node_img_array[2] = loadImage("smiley.png");
  node_img_array[3] = loadImage("eye_green.png");
  node_img_array[4] = loadImage("Brain_png.png");
  node_img_array[5] = loadImage("boob2.png");
  node_img_array[6] = loadImage("lips_rocky.png");
  node_img_array[7] = loadImage("lips2.png");
  node_img_array[8] = loadImage("ass1.png");
  node_img_array[9] = loadImage("ass2.png");
  node_img_array[10] = loadImage("skull.png");
  node_img_array[11] = loadImage("tree.png");
  node_img_array[12] = loadImage("heart.png");
  node_img_array[13] = loadImage("bubble.jpg");
  node_img_array[14] = loadImage("afro.png");
  node_img_array[15] = loadImage("abstract_butterfly.png");
  */
  
  img_glob = loadImage("obama.png");
  node_img = loadImage("boob2.png");

  
 /*  cp5.addButton("add_b")
     .setValue(100)
     .setPosition(250,10)
     .setSize(30,30)
     ;
     */
  
  savedTime = millis();
  
/*  shader1 = loadShader("bwfrag.glsl");
       shader1.set("resolution", float(width), float(height)); 
       shader_freqa[1] = 220;
   //  shader1.set("time", (float)(millis()/shader_freqa[1]));
     shader2 = loadShader("state_of_the_art.glsl");
       shader2.set("resolution", float(width), float(height)); 
       shader_freqa[2] = 2500;
     shader3 = loadShader("lava_lamp.glsl");
       shader3.set("resolution", float(width), float(height));  
       shader_freqa[3] = 750;
     shader4 = loadShader("funk_dimension.glsl");
       shader4.set("resolution", float(width), float(height));  
       shader_freqa[4] = 1000;
     shader5 = loadShader("colored_circles.glsl");
       shader5.set("resolution", float(width), float(height));  
       shader_freqa[5] = 670;
     shader6 = loadShader("psychadelic.glsl");
       shader6.set("resolution", float(width), float(height));  
       shader_freqa[6] = 660;
     shader7 = loadShader("kataho.glsl");
       shader7.set("resolution", float(width), float(height));  
       shader_freqa[7] = 43000;
     shader8 = loadShader("hypnoswirl.glsl");
       shader8.set("resolution", float(width), float(height)); 
       shader_freqa[8] = 500;
     shader9 = loadShader("alhambra.glsl");
       shader9.set("resolution", float(width/4), float(height/4));  
       shader_freqa[9] = 600;
      // tex00 = loadImage("marriage.jpg");
      // shader9.set("iChannel0",tex00); 
           
      println("shader freq = ",shader_freqa[shader_num]);
  */
  
  minim = new Minim(this);
  mySound = minim.loadFile("James Brown mashup.mp3",1024);
//   mySound = minim.loadFile("calabria.mp3",1024);
// mySound.play();
      
  // create an FFT object for calculating logarithmically spaced averages
 // fftLog = new FFT( mySound.bufferSize(), mySound.sampleRate() );
 fftLog = new FFT( mySound.bufferSize(),  mySound.sampleRate() );
  
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  //  fftLog.logAverages( 22, 3 );
  fftLog.logAverages( 22*300, 3 );  // i changed so there are only 3 averages
  println("fftLog.avgSize",fftLog.avgSize());
  
  numNodes = fftLog.avgSize();
  locs = width / (fftLog.avgSize()+1);   //spacing of locations
  nodes = new ArrayList();
  for(int i = 0;i<numNodes;i++){
    // int locs = width / (fftLog.avgSize()+1);   //spacing of locations
    cur_loc = locs * (i + 1);         //x coordingate location of current node
    nodes.add(new Node(cur_loc,height/2));
  }

  // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, gravity);// 0, -20  --first number is wind?(sideways gravity), 2nd is gravity, earth is -8

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
//  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
//  boundaries.add(new Boundary(3*width/4,height-5,width/2-50,10));
//  boundaries.add(new Boundary(width-5,height/2,10,height));
//  boundaries.add(new Boundary(5,height/2,10,height));
  
  //no hole at bottom -- just square frame
  boundaries.add(new Boundary(width/2,height-5,width,10));
  boundaries.add(new Boundary(width/2,5,width,10));
  boundaries.add(new Boundary(width-5,height/2,10,height));
  boundaries.add(new Boundary(5,height/2,10,height));
  
  for (int i = 1; i < 50; i = i + 1)
    {
      Box p = new Box(random(width),height/2);  //these two inputs are the x,y coordinates of new boxes
    boxes.add(p);
    }
 
  //fill particle array with new Particle objects
  for(int i=0; i<particle.length; i++){
    particle[i] = new Particle(new PVector(random(0, width), random(0, height)), 2, 200, 5);
      //3rd input is the size of the particles = 2
    //4th inpout is gravity = 10
    //5th input is mass = 10
    //down below force = gravity * mass
  }
   // Make a new blob
//  blob = new Blob();
      
}
//------------------------------------------------------------------------------
void draw() {
//background(200,200,200);  //from RGB mode, if you remove this, it has a cool effect
background(221,0.42*358,0.61*358); 

 box2d.setGravity(0, gravity);// 0, -20  --first number is wind?(sideways gravity), 2nd is gravity, earth is -8

  if(Shader_On==true){
    shade_back = 1;
  }
  else{
    shade_back = 0;
  }
  
factor = force_strength;

int passedTime = millis() - savedTime;
  if (passedTime > totalTime){
    mySound.play();
  }
  if (shader_num == 0){
   // resetShader();
    background(221,0.42*358,0.61*358); 
  }
  
/*  if (shader_num == 1){
     shader1.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader1); 
  }
  
  if (shader_num == 2){
     shader2.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader2); 
  }
  
  if (shader_num == 3){
     shader3.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader3); 
  }
  
    if (shader_num == 4){
     shader4.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader4.set("mouse", float(mouseX), float(mouseY));
     shader(shader4); 
  }
  
    if (shader_num == 5){
     shader5.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader5); 
  }
  
    if (shader_num == 6){
     shader6.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader6); 
  }
  
    if (shader_num == 7){
     shader7.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader7); 
  }
  
    if (shader_num == 8){
     shader8.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader8); 
  }
  
    if (shader_num == 9){
     shader9.set("time", (float)(millis()/shader_freqa[shader_num]));
     shader(shader9); 
  }
*/
  if (shade_back == 1){
   rect(0,0,width*2,height*2);  //for some odd reason the dimensions of the rect have to be twice the screen width and height
   //resetShader();
  }

  float centerFrequency = 0;
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLog.forward(mySound.mix );
  
    // draw the logarithmic averages
  {
    // since logarithmically spaced averages are not equally spaced
    // we can't precompute the width for all averages
    for(int i = 0; i < fftLog.avgSize(); i++)
    {
      centerFrequency    = fftLog.getAverageCenterFrequency(i);
      // how wide is this average in Hz?
      float averageWidth = fftLog.getAverageBandWidth(i);   
      
      // we calculate the lowest and highest frequencies
      // contained in this average using the center frequency
      // and bandwidth of this average.
      float lowFreq  = centerFrequency - averageWidth/2;
      float highFreq = centerFrequency + averageWidth/2;
      
      // freqToIndex converts a frequency in Hz to a spectrum band index
      // that can be passed to getBand. in this case, we simply use the 
      // index as coordinates for the rectangle we draw to represent
      // the average.
      int xl = (int)fftLog.freqToIndex(lowFreq);
      int xr = (int)fftLog.freqToIndex(highFreq);
      
 /*     
      // if the mouse is inside of this average's rectangle
      // print the center frequency and set the fill color to red
      if ( mouseX >= xl && mouseX < xr )
      {
        fill(255, 128);
        text("Logarithmic Average Center Frequency: " + centerFrequency, 5, height - 25);
        fill(255, 0, 0);
      }
      else
      {
          fill(255);
      }
  */    
      // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
      //    rect( xl, height, xr, height - fftLog.getAvg(i)*spectrumScale );
     // println("fftlog avg = ",fftLog.getAvg(i)*spectrumScale);
     //strokeWeight (1);
    // stroke (255,235,0);
      new_circle_size = constrain(fftLog.getAvg(i)*spectrumScale*14,40,circle_size*25);
    // println("new_circle_size = ",new_circle_size);
    // int locs = width / (fftLog.avgSize()+1);   //spacing of locations
    // int cur_loc = locs * (i + 1);         //x coordingate location of current node
     fill(60,358,358);
     //ellipse(cur_loc, height/2, new_circle_size, new_circle_size);
     
     Node thisNode = (Node) nodes.get(i);
     
     if (passedTime > node_time){  //delay before nodes move
         thisNode.checkPos();
         thisNode.update();    
     }
     
     thisNode.display();
     
     //image(node_img,cur_loc, height/2, new_circle_size, new_circle_size);
     //add color changing if/then here, if box is within radius of ellipse/ 
     
     force = new_circle_size * factor;
     
     //  threshold set for setting off attraction
     if (new_circle_size > 42) {
           
        // blob.attract(cur_loc,height/2,force*2);
         
          for (Box b: boxes) {
            // b.attract(mouseX,mouseY);
           //b.attract(cur_loc,height/2,force*2);  //center node
           b.attract(thisNode.location.x,thisNode.location.y,force*2);  //
          
          }
  
        }
  
    }  // end of log avg loop
  }  // end of weird extra bracket
  

//original music visualization circle draw in center
/*  for(int j = 0; j<mySound.bufferSize() - 1; j += 25)
  {
     strokeWeight (1);
     stroke (255,235,0);
  //   new_circle_size = mySound.mix.get(j+1)*600;
  //     ellipse(width/2, height/2, new_circle_size, new_circle_size);
  //  println(new_circle_size);
      
     new_circle_size = constrain(abs(mySound.mix.get(j+1)*1200),0,circle_size*10);
//    println(new_circle_size);
     ellipse(width/2, height/2, new_circle_size, new_circle_size);
  }
  */
  

/*
  // can add new boxes slowly via this condition
  if (random(1) < 0.0) {
    Box p = new Box(random(width),10);
    boxes.add(p);
  }
*/
  
  //add new boxes by pressing mouse button
/*  if (mousePressed) {
    Box p = new Box(random(width),10);
    boxes.add(p);
   // println(boxes.size());
  } */
    
  // Display all the boundaries
  if (bound == 1){
    for (Boundary wall: boundaries) {
      wall.display();
    }
  }

  // Display all the boxes
 if (particles_on == 0){
    box2d.step();
      // Show the blob!
   // blob.display(284);
     for (Box b: boxes) {
        b.display(25);
     }
 }
 
 // Display particles
 if (particles_on == 1){
        //run all the particles in the array every frame
        for(int i=0; i<particle.length; i++){
        particle[i].run(mouseX, mouseY); //run() method takes two arguments - x and y values to apply forces to
        }
 }



  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
/*  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    } 
  } */
  
//  fill(0);
 // text("Click mouse to attract boxes",20,20);
}

public void keyPressed(){
  int k = key;
 
  if (k=='s'){
    //background mode 0: constant background and use shader as fill
    shade_back = 0;
    
  }
  else if (k=='S'){
    //background mode 9: shader is background only
    shade_back = 1;
  }
  
    else if (k=='b'){
    //display and use boundaries
    bound = 1;
  }
  
     else if (k=='f'){
    //adjust force factor lower
    factor = factor * 0.9;
    println("factor = ",factor);
     }
     
     else if (k=='F'){
    //adjust force factor lower
    factor = factor / 0.9;
    println("factor = ",factor);
    }
  
    else if (k=='p'){
    //turn on particle system
    particles_on = 1;
  }
  
   else if (k=='P'){
    //turn on particle system
    particles_on = 0;
  }
  
    else if (k >= 48 ){
            if (k <= 57){
              shader_num = k - 48;
              println("shader freq = ",shader_freqa[shader_num]);
            }
    }    
}   // end of void keyPressed()

/* void customize(DropdownList ddl) {
  // a convenience function to customize a DropdownList
  ddl.setBackgroundColor(color(190));
  ddl.setHeight(620);
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
 // ddl.captionLabel().set("Objects");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
 // for (int i=0;i<40;i++) {
 //   ddl.addItem("item "+i, i);
 // }
  //ddl.scroll(0);
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void controlEvent(ControlEvent theEvent) {
  // DropdownList is of type ControlGroup.
  // A controlEvent will be triggered from inside the ControlGroup class.
  // therefore you need to check the originator of the Event with
  // if (theEvent.isGroup())
  // to avoid an error message thrown by controlP5.

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
      
      if (theEvent.getName() == "myList-d2"){
        node_img = node_img_array[int(theEvent.getGroup().getValue())];
      }
      
      if (theEvent.getName() == "myList-d1"){
        img_glob = img_array[int(theEvent.getGroup().getValue())];
      }     
  } 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  }
}
*/
// function colorB will receive changes from 
// controller with name colorB
public void add_b(int theValue) {
  println("a button event from colorB: "+theValue);
  Box p = new Box(random(width),10);
  boxes.add(p);
}







