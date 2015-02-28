
import processing.opengl.*;

PShape flutter;

void setup(){
  size(440, 440, OPENGL);
  flutter = loadShape("flutter.svg");
  shapeMode(CENTER);
  flutter.disableStyle();
  noStroke();
  fill(255);
  smooth();
  
  //helv = loadFont("Helvetica-60.vlw");
  //textAlign(CENTER);


}

void draw() {
  background(255);
  smooth();
  fill(0);
  shape(flutter, width/2, height/2); 
  translate(width/2, height/2);
  rotateX(mouseX/20);
  rotateY(mouseY/2);
  rotateZ(mouseX/2);
  int dim = 180;
  int i = width;
      beginShape();
      
     // vertex(dim,dim,dim);
     // vertex(i+dim, i, 0);
      //vertex(i, i+dim, dim);
      
      fill (250,4,212);
      vertex(100,10,5);
      fill(158,6,135);
      vertex(10,100,10);
      vertex(30,10,30);
      endShape();
      
      
      beginShape();
      fill(255);
      vertex(10,10,5);
      fill(255,100);
      vertex(10,100,10);
      vertex(200,10,30);
      endShape();
      
      
      
    
      
      
      
      
      
      
//textSize(60);
      //text(words);
    }


