
PImage a;
PImage b;
PImage c;
PImage d;
int screen_size_x = 600;
int screen_size_y = 600;
int x = 0;
int y = 0;
int x2 = 0;
int y2 = 0;
int vx = 15;
int vy = 15;
int vx2 = 16;
int vy2 = 16;
int x3 = 0;
int y3 = 0;
int x4 = 0;
int y4 = 0;
int vx3 = 17;
int vy3 = 17;
int vx4 = 18;
int vy4 = 18;

void setup(){
  size(screen_size_x, screen_size_y);
  
    a = loadImage ("muffin.png");
    b = loadImage ("seashell.png");
    c = loadImage ("orange.png");
    d = loadImage ("rock.png");
  
}
void draw(){
  background(25);
  image (b, x2, y2, width/2, height/2);
  image(a, x, y, width/2, height/2);
  image(c, x3, y3, width/2, height/2);
  image(d, x4, y4, width/2, height/2);


 x = x + vx;
 y = y + vy;
 
 x2 = x2 + vx2;
 y2 = y2 + vy2;
 
 x3 = x3 + vx3;
 y3 = y3 + vy3;
 
 x4 = x4 + vx4;
 y4 = y4 + vy4;


 if (x > 360){
   vx= -8;
 } else if (x < 10){
   vx = 8;
  }
  
  if (y > 360){
   vy = -3;
 } else if (y < 10){
   vy = 3;
}

 if (x2 > 360){
   vx2= -9;
 } else if (x2 < 25){
   vx2 = 9;
  } 
   if (y2 > 360){
   vy2 = -4;
 } else if (y2 < 10){
   vy2 = 4;
  }
  
  if (x3 > 360){
   vx3= -10;
 } else if (x3 < 10){
   vx3 = 10;
  } 
   if (y3 > 360){
   vy3 = -5;
 } else if (y3 < 10){
   vy3 = 5;
  }
  
  if (x4 > 360){
   vx4= -11;
 } else if (x4 < 10){
   vx4 = 11;
  } 
   if (y4 > 360){
   vy4 = -6;
 } else if (y4 < 10){
   vy4 = 6;
  }
  

  
}

