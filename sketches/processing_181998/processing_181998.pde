
int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;
void setup() {
  
  size(1920,800);
  smooth();
    centerX = 0;
  centerY = 0;  
  fill(155);
}
void draw() {
  background(155);
    noStroke();
  

if (mousePressed == true) {
    centerX = mouseX;
    centerY = mouseY;
  }
  if(mouseY<=offsetY && offsetY<height*3){
    translate(centerX,centerY);
}
else
{
offsetY= mouseY;
}
  if (keyPressed == true){

if (key == '1'|| key == 'r'|| key == 'R') {
              background(255,0,0);
}
if (key == '2'|| key == 'g'|| key == 'G') {
              background(0,255,0);
}
if (key == '3'|| key == 'b'|| key == 'B') {
              background(0,0,255);
}
}
fill( 0, random(255), random(255), random(255)); 

ellipse(0,0,100,100);

  

}
/*
void mousePressed() {
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}
*/
void keyPressed() {
}
