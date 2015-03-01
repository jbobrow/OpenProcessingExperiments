
//Variables
int WIDTH = 600;
int HEIGHT = 600;
color[] clr1 = {#F207A0, #620DD9, #30F24E, #F2BB16, #F22E2E};
color[] pal1= (clr1);

//Setup
void setup(){
  size(WIDTH, HEIGHT);
  background(0);
}

//Structure
void draw(){
  frameRate(60);
  strokeWeight(10);
  fill(pal1[0], 50);
  rectMode(CENTER);
  rect(mouseX, mouseY, 100, 100);
  stroke(0);
  fill(random(210, 255), random(50, 249),random(30, 50));
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 50, 50);
}


