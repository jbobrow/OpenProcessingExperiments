
void setup(){
  size(600,600);
  background(232,214,212);
}

void draw(){
  //eyes
  fill(255);
  stroke(10);
  ellipse(275,400,30,30);
  ellipse(200,400,30,30);
  
  float leftEyePos = map(mouseX,0,height,260,285);
  float rightEyePos = map(mouseX,0,width,190,210);
  fill(0,0,0);
  ellipse(leftEyePos,400,20,20);
  ellipse(rightEyePos,400,20,20);
  //float lidPos = map(mouseY,100,height,100,600);
  //rect(0,0,width,lidPos);
  
  //arm and martini
  fill(0);
  rect(290,500,75,10);
  fill(255);
  rect(357,450,5,50);
  
  fill(250);
  stroke(1);
  triangle(360,450,330,420,390,420);
  
  fill(11,131,5);
  ellipse(362,435,5,4);
  ellipse(359,437,5,4);
//pink monster face
  fill(214,0,89);
  ellipse(240,430,120,400);
  //mouth
  fill(0);
  ellipse(235,440,60,20);
  //eyes
  fill(255);
  stroke(10);
  ellipse(275,400,30,30);
  ellipse(200,400,30,30);
  
  //pupils
  fill(0);
  ellipse(leftEyePos,405,10,10);
  ellipse(rightEyePos,405,10,10);
  
  float leftLidPos = map(mouseY,10,height,365,400);
  fill(214,0,89);
  noStroke();
  ellipse (200,leftLidPos,30,30);// (x,y, radius, radius)
  ellipse(275,leftLidPos,30,30);
  
  //top hat and bowtie
  fill(0);
  ellipse(240,325,300,20);
  
  fill(0);
  rect(175,125,125,200);
  
  fill(0);
  triangle(190,525,235,500,190,475);
  
  fill(0);
  triangle(235,500,280,475,280,525);
  
  fill(0);
  ellipse(235,500,10,10);
  
 
}

