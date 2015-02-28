
void setup(){
  size(400,400);
  background(255);
}

void draw(){
  stroke(0);
  noFill();
  rect(100,50,200,300);
  
  stroke(0);
  fill(0);
  ellipse(150,150,50,70);
  ellipse(250,150,50,70);
  
  noStroke();
  fill(255,0,100);
  ellipse(100,220,70,30);
  ellipse(300,220,70,30);
  
  noFill();
  stroke(255,0,0);
  rect(150,250,100,50);
  line(150,275,250,275);
  line(170,250,170,300);
  line(190,250,190,300);
  line(210,250,210,300);
  line(230,250,230,300);
}

