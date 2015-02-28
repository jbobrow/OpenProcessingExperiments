
//Krystofer Dongjae Kim
//Antimatter explosion!
//Trig

Circles myCircles1;
Circles myCircles2; 
  float distance = 100;

void setup() {
  size(600, 600);
    smooth();
  frameRate(80);

  myCircles1 = new Circles(1, 50, 0);


}

void draw() {
  background(0);
    fill(255, 0, 0);
   if (distance < 10) {
     background(random(255),random(0,20),random(0,20)); 
    }
  noStroke();
  for (int a = 1; a <100; a++) {
    for (int i = 1; i <10; i ++ ) {
      myCircles1.display(i, a, 2);

    }
  }


    if (mousePressed) {
      distance -= 2;
    } 
    else {
      distance = 100;
    }
    
 
}

class Circles { 
  float degrees = 360/5;
  float easing = 0.05;

  Circles(int i, int a, int off) {
  }

  void display(int i, int a, int space) {

    float xOffset = cos( radians(degrees)*i) * distance*a;
    float yOffset = sin( radians(degrees)*i) * distance*a;
    ellipse(mouseX + xOffset, mouseY + yOffset, 6, 6);
    degrees += i*0.01;

  }
}
