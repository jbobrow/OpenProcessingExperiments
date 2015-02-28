
//Hazel M. Bala 
//Homework- PLANETS/SOLAR SYSTEM

float theta = 0; 

void setup(){
  size (800, 800);
  smooth();
}

void draw(){
  background (0, 0, 0);
  stroke (0);
  
  translate (width/2, height/2);
  fill (255, 200, 50);
  ellipse (0, 0, 20, 20);
  
  //mercury
  pushMatrix();
  rotate (theta);
  translate (50, 60);
  fill (50, 200, 255);
  ellipse (0, 0, 10, 10);
  
  //venus
  pushMatrix();
  rotate (theta);
  translate (50, 80);
  fill (215, 2, 252);
  ellipse (0, 0, 10, 10);
  popMatrix();
  
  //earth
  pushMatrix();
  rotate (theta);
  translate (80, 95);
  fill (2, 252, 67);
  ellipse (0, 0, 10, 10);
  popMatrix();
  
  //mars
  pushMatrix();
  rotate (theta);
  translate (95, 105);
  fill (252, 2, 2);
  ellipse (0, 0, 10, 10);
  popMatrix();
  
  //jupiter
  pushMatrix();
  rotate (theta);
  translate (105, 115);
  fill (153, 63, 13);
  ellipse (0, 0, 15, 15);
  popMatrix();
  
  //saturn
  pushMatrix();
  rotate (theta);
  translate (120, 128);
  fill (237, 252, 4);
  ellipse (0, 0, 13, 13);
  popMatrix();
  
   //saturn ring
  pushMatrix();
  rotate (theta);
  translate (120, 128);
  fill (4, 162, 252);
  ellipse (0, 0, 10, 10);
  popMatrix();
  
  //uranus
  pushMatrix();
  rotate (theta);
  translate (127, 138);
  fill (157, 190, 209);
  ellipse (0, 0, 10, 10);
  popMatrix();  
  
  
  //neptune
  pushMatrix();
  rotate (theta);
  translate (136, 145);
  fill (124, 127, 128);
  ellipse (0, 0, 10, 10);
  popMatrix();  
  

//  pushMatrix();
//  rotate (theta*2);
//  translate (25,0);
//  fill (50, 255, 200);
//  ellipse (0, 0, 6, 6);
//  popMatrix();

  popMatrix();

  theta += 0.01;
}  
  
  

