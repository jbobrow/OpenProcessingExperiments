
float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 1;
float s1= 50;

void setup(){
  size(500, 500);
  noStroke();
  smooth();
}
 
void draw(){
  fill(#268BED, 50);
  
  stroke(255,50);
  rectMode(CENTER);
  rect(height/2, height/2, height*2, width*2);
   
   
  //
  noFill();
  strokeWeight(sw);
   
  // increasing variables
  x += 5;
  y += 5;
  x2 += 3;
  y2 += 3;
  x3 += 2;
  y3 += 2;
 
   
  //
  stroke(#CBDBE0, s1);
  ellipse(mouseX, mouseY, x, y);
   
  stroke(#DCE8EB, s1);
  ellipse(mouseX, mouseY, x2, y2);
   
  stroke(#ECF1F2, s1);
  ellipse(mouseX, mouseY, x3, y3);
}
 
void mouseClicked(){
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  
 
  sw = 0;
}

