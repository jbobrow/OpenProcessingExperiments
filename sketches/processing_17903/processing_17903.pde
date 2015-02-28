
float positionX, positionY;
float count=0.5;

void setup() {
  background(255,255,255);
  size(250,250);
}

void draw() {
  stroke(color(random(200),random(200),random(200),30));
  strokeWeight(3);
  for(int i=0; i<count; i++) {
    positionX = random(250);
    positionY = random(250);

    line(positionX-100,positionY,positionX+100,positionY);
    
    
  }
  count++;
}


