
//Amanda Bernhardt
//object
//3/18/13

Snowman [] snowmen = new Snowman[100];

//Snowman fred = new Snowman ();
//Snowman sally = new Snowman ();
void setup() {
 size(500, 500);
 noStroke();
   for(int i =0; i < snowmen.length; i ++) {
     snowmen[i] = new Snowman(i*30, i*5, 100, 100, random(50,255), random(50,255),random(50,255), random(1,15));
   }
   /*sally.x = 200;
   sally.startingX =250;
   sally.r = 119;
   sally.g = 234;
   fred.r = 222;
   fred.b = 111;*/
 
}

void draw() {
  background (0);
  /*fred.show();
  sally.show();
  fred.dance();
  sally.dance();*/
  for( int i = 0; i < snowmen.length; i ++) {
    snowmen[i].show();
    snowmen[i].dance();
  }
}

class Snowman {
  float x;
  float y;
  float w;
  float h;
  float r;
  float g;
  float b;
  float startingX;
  float speedX;
 
  
  Snowman (float x_, float y_, float w_, float h_, float r_, float g_, float b_, float speedX_) {  
  x= x_;
  y= y_;
  w= w_;
  h= h_;
  r= r_;
  g= g_;
  b= b_;
  startingX = x_ + 100;
  speedX = speedX_;
  }
  
  void show() {
    fill(x,y,12, 30);
    ellipse(x,y,w,h); 
    ellipse(x,y-50,w/2, h/2);
   // fill(x,y,211);
   // rect(x+30,y,w/3,h/2);
    
  }
  void dance() { 
    x = speedX + x;
    if(x < 40 ){
      speedX = 5;
    }
    if (x > 400) {
      speedX = -5;
    }
  }

}
  


