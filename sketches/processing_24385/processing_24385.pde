


int x = 0;
int y = 0;
int a = 60;
int b = a*2;
int m = 0;
int n = 0;
int o = 20;

void setup(){
  size(300, 600);
  background(255);
  m = width;
}


void draw(){
  smooth();
  noStroke();
  fill(92, 220, 10, 110);
  while(y < height+50){
    ellipse(x, y, 100, 100);
    x = x + 50;
    if(x > width){
    x = 0;
    y = y + 50;
    }
  }
  
  while(a < 2500){
    fill(255, 255, 0, 80); 
    triangle(width*2, 0, 0, a, 0, b);
    a = a + a*2;
    b = b + b*2;
    }
    
    while(n < height) {
    stroke(61,147,4,20);
    strokeWeight(3);
    if(random(0,2) < 1) {
      line(width*2,0,m,n);
      m = m - o;
      if(m < -width) {
        m = width*2;
        n = n + o;
      }
    }
  }
}


