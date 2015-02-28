
Stripe[] stripes=new Stripe[20];
int totalStripes=0;
int totalBalls=0;
Ball[] balls = new Ball[150];
Timer timer;
float gravity = 0.1;

import ddf.minim.*;

Minim minim;

void setup() {
  size(400,400);
  
  minim=new Minim(this);

  timer=new Timer(3000);
  timer.start();

  stripes[0] = new Stripe("dingdong.wav");
  smooth();
  
}

void draw() {
  background(100);
    stripes[0].move();
    stripes[0].display();
  if (timer.isFinished()){
  stripes[totalStripes+1]= new Stripe("dingdong.wav");
  totalStripes++;
  if (totalStripes+1 >= stripes.length){
    totalStripes=0;
  }
  timer.start();
  }
  for(int i=0; i<totalStripes; i++) {
    stripes[i].move();
    stripes[i].display();
  }
    for (int i = 0; i < totalBalls; i ++ ) { 
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
    for (int j=0; j< totalStripes; j++){
    if (stripes[j].intersect(balls[i])) { 
    balls[i].bounce();
    stripes[j].ring();
    }else{
      minim.stop();
    }
    }
    }

    if (totalBalls>balls.length-1){
      totalBalls=0;
    }
}

void mousePressed() {
 balls[totalBalls]=new Ball(mouseX, mouseY, 5);
  totalBalls++;
}

public void stop() {
  //stripes[0].close(); 
  super.stop();
}



