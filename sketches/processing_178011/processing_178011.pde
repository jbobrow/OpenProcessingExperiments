

//Declare a PImage variable type
PImage BG;
PImage moon;
PImage sun;
PImage star;

//Import 'Minim' Library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample s1;
AudioSample s2;
AudioSample s3;


void setup(){
  size(1000, 700);
  minim = new Minim(this);
  s1 = minim.loadSample("s1.wav");
  s2 = minim.loadSample("s2.wav");
  s3 = minim.loadSample("s3.wav");
  BG = loadImage("BG.png");
  moon = loadImage("moon.png");
  sun = loadImage("sun.png");
  star = loadImage("star.png");
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noFill();
  background(360);
}

void draw(){
  image(BG, 0, 0);
  
  if(mousePressed){
    pushMatrix();
    translate(-50, -50);

    int d = (int)map(mouseY+10,0,height,4, 50);
    //int radius = mouseX-width/2;
   

    strokeWeight(random(18));
   
    
    for (int i=0; i<=d; i++){
      float x = mouseX+ 2*i;
      float y = mouseY*i+460;
      stroke(i*mouseX/100, i*mouseY/50, 40*i);
      point(x, y);
    }
  
    popMatrix();

  }
}
//Creat a key trigger
void keyPressed() {
    if (key == 's') {
    //tint(255, 127);
    image(sun, 0, 0);
    s1.trigger();
    }
    if (key == 'a') {
    image(moon, 0, 0);
    s2.trigger();
    }
    if (key == 'd') {
    image(star, 0, 0);
    s3.trigger();
    }
     
    } 

