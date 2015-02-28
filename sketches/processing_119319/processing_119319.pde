
void setup()
{
  size(500, 500);
  background(0);
  frameRate(60);
}

  float i = 0;
 
 
void draw()
{
  i = i + .1;
 
  background(0);
  
  fill(255);
  noStroke();
 
  //Rotating rects
  pushMatrix();
  translate(93.2, 156);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(93.5, 218.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(92.9, 281);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(93.2, 343.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(156.5, 218.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(219.5, 218.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(280.2, 156);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(280.5, 218.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(280, 281);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(280, 343.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();

  pushMatrix();
  translate(406.2, 156);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(406.5, 218.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();

  pushMatrix();
  translate(405.9, 281);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();
  
  pushMatrix();
  translate(406.2, 343.5);
  smooth();
  rotate(i/600);
  rect(-25, -25, 50, 50);
  popMatrix();

  
  //Static rects
  rect(5.2, 6, 50, 50);
  rect(68.2, 6, 50, 50);
  rect(131.2, 6, 50, 50);
  rect(194.2, 6, 50, 50);
  rect(255.2, 6, 50, 50);
  rect(318.2, 6, 50, 50);
  rect(381.2, 6, 50, 50);
  rect(444.2, 6, 50, 50);

  rect(5.5, 68.5, 50, 50);
  rect(68.5, 68.5, 50, 50);
  rect(131.5, 68.5, 50, 50);
  rect(194.5, 68.5, 50, 50);
  rect(255.5, 68.5, 50, 50);
  rect(318.5, 68.5, 50, 50);
  rect(381.5, 68.5, 50, 50);
  rect(444.5, 68.5, 50, 50);

  rect(5.5, 131, 50, 50);
  rect(131.5, 131, 50, 50);
  rect(194.5, 131, 50, 50);
  rect(318.5, 131, 50, 50);
  rect(444.5, 131, 50, 50);
  
  rect(5.5, 193.5, 50, 50);
  rect(318.5, 193.5, 50, 50);
  rect(444.5, 193.5, 50, 50);
  
  rect(5.5, 256, 50, 50);
  rect(131.5, 256, 50, 50);
  rect(194.5, 256, 50, 50);
  rect(318.5, 256, 50, 50);
  rect(444.5, 256, 50, 50);
    
  rect(5.5, 318.5, 50, 50);
  rect(131.5, 318.5, 50, 50);
  rect(194.5, 318.5, 50, 50);
  rect(318.5, 318.5, 50, 50);
  rect(444.5, 318.5, 50, 50);
 
  rect(5.2, 381, 50, 50);
  rect(68.2, 381, 50, 50);
  rect(131.2, 381, 50, 50);
  rect(194.2, 381, 50, 50);
  rect(255.2, 381, 50, 50);
  rect(318.2, 381, 50, 50);
  rect(381.2, 381, 50, 50);
  rect(444.2, 381, 50, 50);
  
  rect(5.2, 443.5, 50, 50);
  rect(68.2, 443.5, 50, 50);
  rect(131.2, 443.5, 50, 50);
  rect(194.2, 443.5, 50, 50);
  rect(255.2, 443.5, 50, 50);
  rect(318.2, 443.5, 50, 50);
  rect(381.2, 443.5, 50, 50);
  rect(444.2, 443.5, 50, 50);
}
