
//plant particle particle
//hevily edited version of the processing examples particle system

class Particle {

int s;

float x;
float y;

float x2;

float y2;
float y3;
float x3;
float x4;
float y4;
float randx;
float randy;
float randx2;
float randy2;

int counterS;
int counterS2;
int counterS3;
int counterS4;

int directionx;
int directiony;

float maxspeed;
int flower;
float flower2;



float r1;
float g1;
float g2;
float g3;
float b1;
float r;

  Particle(PVector l) {

    r = 0.01;
counterS = 0;
counterS2 = 0;
 directionx = 1;
 directiony = 1;
 maxspeed = 0.3;
 flower2 = 3;
 counterS3 = 0;
counterS4 = 0;
 x = mouseX;
 y = mouseY;

  }

  void run() {
    update();
    render();
  }


  void update() {
    s= second();
 if ((s & 1) == 0) {
    counterS ++;

  } 
  else {
    counterS2 ++;
  }

  if(counterS > frameRate-5) {


    counterS = 0;
    counterS2 = 0;
    x3 = x;
    y3 = y;
    x4 = x;
    y4= y;
    x2 += random(-0.2, 0.2);
    y2 += random(-0.2, 0.2);
    randx = random(-0.2,0.2);
    randy = random(-0.2,0.2);
    randx2 = random(-0.15,0.15);
    randy2 = random(-0.15,0.15);
    flower = 0;
    flower2 = 3;
  
  }

  if(counterS2 > frameRate-5){

    counterS = 0;
    counterS2 = 0;

        x2 -= random(-maxspeed, maxspeed) ;
    y2 -= random(-maxspeed, maxspeed);
    x3 = x;
    y3 = y;
    x4 = x;
    y4= y;
    randx = random(-0.15,0.15);
    randy = random(-0.15,0.15);
    randx2 = random(-0.15,0.15);
    randy2 = random(-0.15,0.15);
    flower = 0;
    flower2 = 3;

  }

  if ((x > 500 - r) || (x < r)){
    directionx = -directionx;
  }

  if ((y > 500 - r) || (y < r)){
    directiony= -directiony;
  }


  if(x2 > maxspeed){
    x2 = maxspeed;
  }
  if(x2 < -maxspeed){
    x2 = -maxspeed;
  }
  if(y2 > maxspeed){
    y2 = maxspeed;
  }
  if(y2 < -maxspeed){
    y2 = -maxspeed;
  }

  x += x2*directionx;
  y += y2*directiony;
  
    if (s<=29){
    g1= ((150/30)*(s))+30;
  }
  else{ 
    g1= (150-(150/30)*(s-30))+30;
  }

  
    x3+= randx;
  y3 += randy;
  y4 += randy2;
  x4 += randx2;

  flower += 2;
  flower2 -= 0.1;
  }

    boolean dead() {
    if (keyPressed == true) {
      return true;
    } else {
      return false;
    }
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    stroke(g1);
  fill(g1);
    ellipse(x, y,r,r);
    
    
  stroke(g1, g1, g1 + flower);
  fill(g1, g1, g1 + flower);
      ellipse(x3, y3, r/10+flower2, r/10+flower2);
  ellipse(x4, y4, r/10+flower2, r/10+flower2);
  }

}


