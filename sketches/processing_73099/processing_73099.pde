
//initialize Bunny instances
Bunny cottontail;
Bunny flopsy;
float gravity = 0.1;

void setup() {
  size( 700, 700 );        // size of the window
  smooth();                // antialiasing 
  cottontail= new Bunny(color (132,112,255),200, 10,3);
  //flopsy= new Bunny (color (143,188,143),400,430,1);
 
}

void draw() {
   background( 255);
   float factor = constrain(mouseX/10,0,5);
   cottontail. display ();
   //cottontail. move();
   cottontail. colorcrazy ();
   cottontail. bounce ();
   //cottontail. jiggle(factor);
   //flopsy. display ();
   


   
}

class Bunny {
///DATA///
color c;
float xpos;
float ypos;
float yspeed;
float speed;
color tempC;
float random;

// BUNNY COLORS
int r1 = 139; int g1 = 137; int b1 = 112;
int r2 = 255; int g2 = 250; int b2 = 205;
float r3 = 90; float g3 = 90; float b3 = 90;
int r5 = 135; int g5 = 72; int b5 = 83;
int r6 = 255; int g6 = 192; int b6 = 203;
int r7 = mouseX; int g7 = 230; int b7 = mouseY;
//BUNNY BODY COLORS
float r4 = 132; float g4 = 112; float b4 = 255;


Bunny (color tempC, float tempXpos, float tempYpos, float tempYspeed){
  c = tempC;
  xpos = tempXpos;
  ypos = tempYpos;
  yspeed = tempYspeed;
  speed=0;
}


//DRAW BUNNY
void display() {

  rectMode( CORNERS );     
  ellipseMode( CENTER );   
  
   //feet
  strokeWeight (3);
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  rect (xpos-75,  ypos+250,  xpos-30,  ypos+235);
  rect (xpos+30,  ypos+250,  xpos+75,  ypos+235);
  //arms
   strokeWeight (8);
  stroke (r3, g3, b3);
  noFill();
  line ( xpos-30, ypos+75, xpos-75, ypos+130 );
  line ( xpos+30,  ypos+75,  xpos+75,  ypos+130);
  //ears
  strokeWeight (3);
  fill (c);
  ellipse ( xpos-30, ypos-110, 30, 120);
  ellipse ( xpos+30,  ypos-110, 30, 120);
  //inside ears
  stroke (r6, g6, b6);
  fill (r6, g6, b6);
  ellipse ( xpos-30,  ypos-80, 10, 120);
  ellipse ( xpos+30,  ypos-80, 10, 120);
  //legs
  stroke (r3, g3, b3);
  fill (c);
  ellipse ( xpos-45,  ypos+205, 60, 60);
  ellipse ( xpos+45,  ypos+205, 60, 60);
   //bellypos
  ellipse ( xpos,  ypos+160, 120, 120);
  //shoulders
  ellipse ( xpos-30,  ypos+70, 60, 60);
  ellipse ( xpos+30,  ypos+70, 60, 60);
  //paws and chest
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  //ellipse ( xpos-75, ypos+130, 30, 30);
  ellipse ( xpos-75, ypos+130, 30, 30);
  ellipse ( xpos+75, ypos+130, 30, 30);
  ellipse ( xpos, ypos+115, 90, 150);
  //scarf
  stroke (r6, g6, b6);
  fill (r6, g6, b6);
  rect ( xpos-45,  ypos+55,  xpos+45,  ypos+25);
  rect ( xpos+15,  ypos+130,  xpos+40,  ypos+55);
  //scarfdesign
  rectMode( CENTER );
  stroke (r5, g5, b5);
  pushMatrix ();
  translate ( xpos+27, ypos+110);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
   pushMatrix ();
  translate ( xpos+27, ypos+80);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
  //head
  stroke (r3, g3, b3);
  fill (c);
  ellipse ( xpos, ypos-26, 135, 135);
  //mouth
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  ellipse ( xpos,  ypos+1, 75, 75);
  //face
  stroke (r3, g3, b3);
  strokeWeight (3.5);
  line ( xpos-45,  ypos-20,  xpos-15,  ypos-50);
  line ( xpos+15,  ypos-50,  xpos+45,  ypos-20);
  line ( xpos-15,  ypos+25,  xpos+9,  ypos-10);
  line ( xpos-9,  ypos-10,  xpos+15,  ypos+25);
  line ( xpos-9,  ypos-10,  xpos+9,  ypos-10);
 }
 
//FALL FUNCTION 
void move(){
  if (keyPressed){
    if (key == 'f' || key == 'F'){
  ypos = ypos + yspeed;
    }if (ypos>height){
    ypos=0;
  }
}}
 
//COLOR CHANGING FUNCTIONS
void colorcrazy (){
if (keyPressed) {
    if (key == 'r' || key == 'R') {
   c= tempC;
   tempC = color (random (255), random (255), random(255));
     } 
   }
  }
//JIGGLE FUNCTION
void jiggle (float speed){
  xpos = xpos + random(-1,1)*speed;
  ypos = ypos + random(-1,1)*speed;
  xpos = constrain (xpos,0,width);
  ypos = constrain (ypos,0,height);
}

//BOUNCE FUNCTION
 void bounce() {
    // Add speed to location
    ypos = ypos + speed; 

    // Add gravity to speed
    speed = speed + gravity; 

    // If square reaches the bottom 
    // Reverse speed 
    if (ypos > height-250) { 
      speed = speed * -.95;  
    } 
  }
}
