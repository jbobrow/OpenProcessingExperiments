
float[]xCoord = new float[100];
float[]yCoord = new float[100];
float[]speed = new float[100];
void setup() {

  size(900, 900);

  for (int i = 0; i < 100; i++) {

    xCoord[i] = random(width);

    yCoord[i] = random(height);
    
    speed[i] = random(4,17);
  }
}

void draw() {
  background(0);
  stroke(random(255),random(255),random(255));
  strokeWeight(random(50));
  for (int i = 0; i < 100; i++) {
    point(xCoord[i], yCoord[i]);
    yCoord[i] += speed[i];
    if(yCoord[i] > height){
      yCoord[i] = 0;
  }
}
}
