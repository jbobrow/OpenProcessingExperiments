

//Soy el Mel
import pitaru.sonia_v2_9.*;
PImage foto;
PImage foto1;
void setup() {
size(385, 477);
   
 smooth();
 Sonia.start(this);
 
 LiveInput.start(256); 
 foto = loadImage ("gibson.jpg"); 
 foto1 = loadImage ("gibson1.png"); 
}

void draw() {
  background(0);
 imageMode (CORNER);
 noTint();
 image (foto, 0,0, 385, 477);
 
 float level = LiveInput.getLevel();
 fill(200);
 stroke(50);
 imageMode (CENTER);
 tint(255, 1500*level); 
 image (foto1,195,275, 89, 29*level*10+CENTER); 
 
 fill (0,1000*level);
 noStroke ();
 rectMode (CENTER);

 ellipse(195,275, 59, 10*level*10+CENTER); 
 
}

public void stop() {
  Sonia.stop();
  super.stop();
}


