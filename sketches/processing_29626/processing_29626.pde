
import processing.opengl.*;

PImage imagen;

void setup(){
  size(600,600,P3D);
  imagen=loadImage("simbolo2.jpg");
  imagen.resize(imagen.width, imagen.height);
}

void draw(){
  background(0);
  
  translate(width/2, height/2);
    rotateX(mouseY/70.0);
    rotateY(mouseX/70.0);
  translate(-width/2, -height/2);
  
  imagen.loadPixels();
  
  for(int i=0; i<imagen.width;i+=10){
    for(int j=0;j<imagen.height;j+=10){
      int pColor= imagen.get(i,j);
      
      float dista= map(dist(width/2,height/2,i,j),0,width,10,0);
      float brillo= map(brightness(pColor),0,255,0,dista);
  
      fill(pColor);
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(i,j);
      box(6,6,dista);        
      popMatrix();

   if (mousePressed){
      pColor=color(random(0,255),random(0,255),random(0,255));
      fill (pColor);
      noStroke();
      rectMode(CENTER);
      pushMatrix();
      translate(i,j);
      box(random(2,8),random(2,8),dista);        
      popMatrix();  
     }
     
  }
  }
}

