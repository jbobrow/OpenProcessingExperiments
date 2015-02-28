
void setup(){
size(300,300);
}

void draw() {
  
if (mouseX < width/2) {
  background(76,227,225);
  //for the grass
  fill(17,157,28);
  noStroke();
  rect(0,250,300,50);
  //for the trunk of the tree
  fill(82,52,20);
  smooth();
  triangle(150,100,140,250,160,250);
  //for the leaves on the tree
  ellipseMode(CENTER);
  fill(17,157,28);
  ellipse(150,75,50,50);
  ellipse(150,150,50,50);
  ellipse(120,150,50,50);
  ellipse(180,150,50,50);
  ellipse(130,110,50,50);
  ellipse(170,110,50,50);
  //for the sun
  fill(255,255,0);
  ellipse(50,50,50,50);
}


if (mouseX > width/2) {
  background(100,100,100);
  //for the snow
  fill(255,255,255);
  noStroke();
  rect(0,250,300,50);
  //for the tree trunk
  fill(0,0,0);
  smooth();
  triangle(150,100,140,250,160,250);
  //for the branches
  triangle(150,110,148,30,152,30);
  triangle(150,130,100,100,110,100);
  triangle(150,130,200,100,190,100);
  triangle(150,100,130,50,125,50);
  triangle(150,100,180,50,185,50);
  //for the sun
  fill(250,250,151);
  ellipse(50,50,50,50);
}

}


