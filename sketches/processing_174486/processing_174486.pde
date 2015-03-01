

import ddf.minim.*;


ArrayList balls;
Hrect bg;
int totalEllipse = 0;
int ballRangeStart = 0;
int ballAmount = 20;
int ballRate = 100;
int timerStart;
int ballNum = 0;
int count = 0;
Minim minim;
AudioPlayer au_player1;

void setup() {
  balls = new ArrayList();
  bg = new Hrect(mouseX, mouseY);
  size(400, 400);
  background(0);
  for (int i= 0; i<2000; i++) {
    balls.add(new ball());
  }
  timerStart = millis();
  {
     minim = new Minim(this) ;
au_player1 = minim.loadFile("pop.wav") ;
}
}

void draw() {


  background(255);
  text(count, 25,25);
  if (millis() > timerStart+ballRate) {
    ballNum++;
    if (ballNum > balls.size()) {
      ballNum = 0;
    }
    timerStart = millis();
  }
  for (int i=0; i < ballNum; i++) {
    ball b =(ball) balls.get(i);
    b.move();
    b.display();
    b.collision(bg);
  }

  bg.display();
}



class ball {
  int treshhold; 
  int prevMillis= 0;
  float x;
  float y;
  float dia= random(20, 60); 

  float speed = random(4, 5);

  color c;
  float r;
  float j;

  ball() {
    c = color(255, 0, 0);
    x= random(0, width);
    y = random(-height, 0);
  }



  void move() {
    y += speed;

    if (millis()- prevMillis >= treshhold) {

      speed= speed+0.05;
    }
  }

  void collision(Hrect bg) {
    float d= dist(x, y, bg.x, bg.y);
    if (d<= 20)
    {
      stroke(255, 0, 0);
      strokeWeight(20);
      noFill();
      rect(0, 0, width-1, height-1);
      println("COLLIDE");
      c = color(0, 255, 0);
      au_player1.play() ;
      count++;
    }
  }

  //  boolean reachedBottom() {
  //    if (y > height + r*6) { 
  //      return true;
  //    } else {
  //      return false;
  //    }
  //  }

  void display() {
    if (y < height) {
      fill(c);
      noStroke();   
      ellipse(x, y, dia, dia);
      
    }
  }


  //  void caught() {
  //    speed = 0; 
  //    y = - 1000;
  //  }
}

class Hrect{
  
 float x,y;
float d;

Hrect(float x, float y){


  
}
void display(){
 fill(100);
 x = mouseX;
 y = height-100;
rect(x,y, 10,30) ;
  
}
  
  
  
  
  
}


