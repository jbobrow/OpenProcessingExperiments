
//start wop wop 

int WIDTH = 400;
int HEIGHT = 600;
color color1 = #646776;
color color2 = #FFFFFF;
color color3 = #000000;

//setup structure
void setup(){
  size(WIDTH, HEIGHT);
  background(color1);
}

//draw structure
void draw(){
  strokeWeight(20);
  stroke(color2);
  fill(color3);
  rectMode(CENTER);
  //rect(mouseX, mouse Y, random(5,100), random(5,100));
  //point(mouseX, mouseY);
  stroke(random(0,255), random(0,255), random(0, 255), random(0,255));
  line(pmouseX, pmouseY, mouseX, mouseY);
}


