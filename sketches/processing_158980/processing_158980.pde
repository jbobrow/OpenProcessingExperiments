
void setup(){
  size(800,800);
  rectMode(CENTER);
}

void draw(){
  background(255);
  fill(0);
  rect(width/2, height/2, 600,600, 8);
  fill(100);
  ellipse(width/2,height/2, 155,155);
  strokeWeight(8);
  fill(255);
  ellipse(width/2,height/2, 120,120);
  noStroke();
  fill(100); 
  rect(width/2, 600, 50, 175, 60);
  ellipse(500,450,30,30);
  fill(255);
  ellipse(325,700,15,15);
  ellipse(475,700,15,15);
  rect(700,250,30,30);
  rect(300,200,300,150,10);
  stroke(0);
  strokeWeight(1);
  line(170,180,430,180);
  line(170,210,430,210);
  line(170,240,430,240);
}


