
int height = 200;
int width = 200;


void setup() {
  size(width, height);
  background(120);  //set background grey
  //body
  rectMode(CENTER);
  fill(200);
  rect(100,100,20,100);
  // head
  fill(255);
  ellipse(100,70,60,60); 
  //eyes
  fill(0);
  ellipse(81,70,16,32); 
  ellipse(119,70,16,32); 
  line(90,150,80,160);
  line(110,150,120,160);
  }
