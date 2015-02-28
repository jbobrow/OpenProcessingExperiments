
Block1 b1;//

void setup() {
  size(400, 400);
  background(225);//(245, 228, 40);
  smooth();
  stroke(225); // (40,245,216);
  b1 = new Block1 (width/2, height/2, 30);
}

void draw() {

  b1.move();
  b1.display();
}

class Block1 {


  color C = color(random(10,225),random(74,200),random(0,200));//color(245, 40, 142);
  float x = mouseX;
  float y = mouseY;
  float speed =1;
  //randomSeed();


  Block1 (float tempX, float tempY, color tempC) {
    x= tempX;
    y = tempY;
    //C=tempC;
    
  }
  void move() {
    x = x + speed;
    if (x > width) {
      x = random(-30, width);//-30;
      //y =y-15; 
     y=random(0, height+5);
      speed = random(.2, 10);
      
      //speed= speed +2;
      C =color(random(0,225),random(0,225),random(0,225));
     //C =color(random(10,225),random(74,200),random(0,200));
     strokeWeight(random(0,5));
     
    }
    if (x<0){
      x = random (1,width);
      y= random(-6,height+6);
    }
    if (y<0) {
      y=height -y-10;
      speed=1;
       //color C = color(random(10,225),random(74,200),random(0,200));
  }
  }

  void display() {
    fill(C);
    rect(x, y, random(1,50), random(10,80));
    
  }
}




