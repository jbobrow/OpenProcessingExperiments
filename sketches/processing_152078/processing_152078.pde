
int sz = 250, num=30;
float theta, angle, rad = 150;

void setup() {
  size(500, 500);
  fill(0);
  stroke(255);
  strokeWeight(6);
}

void draw() {
  background(255);
  angle=0;
  for (int i=0; i<num; i++) {
    float x = width/2-rad/2 + cos(angle)*rad;
    float y = height/2 + sin(angle)*rad;
    float s = map(sin(theta+TWO_PI/num*i*2),-1,1,1,.7);
    float scal = 1-0.03*i;
    colorMode(HSB,255,100,100);
    int f = (int) 255/num*i;
    fill(f,100,80);
    //if (i==num-1) fill(#ffffff); 
    ellipse(x+30, y+30, sz*scal*s, sz*scal*s);
    angle -= (PI/num);
    colorMode(RGB);
  }
  theta +=0.0523;
  
  //if (frameCount%2==0 && frameCount<121) saveFrame("image-###.gif");
  
}

