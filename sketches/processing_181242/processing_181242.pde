
int count = 1;

int a = 1 * 40;
int c = 6 * 40;
int d = 5 * 40;
int e = 4 * 40;
int f = 3 * 40;
int g = 2 * 40;

void setup() {  //setup function called initially, only once
  
  frameRate(1);
  size(400, 300);
  background(255);
      
}

void draw() {  //draw function loops 
  
  while(count < 5){
      fill(#FF3300);
      ellipse(200, c, 50, 50);
  }
  
  while(count > 5 && count < 9){
      fill(FF9900);
      ellipse(200, c, 50, 50);
  }
  
}
