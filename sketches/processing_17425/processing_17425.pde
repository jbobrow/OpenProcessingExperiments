
void setup(){
  size(200,200);
  smooth();
}

void draw(){
  
  background(50);
  
  // yellow-green bird
    
  //neck
  noStroke();
  fill(217,255,5);
  rect(20,100,31,100);
  //head
  noStroke();
  fill(217,255,5);
  ellipseMode(CORNER);
  ellipse(20,85,31,31);
  //beak
  noStroke();
  fill(255,185,5);
  triangle(51,110,51,120,61,115);
   //eye
  noStroke();
  fill(0);
  ellipse(35,100,5,5);
  //wing
  stroke(217,255,5);
  line(21,160,5,145);
  line(21,165,5,150);
  line(21,170,5,155);
  
  // red bird
  
  //neck
  noStroke();
  fill(255,76,5);
  rect(70,50,31,150);
  //head
  noStroke();
  fill(255,76,5);
  ellipseMode(CORNER);
  ellipse(70,36,31,31);
  //beak
  noStroke();
  fill(255,185,5);
  triangle(70,60,70,70,60,65);
  //eye
  noStroke();
  fill(0);
  ellipse(80,50,5,5);
  //wing
  stroke(255,76,5);
  line(100,130,115,145-mouseY/7);
  line(100,125,115,140-mouseY/7);
  line(100,120,115,135-mouseY/7);
  
  // blue-green bird
  
  //neck
  noStroke();
  fill(2,211,112);
  rect(150,80,31,150);
  //head
  noStroke();
  fill(2,211,112);
  ellipseMode(CORNER);
  ellipse(150,66,31,31);
  //beak
  noStroke();
  fill(255,185,5);
  triangle(150,90,150,100,140,95);
  //eye
  noStroke();
  fill(0);
  ellipse(160,80,5,5);
  //wing
  stroke(2,211,112);
  line(180,160,195,145);
  line(180,155,195,140);
  line(180,150,195,135);
  
}               
