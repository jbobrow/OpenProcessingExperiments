
Square Eunsil;
Square Choi;
Square Creative;
Square Computing;

void setup() {
  size (600, 600);
  background(100,80,100);
  smooth();
  Eunsil = new Square();
  Choi = new Square();
  Creative = new Square();
  Computing = new Square();  
}

void draw(){
Eunsil.update();
Eunsil.move();
Choi.update();
Choi.move();
Creative.update();
Creative.move();
Computing.update();
Computing.move();

}
class Square {
  int bounce; 
  ///---------------bounce ball
  int circleA;
  int circleB;
  int circleC;
  int circleD;
  int speedA;
  int speedB;

  ///---------------colors
  Square() {
    bounce = 5; 
    circleA =width/2;
    circleB =height/2;
    circleC =30;
    circleD =15;
    speedA = 1;
    speedB = 3;
  }

  void update() { 
    noStroke();
    fill(random(255), 160, random(255), 40);
    ellipse(circleA, circleB, random(40), random(40)); 
    ellipse(circleC, circleA, random(20), random(20));
    ellipse(circleB, circleC, random(40), random(40));
    ellipse(circleB, circleB, random(10), random(10));
    
    circleA = circleA+ speedA;
    circleB = circleB+ speedB;
    circleC = circleA+ speedB;
    circleD = circleC+ speedA;
  }
  void move() {
    circleB += random(-speedB)+.7;
    println(speedB);
    circleA += random(-speedA)-.4;
    println(speedA);

    if (circleA<70) {
      circleA=circleA+7;
      circleB=circleB+10;
      circleC=circleC+5;
      speedA = bounce;
    }
    if (circleB<70) {
      circleA= circleA;
      circleB= circleB+8;
      circleC= circleC+3;
      speedB = -speedB;
    }
    if (circleA>(width-70)) {
      circleA=circleA-3;
      circleB=circleB-6;
      circleC=circleC-1;
      speedA = -speedA;
    }
    if (circleB>(height-70)) {
      circleA = circleA;
      circleB = circleB-1;
      circleC = circleC-5;
      speedB = -speedB;
    }
  }
}



