
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float SMOOTHING = 0.15;
float vol=0;
float theta;  

void setup()  
{
  size(600, 400);
  smooth();

  minim = new Minim(this);
  audio = minim.loadFile("BangBang.mp3");
  audio.loop();

for (int h=50; h<300; h=h+50) 
{
  branch(h);
}
}


void draw() {
  
  background(0);
  frameRate(30);
  stroke(255);
   vol = lerp(vol, audio.mix.level(), SMOOTHING);
  background(vol*2000,vol*10,vol*10);
 
  float a = (vol*1000 / (float) width) * 270f;
 
  theta = radians(a);
  
  translate(width/2,height);
  
  
  
  translate(0,-160);
  
  branch(120);

}

void branch(float h) {
  
  h *= 0.66;
  
  
  
  if (h > 2) {
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    
    branch(h);   
    
    popMatrix();    
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
    rotate(radians(180));
    branch(h);
    popMatrix();
    
    
  }
 
  
}


