
//P3D-ball practice
//Colorful Comet 
//The ball will rotate form far to near
//Chiming Lu


int radius = 100;
int A;


void setup() {
  size(500, 300, P3D);
  background(255);
  stroke(0);
  A=-1000;
  frameRate(10);
  
}

void draw() {
  
  A+=10;
  if (A>=600) {
    A=-1000;
    background(255);
  }

  //Bule line bule sphere
  ball(random(10), random(5), random(200), random(255));
  fill(5,200,255);
  stroke(#033BFF);
  sphere(50);
  //Bule line yellow sphere
  ball(random(15), random(5), random(255), random(200));
  fill(5,255,200);
  stroke(#FFF703);
  sphere(50);
  //Red
  ball(random(25), random(200), random(5), random(5));
  fill(200,5,5);
  stroke(#FF1803);
  sphere(90);
  
  
}

void ball(float rm, float ca, float cb, float cc) {
  translate(random(10), random(100), A);
  strokeWeight(random(rm));
  stroke(ca, cb, cc);

  //  translate(width/2, height/2, 0);
  rotateY(frameCount * 0.03);
  rotateX(frameCount * 0.04);
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;
  while (t < 180) {
    s += 18;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius*cos(radianS)*sin(radianT));
    float thisy = 0 + (radius*sin(radianS)*sin(radianT));
    float thisz = 0 + (radius*cos(radianT));
    if (lastx != 0) {
      line(thisx, thisy, thisz, lastx, lasty, lastz);
    }
    lastx = thisx;
    lasty = thisy;
    lastz = thisz;
  }
}

