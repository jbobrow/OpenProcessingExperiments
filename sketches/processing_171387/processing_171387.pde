
Ring[] ring;
Slider[] slider;

void setup() {
  size(500, 600);
  smooth();
  ring = new Ring[3];
  for(int i = 0; i < 3; i++){
    ring[0] = new Ring(350,250,200,1,0);
    ring[1] = new Ring(275,250,200,1,0);
    ring[2] = new Ring(200,250,200,1,0);
  }
  slider = new Slider[3];
  for(int i = 0; i < 3; i++){
    slider[0] = new Slider(450,250); // top slider controls outer ring
    slider[1] = new Slider(500,250); // middle slider - placebo for middle ring
    slider[2] = new Slider(550,250); // bottom slider controls inner ring
  }
}

void draw() {
  background(0);
  display();
}

void display() {
  for(int i = 0; i < 3; i++){
    ring[i].display();
    ring[i].update();
  }
  for(int i = 0; i < 3; i++){
    slider[i].display();
  }
  moveBalls();
  
}

void moveBalls(){
  for(int i = 0; i < 3; i++){
    ring[i].rate = slider[i].getRate();
    if(i == 1){
      ring[1].rate = slider[1].getRate()/slider[1].getRate();
    }
    ring[i].ballMove();
  }
}

void mousePressed(){
  // 0 for left 1 for right
  // top slider 0
    // left
    if(dist(mouseX,mouseY,80,450)<20){
      slider[0].moveBall(0);
    }
    // right
    if(dist(mouseX,mouseY,420,450)<20){
      slider[0].moveBall(1);
    }
  //  middle slider 1
    // left
    if(dist(mouseX,mouseY,80,500)<20){
      slider[1].moveBall(0);
    }
    // right
    if(dist(mouseX,mouseY,420,500)<20){
      slider[1].moveBall(1);
    }
  //  bottom slider 2
    // left
    if(dist(mouseX,mouseY,80,550)<20){
      slider[2].moveBall(0);
    }
    // right
    if(dist(mouseX,mouseY,420,550)<20){
      slider[2].moveBall(1);
    }
}

class Ring {

  int ringDiam;
  int ringX;
  int ringY;
  float rate;
  float degree;
  int ballDiam = 13;
  float ballX;
  float ballY;
  float radius;
  float col = 174;
  boolean growing = true;

  Ring(int tempDiam, int tempRingX, int tempRingY, float tempRate, float tempN) {
    ringDiam = tempDiam;
    radius = ringDiam/2;
    ringX = tempRingX;
    ringY = tempRingY;
    ballX = 250+radius;
    ballY = 200;
    rate = tempRate;
    degree = tempN;
  }

  void display() {
    noFill();
    stroke(174);
    ellipse(ringX, ringY, ringDiam, ringDiam);
    fill(col);
    noStroke();
    ellipse(ballX, ballY, ballDiam, ballDiam);
  }

  void ballMove() {
    degree+= rate;
    if (degree>=360) {
      degree=0;
    }
    ballX = ringX + cos(radians(degree))*radius;
    ballY = ringY + sin(radians(degree))*radius;
  }

  void update() {
    /*if (growing) {
      col+=.2;
      println(col);
      if (col > 360) {
        growing = false;
      }
    }
    if (!growing) {
      col-=.3;
      println(col);
      if (col < 174) {
        growing = true;
      }
    }*/
  }
  
}

class Slider {
  
  int lineY;
  int ballX;
  int diam = 10;
  boolean farLeft = false;
  boolean farRight = false;
  float[] rates = { .85, .9, .95, 1, 1.05, 1.1, 1.15 };
  
  Slider(int tempY, int tempBallX) {
    lineY = tempY;
    ballX = tempBallX;
  }
  
  void display(){
    // line
    stroke(174);
    line(width/2-150,lineY,width/2+150,lineY);
    //ball
    fill(174);
    noStroke();
    ellipse(ballX,lineY,diam,diam);
    // arrows
    stroke(174);
      // left arrow
      line(75,lineY,85,lineY-10);
      line(75,lineY,85,lineY+10);
      // right arrows
      line(425,lineY,415,lineY-10);
      line(425,lineY,415,lineY+10);
  }
  
  void moveBall(int x){ // 0 for left 1 for right
     if(x==0){
       if(!farLeft){
         ballX-=50;
         if(ballX == 100){
           farLeft = true;
         }
       }
       farRight = false;
     }
     if(x==1){
       if(!farRight){
         ballX+=50;
         if(ballX == 400){
           farRight = true;
         }
       }
       farLeft = false;
     }
  }

  float getRate(){
    for (int i = -3; i < 4; i++){
      if(ballX == 250 + i*50){
        float x = rates[i+3];
        return x;
      }
    }
    return 1;
  }
  
}




