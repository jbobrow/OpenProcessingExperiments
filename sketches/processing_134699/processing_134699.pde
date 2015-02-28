
void setup() {
  background(150);
  size(800, 800);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  smooth();
}

void draw() {
  //frameRate(1);
  background(150);
  strokeWeight(0.1);
  drawFibonacci(15);
}

float ang, angInc;
float dist = 0;

void drawFibonacci(int target) {
  int fib, fibAnt, fibAnt2;
  int color1 = (int)random(0, 255);
  int color2 = (int)random(0, 255);
  int color3 = (int)random(0, 255);
 
  fib = 0; 
  fibAnt = 0; 
  fibAnt2 = 0;
  for (int count = 0; count < target; count++) {
    angInc = TWO_PI/fib;
    float phi = (sqrt(5)+1)/2 - 1;
    angInc = phi;
    ang=0;
    if ((count == 0)||(count == 1)) {
      fib = 1;
      fibAnt = 1;
      fibAnt2 = 0;
    }
    else {
      fib = fibAnt + fibAnt2;
      fibAnt2 = fibAnt;
      fibAnt = fib;
    }
    //dist = random(0,2);
    dist = 0;
    pushMatrix();
    rotate(angInc);

    for (int i = 0; i < fib; i++) {
      pushMatrix();
      translate(dist*sin(ang), dist*cos(ang));
      if ((i%2 == 0)) {
        color1 = 130; 
        color2 = 75; 
        color3 = 220;
        //        color1 = (int)random(0, 255);
        //        color2 = (int)random(0, 255);
        //        color3 = (int)random(0, 255);
      }
      else {
        color1 = 20; 
        color2 = 75; 
        color3 = 220;
        //        color1 = (int)random(0, 255);
        //        color2 = (int)random(0, 255);
        //        color3 = (int)random(0, 255);
      }
      //color1= 200;
      fill(color1, color2, color3, 30);  
      ellipse(550, 100, i/2, i/2);
      popMatrix();
      ang+=angInc;
      dist+=0.6;
    }
    popMatrix();
    dist+=0.13;
  }
  filter(BLUR);
}

