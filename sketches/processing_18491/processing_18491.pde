
void setup(){
  size(200,200);
  background(200);
  colorMode(HSB,width);
  fill(110,130,150);
  rect(0,0,width,075*height);
  frameRate(5);
}
int x=0;
void draw(){
  noStroke();
  fill(28,x+80,180);
  ellipse(10,10,x+10,x+10);
  fill(55,x+30,150);
  rect(0,0.75*height,width,0.5*height);
  x++;
}
void mousePressed(){
  stroke(75,160,150);
  strokeWeight(2);
  line(mouseX,mouseY,mouseX,mouseY+30);
  stroke(0,140,180);
  strokeWeight(5);
  line(mouseX-5,mouseY-5,mouseX+5,mouseY+5);
  line(mouseX-5,mouseY+5,mouseX+5,mouseY-5);
  noStroke();
  fill(28,150,180);
  ellipse(mouseX,mouseY,6,6);
}

