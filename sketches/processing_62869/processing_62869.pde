
/*

Array

*/

int value = 1000;
color[] c = new color[value];
float[] posX = new float[value];
float[] posY = new float[value];

void setup(){
  size(400,400);
  for(int i = 0; i < value; i++){
    c[i] = (int)random(255);
    posX[i] = random(width);
    posY[i] = random(height);
  }
}

void draw(){
  
  for(int i = 0; i < value; i++){
    fill(c[i]);
    rect(posX[i],posY[i],30,30);
  }
  
}
