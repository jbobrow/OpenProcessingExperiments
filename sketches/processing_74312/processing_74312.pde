
//INITIALIZE BUNNY INSTANCES
Pyramid phead;
Bunny[] bunnies = new Bunny [15];
float gravity = 0.1;
float xpos;
float ypos;

void setup() {
  size( 1000, 800 );        // size of the window
  smooth();                // antialiasing 
  phead= new Pyramid (100, 140);
  for (int i = 0; i< bunnies.length; i++) 
    bunnies[i]= new Bunny(color (205, 92, 92), random(width), random(height),15);
}   




void draw() {
   background( 255);
   float factor = constrain(mouseX/10,0,5);
   int i;
    for (i = 0; i < bunnies.length; i++){
   bunnies[i] .display();
   bunnies[i] .rollover(mouseX, mouseY);
    }
    for (i = 1; i<=6; i++){
      bunnies[i] .move();
    }
    for (i=3; i<=11; i++){
      bunnies[i] .colorcrazy();
    }
    for (i=5; i<=10; i++){
      bunnies[i] .jiggle(3);
    }
    for (i=10; i<=14; i++){
      bunnies[i] .bounce();
    }
   
   
   //TRIANGLE MAN
   phead. display();
   phead. follow();

}

class Bunny {
///DATA///
color c;
float xpos;
float ypos;
float w;
float yspeed;
float speed;
float random;
boolean mouse;
color tempC;


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
  
  if (mouse) {
    r6 = 140; g6 = 146; b6 = 149;
  } else { 
    r6 = 255; g6 = 192; b6 = 203;
  }
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
  xpos = constrain (xpos,0,width-250);
  ypos = constrain (ypos,0,height-250);
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
      speed = speed * -.99;  
    } 
  }
//FOLLOW FUNCTION
 void follow (){
   ypos = pmouseY-30;
   xpos = pmouseX-30;
 }
 
//COLOR CHANGE
void rollover(int mx, int my){
  if (mx> xpos-45 && mx < xpos+45 && my > ypos +40 && my < ypos+130){
    mouse = true;
  }else {
    mouse = false;
  }
}

}

class Pyramid {
  float xpos;
  float ypos;
  
  //PYARMID COLORS
  int r1= 44; int g1= 13; int b1= 9;
  int r2= 100; int g2= 27; int b2= 19;
  int r3= 209; int g3= 204; int b3= 169;
  int r4= 85; int g4= 57; int b4= 30;
  
  Pyramid (float tempXpos, float tempYpos){
    xpos = tempXpos;
    ypos = tempYpos;
  }
  
  void display() {
    rectMode (CORNERS);
    ellipseMode (CENTER);
    
   strokeWeight (3);
   stroke (r1, g1, b1);
   fill (r4, g4, b4);
   rect (xpos-20, ypos+200, xpos-5, ypos+240);
   triangle (xpos-20, ypos+240, xpos-5, ypos+230, xpos+5, ypos+240);
   rect (xpos+20, ypos+200, xpos+35, ypos+240);
   triangle (xpos+20, ypos+240, xpos+35, ypos+230, xpos+45, ypos+240);
   fill (r3, g3, b3);
   triangle (xpos, ypos, xpos-50, ypos+200, xpos+80, ypos+200);
   fill (r2, g2, b2);
   triangle (xpos-40, ypos+30, xpos, ypos-100, xpos+200, ypos+30);
   rect (xpos-50, ypos+40, xpos+210, ypos+20);
   strokeWeight(5);
   line (xpos, ypos+100, xpos+10, ypos+150);
   strokeWeight(3);
   fill(r3, g3, b3);
   ellipse (xpos+10, ypos+150, 30, 30);
  }
  
//FOLLOW FUNCTION
 void follow (){
   ypos = mouseY;
   xpos = mouseX;
 }

//JIGGLE FUNCTION
void jiggle (float speed){
  xpos = xpos + random(-1,1)*speed;
  ypos = ypos + random(-1,1)*speed;
  xpos = constrain (xpos,0,width-250);
  ypos = constrain (ypos,0,height-250);
}

}
