
float r;
float g;
float b;
float a;
float x; 
float y;
float diam;
int count;
int state;
int countColor;

float rtwo; 
float gtwo; 
float btwo; 
 
void setup() {
  frameRate(300);
  count = 0;
  state = 0;
  size(300,300);
  background(255);
  smooth();   
}
 
void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(10);
  x = random(width);
  y = random(height);
  noStroke();
  fill(#FF0000);
  ellipse(x, y, diam, diam);
 
  count = count + 1;
  if(count > 30){
    count = 0;
    state = state + 1;
    if(state > 80){
       state = 0;
       background(0);
    }
  
  }
  countColor = countColor + 1;
  if(countColor > 40){
    countColor = 0;
    rtwo = random(255);
    gtwo = random(255);
    btwo = random(255);
    }
  
  fill(rtwo,gtwo,btwo,a);
  diam = state * 4;
  ellipse(width-150, (height/4)*3, diam,diam);
  fill(rtwo, gtwo, btwo, a);
  diam = state * 4;
  ellipse(width-150, (height/4)*2, diam,diam);
  fill(rtwo, gtwo, btwo, a);
  diam = state * 4;
  ellipse(width-150, height/4, diam,diam);
}



