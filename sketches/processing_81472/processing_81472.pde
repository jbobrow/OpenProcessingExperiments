
// Created by Fatima Zahrah Rashid from scratch
 
PImage img1; 
PImage img2;
PImage img3;
float a=0;
float b=0;
float c=0;
float d=0;
float e=0;
float f=313;
void setup(){
  size(525,501); //size of sketch
  smooth();
  noFill();
  stroke(255);
  frameRate (30); //speed of sketch
  img1 = loadImage ("mug.png");
    img2 = loadImage ("jug.png");
        img3 = loadImage ("SAM.JPG");

}
void draw(){
  background(img3);
  if (c>569){
d=10;
e+=1;
f+=0.5; 
}
if (e>90){
e=90; 
f=360;
}
            fill(255,255,255);
  noStroke();
  ellipse(70,f,d,e); 
      image (img1,16,375);

     translate (b,c);  

     rotate (a);
      image (img2,176,255); 
 
if (mouseX>176 && mouseX<344 && pmouseY>mouseY && mouseY>275 && mouseY<492){
a-=0.1;
b-=6;
c+=30;

}
if (a<-1.9){
  a=-1.9;
  b=-114;
  c=570;
}


}

void mouseReleased(){
e=0;
d=0;
f= 313;

  a=0;
  b=0;
  c=0;


  
  
  
}

