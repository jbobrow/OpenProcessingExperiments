
void setup() {
  //window size
  size(500,500);
}
void draw() {
  //white background
  background(255);
  
  ellipseMode(CENTER);  
  rectMode(CENTER);
  
  //body
  stroke(0);
  fill(144,92,191);
  rect(250,250,60,100);
  
  //head
  stroke(0);
  fill(255,233,203);
  ellipse(250,180,80,80);
  
  //tophat
  stroke(0);
  fill(124,122,126);
  rect(250,150,80,64);
  //tophat's rim
  line(200,182,300,182);
  
  //eyes
  stroke(0);
  fill(0);
  ellipse(230,195,10,15);
  ellipse(270,195,10,15);
  
  //mouth
  stroke(0);
  fill(0);
  arc(250,200,20,20,2*PI,3*PI);
  
  //arms
  stroke(0);
  line(220,210,210,300);
  line(280,210,290,300);
  
  //legs
  stroke(0);
  line(220,300,230,400);
  line(280,300,270,400);
  
  //feet
  
}

