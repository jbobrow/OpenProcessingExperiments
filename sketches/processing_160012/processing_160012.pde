
//start wop wop 

int WIDTH = 800;
int HEIGHT = 900;
color color1 = #102938;
color color2 = #000000;
color color3 = #FFFFFF;

//setup structure
void setup(){
  size(WIDTH, HEIGHT);
  background(color1);
}

//draw structure
void draw(){
  strokeWeight(20);
  stroke(random(0,255), random(0,255), random(0,255), random(0,255));
  frameRate(15);
  fill(color3);
  rectMode(CENTER);
  rect(mouseX, mouseY, random(5,100), random(5,100));
}


