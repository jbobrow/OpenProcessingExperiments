
import processing.pdf.*;

float angle=0.0;
float x=10;

void setup() {
  size(900, 600);
  

}

void draw() {
 
 if (mousePressed) 
                    {noFill();
                    noStroke();
                     //x=10;
                 
                    }
                   
 else 
                    {fill(255); stroke(20,20,random(0,50));}


translate(mouseX, mouseY);
rotate(angle);
rectMode(CENTER); 
rect(0,0, x, x);
angle += 0.03;
if(keyPressed) {
  if(key=='a')x+=1;
  if(key=='d')x-=1;
  if(key=='q')background(200);}



   

}


