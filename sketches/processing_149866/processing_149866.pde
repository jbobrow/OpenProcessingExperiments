
Cats cat;
Cats cat2;
Cats cat3;

void setup(){
size(400,600);
smooth();
background(20,20,70);
cat = new Cats (200,200,70);
cat2 = new Cats(400,400,90);
cat3 = new Cats(100,100,320);
}

void draw(){
 // background(10);
  cat.move();
  cat.display();
  cat2.move();
  cat2.display();
  cat3.move();
  cat3.display();
  
}

class Cats{
 float x;
 float y;
 int hue;  

Cats (float tempX, float tempY, int temphue){
  x = tempX;
  y = tempY;
  hue = temphue;
 }

void move(){
  x += 0.01*mouseX;
  y += 0.02*mouseY;
  if (x>width){
  x = 0;
  }
  if (y>height){
    y=0;
  }
 }
 

void display(){
 colorMode(HSB,360,100,100);
 fill(hue,70,80,0);
 stroke(hue,90,90);
 ellipse(200,400,x,y);
  }
}


