
void setup(){
  size(800, 800);
  smooth();
  noStroke();
  clearScreen();
}
void clearScreen(){
   background(204); 
}
float a = 0;
float b = 0;
float c = -255;
void draw(){
 
    fill(255, 255, 255);
    ellipse(mouseX, mouseY, 30, 30);
    fill(255, 0, 0);
    ellipse(mouseX/2, mouseY/2, 30, 30);
    fill(0, 0, 255);
    ellipse(mouseX*2, mouseY*2, 30, 30);
    if ((keyPressed == true) && (key == 'a')){
fill(255, 255, 255);
ellipse(mouseX, mouseY, 50, 35);
fill(255, 255, 0);
ellipse(mouseX, mouseY, 25, 25);
fill(0, 0, 0);
ellipse(mouseX, mouseY, 10, 10);
fill(255, 0, 0);
ellipse(mouseX/2, mouseY/2, 50, 35);
fill(255, 255, 0);
ellipse(mouseX/2, mouseY/2, 25, 25);
fill(0, 0, 0);
ellipse(mouseX/2, mouseY/2, 10, 10);
fill(0, 0, 255);
ellipse(mouseX*2, mouseY*2, 50, 35);
fill(255, 255, 0);
ellipse(mouseX*2, mouseY*2, 25, 25);
fill(0, 0, 0);
ellipse(mouseX*2, mouseY*2, 10, 10);
}
if ((keyPressed == true) && (key == 'b')){
a = a + .1;
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
 triangle(mouseX*2, 75, 58, 20, 86, 75);

  }
}
void keyPressed(){
   if(key == ' '){
      clearScreen();
   } 

}
