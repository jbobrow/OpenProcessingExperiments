
//Balloonert class object thang

class Balloonert {
  
  float x;
  float y;
  float speed;
  
  Balloonert(float tempX, float tempY, float tempSpeed) {
   x = tempX;
   y = tempY;
   speed = tempSpeed;
  }

void move() {
  x += random(-speed,speed);
  y += random(-speed,speed);
}

void display() {
 stroke(50);
 smooth();
 ellipse(x,y,60,80);//head
 line(x,y+40,x,y+200);//string
 fill(0,130,0);
 triangle(x,y+40,x-12,y+50,x+12,y+50);//tie

}

void wheeColor() {
 fill(0,random(150,255),0);
}

void sadColor() {
 fill(0,random(20,150),0);
}

void headColor() {
 fill(0,random(0,255),0);
}

void wheeFace() {
 stroke(0);
 line(x-10,y+15,x,y+25);//left mouth
 line(x,y+25,x+10,y+15);//right mouth
 fill(255);
 ellipse(x-10,y,10,10);//left eye
 ellipse(x+10,y,10,10);//right eye
 noFill();
}

void sadFace() {
 stroke(0);
 line(x-10,y+25,x,y+15);//left mouth
 line(x,y+15,x+10,y+25);//right mouth
 fill(0);
 ellipse(x-10,y,5,5);//left eye
 ellipse(x+10,y,5,5);//right eye
}

void whoaFace() {
 fill(random(0,255));
 ellipse(x-10,y,10,10);//left eye
 ellipse(x+10,y,10,10);//right eye
 fill(0);
 ellipse(x,y+20,20,20);//mouth
}

}
Balloonert whee;
Balloonert sad;
Balloonert whoa;

void setup() {
  size(600,600);
  smooth();
  whee = new Balloonert(100,300,2.5);
  sad = new Balloonert(300,300,0.3);
  whoa = new Balloonert(500,300,5);
}

void draw() {
  background(150,80,160);
  
  whee.wheeColor();
  whee.move();
  whee.display();
  whee.wheeFace();
  
  sad.sadColor();
  sad.move();
  sad.display();
  sad.sadFace();
  
  whoa.headColor();
  whoa.move();
  whoa.display();
  whoa.whoaFace();
}


