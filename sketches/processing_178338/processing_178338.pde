
import ddf.minim.*;

PImage bouteille;
PImage boute;
float offset = 0;
float easing = 0.05;

float stepX;
float stepY;

Minim minim;

AudioSample sound;

color strokeColor = color(0, 255);
void setup() {
   minim = new Minim(this);
   sound = minim.loadSample("rythm.wav");
  size(1280, 720);
 background(84, 176, 228);
 bouteille = loadImage("DSC02869.JPG");
 boute = loadImage("DSC02876.JPG");
  smooth();
}

void draw() {
stepX = mouseX;
stepY = mouseY;
if(mousePressed){
  float dx = (mouseX-bouteille.width/2 ) - offset;
  offset += dx * easing; 
  tint(255, 75); 
  image(boute, offset, 10);
} else {
  background(0);
  fill(186, 8, 255, 100);
  image(bouteille, 60, 60);
          for(int stepX = 100; stepY <= width; stepY += 10){
      pushMatrix();
      float r = random (-100, 1200);
      translate(int(r), int(r));
    strokeWeight(5);
    fill(mouseX, mouseY, 100);
      //ellipse(r, r, 60, 120);
      //arc(width/2, stepY, 180, 80, 0, PI, PIE);
      //arc(stepX, height/2, 180, 80, 0, PI, PIE);
      ellipse(stepX, stepY, 160, 120);
      int i = 0;
      noFill();
     //while(i < 100){ arc(stepX, height/2, 180, 80, 0, PI, PIE);
     i += 100;
     //}
     popMatrix();
    }
}
}

void keyPressed(){
  if (key == 's') saveFrame("screenshot.png");

  if (key == 'b') sound.trigger();
}



