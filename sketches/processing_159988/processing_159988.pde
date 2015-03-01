
//void blocks
int WIDTH = 400;
int HEIGHT = 600;
color color1 = #CE0606;
color color2 = #000000;
color color3 = #FFFFFF;

//void setup 
void setup(){
  size(WIDTH, HEIGHT);
  background(color1);
}

//Structure
void draw(){
  smooth();
  strokeWeight(20); 
  stroke (color2);
  fill(color3);
  rectMode(CENTER);
  //rect(mouseX, mouseY, random(5, 100), random(2, 100));
  //point(mouseX, mouseY)
  line(pmouseX, pmouseY, mouseX, mouseY);
  
 
} 



