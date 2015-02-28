
PImage back, car;

void setup(){
  size(548,548);
  back = loadImage("background.png");
  car = loadImage("car.png");
}


int x = -130;
int y = 100;
void draw(){
  image(back, 0,0,548,548);
  image(car, x,y);
  x += 2;
  y += 1;
  if (x > width){
    x = -130;
    y = 100;
  }
}

