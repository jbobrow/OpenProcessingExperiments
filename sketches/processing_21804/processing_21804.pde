
void setup() {
  
  size(250,400);
  smooth();
  
}

void draw() {
  //background color
  background(113,192,255,50);
  
  //body
  stroke(0);
  fill(53,224,16);
  ellipseMode(CENTER);
  ellipse(51,250,10,10);
  ellipse(75,260,40,40);
  ellipse(95,260,40,40);
  ellipse(125,260,40,40);
 
  ellipse(160,240,65,65);
  
  //legs
  
  stroke(0);
  
  //eyes
  fill(0);
  ellipse(150,235,10,10);
  ellipse(170,235,10,10);
  fill(225);
  ellipse(160,245,20,20);
  line(155,265,180,250);
  
  //legs
  fill(0);
  ellipse(65,282,10,10);
  ellipse(75,282,10,10);
  ellipse(90,282,10,10);
  ellipse(100,282,10,10);
  ellipse(120,282,10,10);
  ellipse(130,282,10,10);
  
  
}


