
PImage schwamm;
PImage tafel;
PImage flieger1;
PImage flieger2;
PImage kugel;


      
float xpos, ypos;    

float xspeed = 2.8;  
float yspeed = 2.2; 

float xskizze;
float yskizze;

int a; 
int size = 80; 

int xdirection1 = 5;  // kreide links rechts
int ydirection1 = 4;  // kreide oben unten

int xdirection2 = 1;  // schwamm links rechts
int ydirection2 = 4 ;  // schwamm oben unten




void setup() {
 xskizze = width/2;
 yskizze = height/2;

 cursor(HAND);
 size(400, 300);
 frameRate(30);
 smooth();
 
 // startposition objekte
  xpos = 86;
  ypos = 18;
  
 //bilder
  schwamm = loadImage ("schwamm1.png");
  tafel = loadImage ("tafel.jpg");
 
  flieger1 = loadImage ("flieger1.png");
  flieger2 = loadImage ("flieger2.png");
  kugel = loadImage ("kugel1.png");
  
  
  background(tafel);   

}




void draw() {

//skizze
  float xskizzePos = constrain(xskizze + random(-40,40),86,293);
  float yskizzePos = constrain(yskizze + random(-40,40),18,250);
  
  stroke(random(255),100,255);
  stroke(xskizze,yskizze,xskizzePos);
  stroke(221,255,3,90);
  strokeWeight(1);
  line(xskizze,yskizze,xskizzePos,yskizzePos);
  xskizze = xskizzePos;
  yskizze = yskizzePos;
  
  
if(mousePressed){ 
   //papierflieger
  xpos = xpos + ( xspeed  * xdirection1 );
  ypos = ypos + ( yspeed  * ydirection1 );
  if (xpos >180 || xpos < 0) {
    xdirection1*= -1;
  }
  if (ypos > 100 || ypos < 0) {
    ydirection1 *= -1;
  }
  image(tafel,0,0,width,height);
  image(kugel,xpos+mouseX+70, ypos+mouseY+60, size/4, size/4);
  image(flieger1,xpos+20, ypos+mouseY+40, size/4, size/4);
  image(flieger2,xpos+mouseY-40, mouseX-30, size/2, size/2);
  image(kugel,xpos+100, ypos+50, size/3, size/3);
  image(flieger1,xpos+mouseX+50, ypos-50, size, size);
  image(flieger2,xpos-mouseY-60, ypos+mouseX+200, size/2, size/2);

  
}




 
if(keyPressed){
 
//schwamm
  image(tafel,0,0,width,height);
  xpos = xpos + ( xspeed * xdirection2 );
  ypos = ypos + ( yspeed * ydirection2 );
  if (xpos > 150 || xpos < 0) {
    xdirection2 *= -1;
  }
  if (ypos > 150 || ypos < 0) {
    ydirection2 *= -1;
  }
  image(schwamm,xpos+size/2+20, ypos+size/2-30, size, size);
  
  

}}
void keyReleased() {
  
    image(tafel,0,0,width,height);
  }

  
  
  void mouseReleased() {
if(xpos >190 || xpos < -10)
  {
    xpos=300;
    ypos=100;
  } else {
    xpos=100;
    ypos=100;
  }
   background(tafel);
  }{
  
}


