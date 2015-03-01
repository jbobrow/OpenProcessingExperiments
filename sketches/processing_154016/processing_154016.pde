
int rad = 60;
int surf = 75;

float xpos;    // Starting position
float xspeed = 1.8;  // Speed of back layer
int xdirection = 1;  // Left or Right


float xpos2;    // Starting position 
float xspeed2 = 3.2;  // Speed of the middle layer
int xdirection2 = 1;  // Left or Right

float xpos3;    // Starting position    
float xspeed3 = 3.8;  // Speed of the front layer
int xdirection3 = 1;  // Left or Right



void setup(){
  size(500, 400);  
  frameRate(30);
background(40); 

    xpos = width/3;
    xpos2 = width/3;
    xpos3 = width/3;
 }
void mouseDragged()
{ //sun brush in sky by mouse co-ords
 
  noStroke();
  fill(255, 233, 100,150);
  ellipse(mouseX,mouseY, 100,100);

}
void draw() { 
  
     
    fill(40,60,140);
    stroke(180,180,250);
    strokeWeight(6);
    background(xpos-70); 
    
   //background also affected by wave motion,
   //creating a simple day/night cycle
    
  float wave = height-20;
  int a=100;
  int b=200;
  int c=300;
  int d=400;
  int e=500;

 xpos = xpos + ( xspeed * xdirection );
 xpos2 = xpos2 + ( xspeed2 * xdirection2 );
 xpos3 = xpos3 + ( xspeed3 * xdirection3 );
 
  
  // Force layers to bounce back by multplying the direction 
  // by a negative number
  
  if (xpos> width-rad || xpos < 100) {
    xdirection *= -1;
  }
 
    if (xpos2 > width-rad || xpos2 < 100) {
    xdirection2 *= -1;
  }
  if (xpos3 > width-rad || xpos3 < 100) {
    xdirection3 *= -1;
  }
  //First batch of waves, these are the largest
  // furthest in the distance
  
  ellipse(xpos+d,wave,c,d);
  ellipse(xpos+c,wave,c,d);
  ellipse(xpos+b,wave,c,d);
  ellipse(xpos+a,wave,c,d);
  ellipse(xpos,wave,c,d);
  ellipse(xpos-a,wave,c,d);
  ellipse(xpos-b,wave,c,d);
  ellipse(xpos-c,wave,c,d);
  ellipse(xpos-d,wave,c,d);
  ellipse(xpos-e,wave,c,d);


  ellipse(xpos2+d,wave,b,c);
  ellipse(xpos2+c,wave,b,c);
  ellipse(xpos2+b,wave,b,c);
  ellipse(xpos2+a,wave,b,c);
  ellipse(xpos2,wave,b,c);
  ellipse(xpos2-a,wave,b,c);
  ellipse(xpos2-b,wave,b,c);
  ellipse(xpos2-c,wave,b,c);
  ellipse(xpos2-d,wave,b,c);
  ellipse(xpos2-e,wave,b,c);
 
 //Third batch, these are placed even closer together
 // to make the waves appear smaller
 
  ellipse(xpos3+surf*6,wave,a+a/3,b-a/2);
  ellipse(xpos3+surf*5,wave,a+a/3,b-a/2);
  ellipse(xpos3+surf*4,wave,a+a/3,b-a/2);
  ellipse(xpos3+surf*3,wave,a+a/3,b-a/2);
  ellipse(xpos3+surf*2,wave,a+a/3,b-a/2);
  ellipse(xpos3+surf*1,wave,a+a/3,b-a/2);
  ellipse(xpos3,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*1,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*2,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*3,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*4,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*5,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*6,wave,a+a/3,b-a/2);
  ellipse(xpos3-surf*7,wave,a+a/3,b-a/2);
}








