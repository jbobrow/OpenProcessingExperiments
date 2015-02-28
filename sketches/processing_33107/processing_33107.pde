
PImage BG;

PImage car1;
float car1x;
float car1y;
float car1speedx;
float car1speedy;

PImage car2;
float car2x;
float car2y;
float car2speedx;
float car2speedy;

void setup() {

  car1x=30;
  car1y=width;  
  
  car1speedx=-1;
  car1speedy=-1;
  
  car2x=30;
  car2y=width;
  
  car2speedx=-2;
  car2speedy=-2;
  
  size(318,59);
  
  BG=loadImage("road.jpeg");
  
  car1=loadImage("firstcar.jpeg");
  car2=loadImage("secondcar.jpeg");
  
  }
  
  void draw() {
    
    car1x=car1x+car1speedx;
    car1y=car1y+car1speedy;
    
    if (car1x < 0 || car1x > 159) {
      car1speedx=car1speedx*-1;
      
  }
   
 image(BG,0,0);
 image(car1,car1x,car1y);
 image(car1, car1x, car1y);
 
 }
       
      

