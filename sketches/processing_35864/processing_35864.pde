
void setup(){
  size(500,500);
  background(76,234,222);
  smooth();
  fill(205,255,152);
  strokeWeight(3);
  
}

void draw() {
  background(mouseX,mouseY,38);
  fill(mouseX,250,mouseY);
  ellipse(random(width),random(height),30,30);
  ellipse(250,190,330,330);
  fill(255,255,255);
  ellipse(170,130,100,50);
  ellipse(330,130,100,50);
  fill(255,185,248);
  triangle(250,145,270,225,230,225);
  line(220,60,140,90);
  line(280,60,360,90);
  fill(103,23,mouseY);
  ellipse(170,130,mouseX,mouseY);
  ellipse(330,130,mouseX,mouseY);
  fill(0,0,0);
  arc(250,300,200,100,0,PI*2);
  fill(254,206,255);
  ellipse(250,325,125,50);
  fill(90,255,234);
}

