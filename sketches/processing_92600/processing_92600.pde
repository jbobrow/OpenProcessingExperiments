
//Ayla El-Moussa
//March 11th 
//adapted from the lesson shown in class on tuesday. 



int squares = 50;
float[] sX = new float[squares];
float[] sY = new float[squares];
float[] sSpeed = new float[squares];
float space = .5;
 
int pressed = 5;
void setup() {
  size(500, 550);
}
 
void draw() {
  background(0);
  for (int i = 0; i <squares; i++) {
    shapes(sX[i], sY[i]);
    sY[i] += sSpeed[i];
    sSpeed[i] += space;
  }
}

 
void shapes(float x, float y) {
 
  fill(255, 0, map(y,0,height,255,164),164);
  rect(x,y,15, 10);
  stroke(255,0,164);
 
}
 
void mouseDragged() {
  sX[pressed] = mouseX;
  sY[pressed] = mouseY;
  sSpeed[pressed] = -10;
  pressed +=2;
  if (pressed >= squares) {// == 20
    pressed =5;
  }
}
