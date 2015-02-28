
int x = 250;  
int y = 250; 
int r = 10; 
int num = 8;  
int seed = 150; 

void setup() {  
  background(0);  
  size(500, 500);  
  noStroke();  
  smooth();  
  randomSeed(seed);  
}  

void draw() {  
  drawCircle(x, y, r, num);
}  

void drawCircle(float x, float y, int r, int thenum) {  

  fill(random(255), random(255), random(255),random(100,255));  
  ellipse(x, y, 2*r, 2*r);
  
  if (thenum >1) {  
    thenum = thenum - 1;  
    int grow= int(random(2, 5));   
    for (int i = 0; i < grow; i++) {  
      float angle = random(0, TWO_PI);  
      float thex = x + cos(angle)*thenum*12;  
      float they = y + sin(angle)*thenum*12;  
      if (mousePressed) { 
        drawCircle(thex, they, r/2, thenum);
      }
    }
  }
}  



