
int blaX, blaY;
int speedX, speedY;
int value;

void setup () {
  size(400, 400);
  blaX = 50;
  blaY = 50;
  speedX = 6;
  speedY = 4;
  value = 255;
  
}

void draw (){
  fill(value,255, 255);
  Ball();
  println(value);
}



void Ball() {
  stroke(1);
  smooth();
  if (blaX > width || blaX < 0){
    speedX = speedX * (-1);
}
  if (blaY > height || blaY < 0){
    speedY = speedY * (-1);
  }
  
  blaX= blaX + speedX;
  blaY= blaY + speedY;
  
  ellipse (blaX, blaY, 100, 100);
}

void mousePressed() {
  if (value == 255) {
    value = 0;
    } else {
      value = 255;
    }
}
