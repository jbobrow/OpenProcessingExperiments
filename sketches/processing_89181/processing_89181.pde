
PImage snake;

void setup(){
  size(800, 800);
  smooth();
  noStroke();
  clearScreen();
  snake = loadImage("Snake.jpg");
}
void clearScreen(){
   background(204);
}
float a = 0;
float b = 0;
float c = -255;
void draw(){
  
    fill(255, 3, 3);
    rect(mouseX, mouseY, 15, 15);
    fill(18, 203, 6);
    ellipse(mouseX, mouseY, 20, 20);
    if ((keyPressed == true) && (key == 'a')){
image( snake, mouseX , mouseY);
}
if ((keyPressed == true) && (key == 'b')){
a = a + 1;
  b = b + 1;
  c = c + 1;
  float d = random(0,255);
  float e = random(0,255);
  float f = random(0,255);
  translate(mouseX, mouseY);
  rotate(a);
  if(b<255){
  fill(d, e, f);
  } else {
  fill(d, e, f);
  }
  fill(d, e, f);
 rect(mouseX, 40, 30, 30);
 ellipse(mouseX/2, 30, 30, 30);
 
  }
}
void keyPressed(){
   if(key == ' '){
      clearScreen();
   }
 
}



