

int w = 600;  


int h = w;  


float hw = w/2;  


float hh = h/2;  


int xx = 20;  


int xy = 100;  


float r = 0;  


int first = 1;  


color[] colors = {  


  


  
//present rectangle color

  color(0,0,54),  


  color(50,0,255),  


  color(0,255,50),  


  color(0,174,255),  


  color(5,0,255),  


  color(0,32,40),  


  color(10,255,50),    


  color(0,204,200)};   


  


int blurOn = 0;    


PImage zz;  


  


void setup() {  


  


  size(600,600, P2D);  


  background(0);  


  frameRate(10);  


  //smooth();  


  


}  


  


  


int q = 0;  


  


void draw() {  


  


  


  float ss = random(0,w);  


  float sd = random(0,h); 


    


  noStroke();  


  fill(255);  


  r = -sin((PI * noise(q*.6)*6)-.5);  


  r = 3;  


  r %= -180;  


  int randN = int(random(10,50));  


  float s = random(xx,xy);  


  pushMatrix();  


  translate(ss,sd);  


  for (int i = 0; i < randN; i++) {  


    fill(colors[int(random(0,10))]);  


    rotate(HALF_PI*i);  


    translate(random(10,70),random(10,70));  


    s = s * .8;  


    rect(0,0,s,s);       


  }  


  


  


  popMatrix();  


  zz = get(0,0,w,h);  


  if (blurOn == 1) {  


    zz.filter(BLUR,1);  


  }  


  



  


  q++;  


  


  


}  

