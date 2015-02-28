
boolean useMouse = false; 

PImage nose, nose2;  
LowerJaw jaw, flower; 
UpperJaw upperJaw, moustache, colourLip; 
Bones skull, eyebrows; 
Circles circles, background; 

void setupFace() {  
  size(800,800); 
  background(0); 
  smooth();    
  imageMode(CENTER); 
  
// BONES 
  skull = new Bones (400, 330, 255);
  nose = loadImage("Nose.png");
  nose2 = loadImage("Nose2.png");
  eyebrows = new Bones(0 ,0 , 0); 
  
// LOWER JAW ---------------------------------------------------
  jaw = new LowerJaw (258, 587, 255); 
  flower = new LowerJaw (260, 587, 255);
  
// UPPER JAW --------------------------------------------------- 
  upperJaw = new UpperJaw (258, 494, 255); 
  moustache = new UpperJaw (258, 494, 0);  
  colourLip = new UpperJaw (258, 494, 0); 
  
// CIRCLES
  circles = new Circles (283, 395);
  background = new Circles (width/2, height/2); 
  } 

void drawFace() {
  if (useMouse){
  v = map(mouseX, 0, width, 0, 1); }  
  background.drawBackground();
  
// LOWER JAW -------------------------------------------------
  jaw.drawJaw(); 
  flower.drawJawFlower();
  
// BONES -----------------------------------------------------  
  skull.drawFace();
  image(nose, 376, 430, v*5 + 42, v*10 + 98); 
  image(nose2, 424, 430, v*5 + 42, v*10 + 98);  
  eyebrows.drawEyebrows(); 
  
// UPPER JAW ------------------------------------------------- 
  upperJaw.drawUpperJaw();
  moustache.drawMoustache();
  colourLip.drawColourLip(); 
  
// CIRCLES AND FLOWERS ---------------------------------------
  circles.drawCircles(); 
  //saveFrame("Face######.png"); 

}
class Bones { 
  float x,y; 
  color c; 

Bones (float xpos, float ypos, color colour){ 
  x = xpos; 
  y = ypos; 
  c = colour; 
} 

void drawFace(){ 
  
  //skull
  noStroke(); 
  fill(c);
  ellipse(x, y, 420, 510); 
  
  //cheeks l+r
  ellipse(x-168, y+105, 121, 132);
  ellipse(x+166, y+105, 121, 132); 
  
  //rosy cheeks 
  fill(v*-10 + 255, v*-75 + 255, v*-42 + 255); 
  ellipse(x-168, y+105, 100, 100);
  ellipse(x+166, y+105, 100, 100); 
  
  // sockets l+r
  fill(0); 
  ellipse(x-82, y, 120, v*20 + 105); 
  ellipse(x+82, y, 120, v*20 + 105); 

  stroke(0); 
  // eye flower left 
     // center 
  fill(220, 200, 51);   
  ellipse(x-82, y, 20, 20);
     // petals
  fill(138, v*100 + 65, v*120 + 152);
  ellipse(x-82, v*-5 + y-20, 20, 20);
  ellipse(x-82, v*5 + y+20, 20, 20);
  ellipse(v*-5 + (x-82)-18, v*2 + y+10, 20, 20);
  ellipse(v*5 + (x-82)+18, v*2 + y+10, 20, 20);
  ellipse(v*-5 + (x-82)-18, v*-2 + y-10, 20, 20);
  ellipse(v*5 + (x-82)+18, v*-2 + y-10, 20, 20);
  
  //eye flower right
  pushMatrix(); 
  translate(164, 0); 
     //center 
  fill(220, 200, 51);
  ellipse(x-82, y, 20, 20);
     // petals
  fill(138, v*100 + 65, v*120 + 152);
  ellipse(x-82, v*-5 + y-20, 20, 20);
  ellipse(x-82, v*5 + y+20, 20, 20);
  ellipse(v*-5 + (x-82)-18, v*2 + y+10, 20, 20);
  ellipse(v*5 + (x-82)+18, v*2 + y+10, 20, 20);
  ellipse(v*-5 + (x-82)-18, v*-2 + y-10, 20, 20);
  ellipse(v*5 + (x-82)+18, v*-2 + y-10, 20, 20);
  popMatrix(); 
    } 
    
  void drawEyebrows(){ 
  strokeWeight(3);
  stroke(0);  
  fill(#D6712A); 
  // left eyebrow   
  beginShape(); 
  vertex(250, v*-50 + 310);
  bezierVertex(207, v*-50 + 197, 374, v*-50 + 198, 374, v*-50 + 310);
  bezierVertex(384, v*-50 + 265, 262, v*-50 + 242, 250, v*-50 + 310);
  endShape();
  // right eyebrow 
  beginShape(); 
  vertex(549, v*-50 + 310);
  bezierVertex(593, v*-50 + 197, 425, v*-50 + 198, 425, v*-50 + 310);
  bezierVertex(415, v*-50 + 265, 539, v*-50 + 242, 550, v*-50 + 310);
  endShape();
}
}



class Circles { 
  float x,y; 

Circles (float xpos, float ypos){ 
  x = xpos; 
  y = ypos; 
} 

void drawCircles(){  
  stroke(0); 

//orange circles 
  fill(214,v*100 + 113,42);
  ellipse(x, y , 14, 14); 
  ellipse(x + 89, y - 15, 14, 14);
  ellipse(x + 145, y - 15 , 14, 14); 
  ellipse(x + 232, y, 14, 14);

// green circles
  fill(41,v*10 + 155,v*300 + 71); 
  ellipse(x + 22, y + 10, 14, 14); 
  ellipse(x + 68, y + 4, 14, 14);
  ellipse(x + 164, y + 4, 14, 14);  
  ellipse(x + 208, y + 10, 14, 14);

// purple circles 
  fill(v*250 + 138,65,152); 
  ellipse(x + 46, y + 12, 14, 14);
  ellipse(x + 185, y + 12, 14, 14);
  
// forehead circles 
  fill(v*70 + 138,65,152); 
  ellipse(400,140,20,20);
  fill(64,189,v*-100 + 183);
  ellipse(370,150,15,15);
  fill(64,189,v*-100 + 183);
  ellipse(430,150,15,15);
} 

void drawBackground(){ 
  //background
  fill(v*8 + 0, v*8 + 0, v*8 + 0);
  rect(0,0, 800,800);  
  fill (0); 
  ellipse(width/2, height/2, 750,750); 
} 
  } 
class LowerJaw { 
  float x,y;
  color c;  

LowerJaw (float xpos, float ypos, color colour) { 
    x = xpos; 
    y = ypos;
    c = colour;
  } 
  void drawJaw(){ 
    pushMatrix(); 
    fill(c);
    noStroke(); 
    rect(x, y+v*80, 285, 89);
    //teeth
    stroke(0);
    strokeWeight(3); 
    for(int i = 0; i < 8; i++){
    rect(v*10 + x + i*25 + 41, y + v*80 -1.1, 25, 17);  
    } 
    popMatrix(); 
  } 
    
  void drawJawFlower(){ 
    strokeWeight(3); 
    //center 
    fill(220,200,51); 
    ellipse(x + 140.6, y + v*80 + 50, 14, 14);
    //petals 
    fill(214,113,v*200 + 42); 
    ellipse(x + (280 * 0.5), y + v*80+ 36, 14, 14);
    ellipse(x + (280 * 0.5), y + v*80+ 64, 14, 14);
    ellipse(x + (280 * 0.45), y + v*80 + 42, 14, 14); 
    ellipse(x + (280 * 0.55), y + v*80 + 42, 14, 14); 
    ellipse(x + (280 * 0.45), y + v*80 + 58, 14, 14); 
    ellipse(x + (280 * 0.55), y + v*80 + 58, 14, 14); 
  }
} 

/*
	Example demonstrating the use of the 
 		SoundFace Utility.
 	(Based on the Lorenzo Bravi and Casey Reas' 
 	Intro to Processing assignment)
 
 	Prof. Rhazes Spell, 
 	Victoria University of Wellingtion
 School of Design (c)2014
 */

import ddf.minim.*;
SoundFaceUtil util;

//Your name
String name = "Rebecca Burn";

// Change this to a default that makes sense given your experiments
float easing = 0.5;

//set this to True if you want to use Volume to drive your face
//if set to false then the input will be driven by 'mouseX'
boolean mic = true;


//DO NOT TOUCH
//This is the input variable to drive your face
float v;


void setup() {
  size(800, 800);
  frameRate(30); 

  // ---
  // DO NOT TOUCH
  util = SoundFaceUtil.setup(this);	
  // use this to smooth the transition between different volume reads. 
  // (acceptable values between [0,1] - the lower the value the smoother the transition )
  util.setGainEasing(easing);
  textSize(18);
  // ---

  setupFace();
}

//DO NOT TOUCH ANYTHING IN HERE
void draw() {
  background(0);
  if (mic) {
    v = util.getNormVolume();
  } 
  else {
    v = norm(mouseX,0,width-1);
  }  
  drawFace();    
  label();
}


void label() {
  pushStyle();
  fill(150);
  text(name, .05 * width, .95 * height);
  popStyle();
}

void keyPressed() {
  switch(key) {

    //To increase the easing effect  
  case 'E':
    easing -= .05;
    easing = max(0.05, easing);
    println("easing: "+ (1.0 - easing));
    break;

    //To decrease the easing effect
  case 'e':
    easing += .05;
    easing = min(0.98, easing);
    println("easing: "+  (1.0 - easing));
    break;
  }
  util.setGainEasing(easing);
}

class UpperJaw { 
  float x, y; 
  color c;   

UpperJaw (float xpos, float ypos, color colour) { 
    x = xpos; 
    y = ypos;
    c = colour;
  } 
  
  void drawUpperJaw(){
    noStroke();
    fill(c);
    rect(x, y, 285, 89);
    stroke(0);
    // teeth 
    for(int i = 0; i < 8; i++){
    rect(v*-10 + x + i*25 + 41, y + 64, 25, 26);
    }} 
  
    void drawMoustache(){ 
    fill(c); 
    noStroke();  
    for(int ml = 0; ml < 15; ml++){   
    ellipse(x + ml*14 + 43, y + 45, 14, 14);
    noStroke();     
    }} 
    
    void drawColourLip(){ 
    stroke(0); 
    strokeWeight(3); 
    // green 
    fill(v*200 + 41,v*100 + 155,71); 
    ellipse(x + 141,y + 45,12,12);
    // pink 
    fill(v*-100 + 209,63,150); 
    ellipse(x + 141,y + 25,12,12);
    // yellow 
    fill(v*-180 + 220,v*-20 + 200,v*50 + 51); 
    ellipse(x + 141,y + 5,12,12);
}}


