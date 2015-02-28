
 
import ddf.minim.*;
Minim minim;
AudioPlayer player_1; 
PFont a ; 
float s, m, h;
int escala = 360;
float alturaPonteiros; 

void setup() { 
  size (500, 500); 
  minim = new Minim(this);
  player_1 = minim.loadFile("river.mp3", 2048);
  alturaPonteiros = height/3.0; 
  a = loadFont ("Arial-BoldMT-25.vlw");
  colorMode(HSB, 360, 100, 100);
  smooth(); 
  noStroke();
  fill(0);
  
  s = map (second(), 0, 59, 0, escala); 
    m = map (minute(), 0, 59, 0, escala); 
    h = map (hour(), 0, 12, 0, escala);
}
 

void draw() { 
  background(55, 0, 58); 
  translate (width/2, height/2); 
  pushMatrix(); 
  rotate(radians(s)); 
  stroke(60, 88, 99); 
  strokeWeight(30);
  line (0, 0, 0, -200); 
  popMatrix(); 

  pushMatrix(); 
  rotate(radians(m)); 
  strokeWeight(12);
  line (0, 0, 0, -180);
  popMatrix(); 
 
  pushMatrix(); 
  rotate(radians(h)); 
  strokeWeight(10);
  stroke(0); 
  line (0, 0, 0, -100);
  popMatrix();
  
  if (mousePressed) { 
  
    {

      player_1.play();
    }
    s = map (second(), 0, 59, 0, escala); 
    m = map (minute(), 0, 59, 0, escala); 
    h = map (hour(), 0, 12, 0, escala);
  }
  else 
  {
    player_1.pause();
    
    fill(0);
    textFont(a, 16); 
    text("If you don't press mouse,", 40, 200); 
    text("the music doesn't make", 40, 220); 
    text("any sense!",40, 240); 

  }
}
 

void stop()
{
  player_1.close();
  // always stop Minim before exiting
  minim.stop();
  super.stop();
}


