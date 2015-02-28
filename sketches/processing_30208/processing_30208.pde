
PFont font;
float numberA = 100;
float numberB = 100;
int xold;
int yold;

void setup() {
  size(800,200);
  //background(180,95,110);
  background(0);
  smooth();
  fill(255);
  //stroke(255);
  font = loadFont("Consolas-30.vlw");
  textFont(font,20);
    noFill();
  strokeWeight(2);
  stroke(255);
  rect(1,1,width-2,height-2);
  fill(255);
  strokeWeight(1);
  text("click",width-60,height-5);
}
void draw(){
  if(mousePressed){
    numberA = 50 - dist(xold,yold,mouseX,mouseY);
    numberB = 50 - dist(xold,yold,mouseX,mouseY);
  //here we draw the ellipse at the mouse location 
  stroke(0);
  ellipse(mouseX,mouseY,numberA,numberB);
  xold = mouseX;
  yold = mouseY;
  }
  //line(0,0, mouseX,mouseY);
  
  noFill();
  strokeWeight(2);
  stroke(255);
  rect(1,1,width-2,height-2);
  fill(255);
  strokeWeight(1);
}

void mousePressed(){
  //println("button pressed");
  //fill(random(255),random(255), random(255),50);
  background(0);
  xold = mouseX;
  yold = mouseY;
}






