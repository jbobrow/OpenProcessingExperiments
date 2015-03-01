
PImage car_bg;
PImage car;

void setup()
{
  size(1000,700);
  car_bg = loadImage("background.jpg");
  car = loadImage("car.png");
}

void draw()
{  
  background(0);
  
  noTint();
  image(car_bg,0,0);
  
  float bewegung_1 = map(mouseX,0,700,0,1200);
  
  float bewegung_2 = map(mouseX,0,700,0,-40);
  
  float hell = map(mouseX,0,400,0,255);
  
  tint(255,hell-30);
  
  image(car,-570+bewegung_1,0+bewegung_2);
}


