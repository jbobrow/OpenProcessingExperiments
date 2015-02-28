
//Kevin Gutowski
//Friday April 11 2014
//A study of the golden ratio

int c = 16;
float t = 1;
int nprime = 1;

void setup() {
  size(800,800);  
  background(255);
  noStroke();
 
}

void draw() {
  t = pow(t,1.00001) + .1;
  nprime++;
  translate(width/2,height/2);
  //rotate(PI*sin(t/50));
  fill(255,255,255,30);
  rect(-width/2,-height/2,width,height);

  circles();
}

void circles() {
  
  
  for (int n = 1; n < nprime*3; n++) {;
    float r = c*sqrt(n);
    float radius = 3;
    float theta = n*PI*(3-sqrt(5));
    fill(62,map(r/2,1,width,0,200),138,100);
    float pulse = pow(sin(t*PI/3-n*PI/(t%100)),1.5);
    ellipse(r*cos(theta)/4,r*sin(theta)/4,pulse*radius+6,pulse*radius+6);
  }
}
