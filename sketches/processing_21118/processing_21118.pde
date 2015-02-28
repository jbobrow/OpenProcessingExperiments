
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer mySound;

int freq = 220;
float amp = 0.2;
int samples = 20000;

void setup(){
size(600,600,P3D);


  minim = new Minim(this);
   mySound = minim.loadFile("Untitled.mp3");   //  load your sound into Minum
  mySound.play();
}
float cameraX;
float cameraY;

 
void draw(){
  
 background(0);
 
 cameraX = radians(map(mouseX, 0, width, -135, 45));
  cameraY = radians(map(mouseY, 0, height, 180, 0));
   println(cos(cameraX));
  
  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);

 translate(width/2,height/2,-100);
  
 
 //mercury
 pushMatrix();
 noStroke();
 rotateY(frameCount * PI/6 * 0.05);
 translate(150,0,0);
 fill(random (0,150+mySound.mix.get(0)*100));
 sphere(20);
 popMatrix();
 
 //venus
  pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/(1+mySound.mix.get(0)*100) * 0.06);
 translate(250,0,0);
 fill(0,random(0,255),0);
 sphere(50+mySound.mix.get(0)*100);
 popMatrix();
 
 // earth
  pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/mySound.mix.get(0)*100 * 0.06);
 translate(255,0,0);
 fill(0,0,120+mySound.mix.get(0)*100);
 sphere(50+mySound.mix.get(0)*100);
 popMatrix();
 
 //sun
 pushMatrix();
 noStroke();
 rotateY(frameCount * -PI/6 * 0.06);
 fill(255,random (0,50+mySound.mix.get(0)*150),0);
 sphere (80+mySound.mix.get(0)*150);
 popMatrix();
 

}


