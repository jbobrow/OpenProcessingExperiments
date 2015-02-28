
//city_origami_logo_exploration 3D

//PFont helv;

//String words = "CO"

import processing.opengl.*;

PShape logo;

void setup(){
  size(440, 440, OPENGL);
  logo = loadShape("co_logo_1.svg");
  shapeMode(CENTER);
  logo.disableStyle();
  noStroke();
  fill(255, 190);
  smooth();
  
  //helv = loadFont("Helvetica-60.vlw");
  //textAlign(CENTER);


}

void draw() {
  background(0);
  smooth();
  fill(0);
  shape(logo, width/2, height/2); 
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
      
      fill(127,210,234);
      vertex(100,10,5);
      fill(0,0,255);
      vertex(10,100,10);
      vertex(30,10,30);
      endShape();
      
      
      beginShape();
      fill(127,210,234);
      vertex(100,10,5);
      fill(0,0,255);
      vertex(10,100,10);
      vertex(200,10,30);
      endShape();
      
      
      beginShape();
      fill(127,210,234);
      vertex(100,10,100);
      fill(0,0,255);
      vertex(10,100,10);
      vertex(30,10,30);
      endShape();
      
      
      beginShape();
      fill(127,210,234);
      vertex(100,10,100);
      fill(0,0,255);
      vertex(10,10,10);
      vertex(30,10,200);
      endShape();
      
      
      
      
      
      
//textSize(60);
      //text(words);
    }


