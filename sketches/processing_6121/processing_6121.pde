
int x;
int y;
int a;
int b;
int aa;
int bb;

int speed;
int yspeed;
int aspeed;
int bspeed;
int aaspeed;
int bbspeed;

PImage image1;
PImage image2;
PImage image3;
PImage image4;

PFont font1;

void setup(){
  size (600, 500);
  x= 200;
  y=200; 
  speed = 20;
  yspeed= 10; 
  a= 100;
  b=100;
  aspeed= 50;
  bspeed= 50;
  aa=0;
  bb=0;
  aaspeed= 25;
  bbspeed= 25;

  image1= loadImage ("image1.jpg");
  image2= loadImage ("image2.jpg");
  image3= loadImage ("image3.jpg");
  image4= loadImage ("image4.jpg");

  font1= loadFont ("Bubblegums-25.vlw");
}

void draw(){
  background(0);
  image (image3, a,b);  
  image (image1, mouseX-50, mouseY-50);
  image (image2, x,y);
  image (image4,aa,bb);

  textFont (font1, 20);

  x= x+speed;
  y= y+ yspeed;
  a= a+aspeed;
  b= b+bspeed;
  aa= aa+aaspeed;
  bb=bb+bbspeed;

  if (x>600-25) {
    speed= speed * -1;
  }
  if (y>500-25) {
    yspeed= yspeed * -1;
  }
  if (x<25) {
    speed= speed* -1;
  }
  if (y<25) {
    yspeed= yspeed * -1;
  }


  if (a>600-25) {
    aspeed= aspeed * -1;
  }
  if (b>500-25) {
    bspeed= bspeed * -1;
  }
  if (a<25) {
    aspeed= aspeed* -1;
  }
  if (b<25) {
    bspeed= bspeed * -1;
  }

  if (aa>600-25) {
    aaspeed= aaspeed * -1;
  }
  if (bb>500-25) {
    bbspeed= bbspeed * -1;
  }
  if (aa<25) {
    aaspeed= aaspeed* -1;
  }
  if (bb<25) {
    bbspeed= bbspeed * -1;
  }

  fill(random(255),random(255),random(255), 170);
  ellipse(mouseX+random(-200,200),mouseY+random(-200,200),10,10);

  fill(random(251),random(255),random(44),170);
  ellipse(a+ random(-200,200),b + random (-200,200),10,10);

  fill(random(255),random(44),random(192),170);
  ellipse(x+ random(-200,200),y + random (-200,200),10,10);

  fill(random(44),random(255),random(253),170);
  ellipse(aa+ random(-200,200),bb + random (-200,200),10,10);

  fill (random (255),random (255),random (255));
  text ("Stones",mouseX-30, mouseY+ 120);
  fill (255,255,255);
  text ("Wasabi", a+ random (-10,10), b+ random (-10,10));
  text ("Bark Wood", x-10,y);
  text ("Thread", aa,bb+200);

}











