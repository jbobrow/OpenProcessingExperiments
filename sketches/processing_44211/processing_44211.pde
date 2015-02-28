
ButterFly[]butterfly=new ButterFly[200];
PImage ima1;
//PImage ima2;
 
void setup() {
  size(1000, 1000);
  ima1 = loadImage("butterfly.png");
  //ima2 = loadImage("grass.jpeg");
  //image(ima2,0,0);
  
  
  
  for (int i=0; i<200; i+=1) {
    butterfly[i]=new ButterFly((int)random(1000), (int)random(1000), (int)random(8), (int)random(8));
  }
}
 
void draw() {
  background(50, 250, 50);
 
  for (int i=0; i<101; i+=1) {
 
    butterfly[i].move();
    butterfly[i].bounce(); 
    butterfly[i].display();
  }
}


class ButterFly {
  int xp;
  int yp;
  int xs;
  int ys;
 
 
  ButterFly(int x_position, int y_position, int x_speed, int y_speed) {
    xp=x_position;
    yp=y_position;
    xs=x_speed;
    ys=y_speed;
 
  }
 
 
  void move() {
    xp=xp+xs;
    yp=yp+ys;
  }
 
  void bounce() {
    if (xp > width || xp<0) {
      xs=xs*-1;
    }
    if (yp > height || yp<0) {
   ys=ys*-1;
    }
  }
  void display() {
    
  image(ima1,xp,yp);
  
  }
}


