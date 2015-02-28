
// DEFINE VARIABLES-------------------------

boolean drawMe=true;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;

float dY = 370;
float eX = 300;
float fY = 300;

// SETUP-----------------------------

void setup() {
  size(480,640);
  a=loadImage("01.jpg");
  b=loadImage("02.png");
  c=loadImage("03.png");
  d=loadImage("04.png");
  e=loadImage("05.png");
  f=loadImage("06.png");
  g=loadImage("07.png");
  h=loadImage("08.png");
  
  dY = random(50, 370);
  eX = random(0, 300);
  fY = random(10, 300);
  
}

// DRAW-------------------------------

void draw() {
  background(255);
 
    image(a,0,0);
    image(d,90,dY);
    image(e,eX,10);
    image(f,-200,fY);
  
    float r=random(0,100);
    if (r<5) {
  
    tint(255, 0, 0);
    image(b,100,180);
    
    } else if (r<20) {
    
    float x=random(-100,400);
    image(h,-200+x,4);
    
    } else if (r>5) {
    
    image(g,90,240);
    image(c,180,8);
    tint(80,249,251);
    
    // keep key pressed down change tint
    if(keyPressed) {
      tint(0.7,95);
    }
       
  }

}


