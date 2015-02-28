
float a = 1.25;
int i = 0;

float ang = HALF_PI;
  
float xnoise = random(10);
float ynoise = random(15);

float x,y,u,v;
float lastx = -999;
float lasty = -999;

void setup() {
  size(320,150);
  smooth();
  background(245);
  //noFill();
}

void draw() {
  
  translate(width/2-30,height/2);
  //rotate(QUARTER_PI);
  
 
  for(i = 0; i<100; i++) {
  
    strokeWeight(0.25);
    stroke(0,120);
    fill(255,120);
    float newang = noise(xnoise)*ang;
    float b = pow(sin(ang),2);
    
    x = a*i*cos(ang)/(1+random(b));
    y = a*i*sin(ang)*cos(ang)/(1+random(b));
    u = a/2*i*cos(ang);
    v = a/2*i*sin(ang);
    
  }

if(lastx>-999) {
// ellipse(x,y,10,10); 
  line(x,y,lastx,lasty); 
 // line(u,v,0,0);
   
  ang+=0.5;
  
  
 }
  lastx = x;
  lasty = y;
}
