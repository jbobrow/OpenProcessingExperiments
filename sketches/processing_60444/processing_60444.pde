
float angle = 0;
float radius = 100;
int dragX, dragY, moveX, moveY, pressX, pressY;
int colorValue;
int value = 0;
 
void setup() {
  background(#ffffff);
  size(600, 600);
  smooth();
  noFill();
  strokeWeight (.25);
}
void draw() {
  fill(255, 20);

  for(int i = 0;i < width;i++){
    float colorValue = map(i,0,width,0,360);
//    stroke(colorValue,100,100,100); //background color
    line(i,0,i,height);
    ellipse(random(25-30),random(25-30),random(25-30),random(25-30));
  }
 
    angle +=.01;
 
  for(int i = 0; i < 100; i++){
  float sinval = cos(angle);
  float cosval = cos(angle);    
  float x = 250 + (cosval * radius);
  float y = 250 + (sinval * radius);

  stroke(#ffffff);

  fill(i+i, i++, i++, i++);
  quad(x,y,moveX,moveY,mouseX,mouseY,pmouseX,pmouseY);
//  ellipse(mouseX,mouseY,pmouseX,pmouseY);
  quad(mouseX,mouseY,pmouseX,pmouseY,mouseX,mouseY,pmouseX,pmouseY);
  translate(dragX,dragY);
  }
}
 void mouseMoved() {
    moveX = mouseX;
    moveY = mouseY;
}
  void mouseDragged() {
    dragX = mouseX-2;
    dragY = mouseY; 
}
 
void mouseClicked (){
  float glowLight = sin (radians (angle));
  fill (random (255));
  stroke(24, 73, 223);
}
