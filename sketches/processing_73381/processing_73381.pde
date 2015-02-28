
PImage back, car;
int x=-130;
int y=100;
void setup(){
  size(600,600);
  back=loadImage("background.png");
  car=loadImage("car.png");
  image(back, 0,0,600,600);
}
  
void draw(){
  tint(255,100);
  image(back, 0,0,600,600);
  tint(255,240);
  image(car, x,y);
  x+=2;
  y+=1;
  if(x==600){
    x=-130;
    y=100;
  }
}


