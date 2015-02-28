
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;


void setup() {
  size(500,500);
  smooth();
  frameRate(100);
  background(0,0,0); // space-like bg
 
   minim= new Minim(this);
  player = minim.loadFile("starlighthighway.mp3");
  
}

void draw() {
  
   player.play();
  
  fill(0,100,200,10);
  noStroke();
  ellipse(random(500),random(500),mouseX,mouseY); // crazee dark blue aura
  
    
  fill(0,200,200,10);
  noStroke();
  ellipse(mouseX,mouseY,random(500),random(500)); // crazy aqua aura
  
  fill(0,100,200);
  ellipse(random(500),random(500),2,2);// stars
  fill(0,150,200);
  ellipse(random(500),random(500),2,2); //more stars
  fill(0,200,200);
  ellipse(random(500),random(500),2,2); //even more stars
  
    fill(0,150,200,50);
  ellipse(random(500),random(500),5,5);
    fill(0,200,200,50);
  ellipse(random(500),random(500),5,5);
  
  
  
  fill(0,0,0,5);
  rect(0,0,500,500);
  noStroke(); // creates black opacity
  
  
  
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}

