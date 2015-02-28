
PImage a;
PImage b;
PImage c;
PImage d;
int value = 255;

void setup(){
  size(600,400);
  a= loadImage("inu.png");
  b= loadImage("inu2.png");
  c= loadImage("spg.png");
  d= loadImage("ji.png");
  smooth(); 
  background(255);
  image(d, 50,50);
   
}

void draw(){
   background(255);
  noTint();
  image(b, 300, 230);
  tint(255,255,255,value);
  image(a, 300,230);
  imageMode(CENTER);
  noTint();
 image(c, mouseX, mouseY);
  image(d, 100,40);
   
}

void mouseDragged() 
{
  value = value - 1;
  if (value < 0) {
    value = 0;
  }

}

void keyPressed(){
  if (key ==' '){
  value=255;}
  }




