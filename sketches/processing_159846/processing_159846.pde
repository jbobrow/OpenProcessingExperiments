

int count;
int state;
 
float r;
float g;
float b;
float a;
 
float diam;
float x;
float y;
 
void setup() {
  count = 0;
  state = 0;
   
  size(600,600);
  background(0);
  smooth();   
  

}

void draw() {
   
  r = random(235);
  g = random(20);
  b = random(255);
  a = random(255);
  diam = random(10);
  x = random(width);
  y = random(height);
   
 
  count++;
  if(count > 100){
    count = 0;
    state++;
    if(state > 10){
       state = 0;
       background(0);
    }
  
  }
  fill(255,255,255);
  diam = random (state * 80);
  ellipse(x,y,diam,diam);



  //draw packman
  noStroke();
fill(#F2E215);
arc(100, 100, 85, 85, PI*0.25, PI*1.75); 
}

