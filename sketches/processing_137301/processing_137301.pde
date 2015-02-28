
float d=20;
int red =100;
int blue = 100;
int x = -100;
int y = -100;

/*need an x and y variable as center point 
set to something negative, impossible to achieve

when mouse is released, set it back to those numbers
in mouse pressed, test if the values are at that negative number 
if its not, change it to the x and y and make sure those never change again 
in the if statement
use x and y variable to generate the circles
*/


void setup() {
  size(700, 700);
  background(255);
  frameRate(20);
  noFill();
}

void draw() {
  if(mousePressed){
    strokeWeight(random(5));
  ellipse(mouseX, mouseY, d, d);
  d = d+random(+3, +3);
  stroke(red,50,blue, 50);
}
else{}
}

void mouseReleased(){
 d=20;
 x= -100;
 y= -100;
 
}

void mousePressed(){
  if (x != -100 && y != -100) {
    x= -100;
    y= -100;
    
  }
  else{}
}
  

void mouseClicked(){
 red= floor(random(250));
 blue= floor(random(250));
 
}


function saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
}




