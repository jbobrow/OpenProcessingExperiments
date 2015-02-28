
import processing.opengl.*;


void setup(){
  size(800, 800, OPENGL);
  smooth();
  fill(0,0,200,50);
}

void draw(){
  background(255);
  lights();
  pushMatrix();
  translate(500,500,0);
  rotateY(map(mouseX,0,width,0,PI*2));
  rotateX(map(mouseY,0,height,0,PI*2));
  
  drawShapes();
  popMatrix();
}

void drawShapes(){
  for(int p = 0; p < 440; p++){
   rotateY(radians(5));
   ellipse(300,10,100,100);
    beginShape();
      vertex(200,100,100);
      vertex(50,100,100);
      ellipse(50,50,200,200); 
      vertex(200,200,200);
      vertex(50,200,200);
      vertex(100,100,100);
    endShape();
  } 
}   

