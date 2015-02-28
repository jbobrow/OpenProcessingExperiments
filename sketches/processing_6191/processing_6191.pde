
PImage h;
//int x=150;
float r=300;
float t=150;
float b=60;

void setup(){
  size(300,300);
  background(255);
h=loadImage("1.jpg");
frameRate(30);
}

void draw(){
t=t+0.1;
 r=b*sin(t) +r;
 imageMode(CENTER);
  image(h,150,150,r,r);

}


