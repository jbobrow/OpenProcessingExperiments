
float deg = 0;

void setup(){
  size (250,250);
  background (255);
  smooth ();
}

void draw(){
  background(255);
  
  noStroke ();
  fill(#3edbc3);
  ellipse (125,125,150,150);

  fill(#FFFFFF);
  ellipse (125,125,100,100);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(deg)); 
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(0, 0, 10, 200);
  popMatrix();

  noStroke ();
  fill(#7cd5e8);
  ellipse (125,125,80,80);

  fill(#FFFFFF);
  ellipse (125,125,30,30);

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-deg)); 
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(0, 0, 10, 90);
  popMatrix();

  deg++;
} 
