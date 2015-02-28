
PImage sb1;
PImage sb2;
PImage sb3;
PImage sb4;
PImage sb5;
PImage sb6;
PImage sb7;
PImage sb8;
PImage sb9;
PImage sb10;
PImage sb11;
PImage sb12;

PFont littledays;
PFont crayon;
PFont cool;

float r;
float x, y;  
float s;
float x2, y2;
   


void setup () {
  size (640, 480);
  smooth();
  noLoop();
  
    //LOAD IMAGES
  sb1 = loadImage ("straw1.png");
  sb2 = loadImage ("straw2.png");
  sb3 = loadImage ("straw3.png");
  sb4 = loadImage ("straw4.png");
  sb5 = loadImage ("straw5.png");
  sb6 = loadImage ("straw6.png");
  sb7 = loadImage ("straw1.png");
  sb8 = loadImage ("straw2.png");
  sb9 = loadImage ("straw3.png");
  sb10 = loadImage ("straw4.png");
  sb11 = loadImage ("straw5.png");
  sb12 = loadImage ("straw6.png");
  crayon = loadFont ("Crayon.vlw");
  littledays = loadFont ("LittleDays.vlw");
  cool = loadFont ("Cool.vlw");

}


void draw () {   

   background (255);
  
  //STRAWBERRY RANDOMNESS // s = scale / r = rotation
  x= random(sb1.width/4, sb1.width-(width/4));
  y= random(height/4,height-(height/4));
  x2= random(width-(width/4), width/4);
  y2= random(height-(height/4), height/4);
  r = random(0,radians(360));
  s = random(0.5, .8);
  
  //IMAGES RANDOM 
  float ssb1 = random(0.5,1);
  float rsb1 =random(0,radians(360));
  
//

  float ssb2 = random(0.5,0.75);
  float rsb2 =random(0,radians(360));
  
//
 
  float ssb3 =random(.35,.75);
  float rsb3 =random(0,radians(360));
 
//
   
 float ssb4 = random(.3,1);
 float rsb4 = random(0,radians(360));
  
 //
  
 float ssb5 = random(.3,1);
 float rsb5 = random(0,radians(360));
 
 //
 
  float ssb6 =random(.35,.75);
  float rsb6 =random(0,radians(360));

//
  float ssb7 = random(0.5,1);
  float rsb7 =random(0,radians(360));
//

  float ssb8 = random(0.5,0.75);
  float rsb8 =random(0,radians(360));
  
//
 
  float ssb9 =random(.35,.75);
  float rsb9 =random(0,radians(360));
 
//
   
 float ssb10 = random(.3,1);
 float rsb10 = random(0,radians(360));
  
 //
  
 float ssb11 = random(.3,1);
 float rsb11 = random(0,radians(360));
 
 //
 
  float ssb12 =random(.35,.75);
  float rsb12 =random(0,radians(360));


////

  //STRAWBERRY 1
  pushMatrix();
  translate(x,y);
  rotate(rsb1);
  scale(ssb1);
  image(sb1,0,0);
  popMatrix();
  
  
  //STRAWBERRY 2
  pushMatrix();
  translate(x,y);
  rotate(rsb2);
  scale(ssb2);
  image(sb2,0,0);
  popMatrix();
  
  //STRAWBERRY 3
  pushMatrix();
  translate(x,y);
  rotate(rsb3);
  scale(ssb3);
  image(sb3,0,0);
  popMatrix();

  //STRAWBERRY 4
  pushMatrix();
  translate(x,y);
  rotate(rsb4);
  scale(ssb4);
  image(sb4,0,0);
  popMatrix();
  
  //STRAWBERRY 5
  pushMatrix();
  translate(x,y);
  rotate(rsb5);
  scale(ssb5);
  image(sb5,0,0);
  popMatrix();
  
  //STRAWBERRY 6
  pushMatrix();
  translate(x,y);
  rotate(rsb6);
  scale(ssb6);
  image(sb6,0,0);
  popMatrix(); 

  //STRAWBERRY 7
  pushMatrix();
  translate(x2,y2);
  rotate(rsb7);
  scale(ssb7);
  image(sb7,0,0);
  popMatrix(); 
  
  //STRAWBERRY 8
  pushMatrix();
  translate(x2,y2);
  rotate(rsb8);
  scale(ssb8);
  image(sb8,0,0);
  popMatrix();
  
  //STRAWBERRY 9
  pushMatrix();
  translate(x,y);
  rotate(rsb9);
  scale(ssb9);
  image(sb9,0,0);
  popMatrix();
  
  //STRAWBERRY 10
  pushMatrix();
  translate(x2,y2);
  rotate(rsb10);
  scale(ssb10);
  image(sb10,0,0);
  popMatrix();
  
  //STRAWBERRY 11
  pushMatrix();
  translate(x2,y2);
  rotate(rsb11);
  scale(ssb11);
  image(sb11,0,0);
  popMatrix();  
  
  //STRAWBERRY 12
  pushMatrix();
  translate(x2,y2);
  rotate(rsb12);
  scale(ssb12);
  image(sb12,0,0);
  popMatrix();
  
  //PICK ME
  fill(0);
  textFont(littledays);
  text("pick me!", x, y);
  
  
}


void mousePressed () {
  loop();
}

void mouseReleased () {
  noLoop();
}

