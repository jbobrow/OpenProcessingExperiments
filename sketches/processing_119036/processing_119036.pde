
Square[] squares_bjekts;
int squares;
void setup() {
  size(800,600);
  squares = width;
  //squares = 1000;
  squares_bjekts = new Square[squares];
  for (int i = 0; i < squares; i++) {
    squares_bjekts[i] = new Square(1*i, 1*i, random(1, 10), random(1, 10), 0.1*i, random(0.01, 0.99));
  }
}

void draw() {
  rectMode(CENTER);
  fill(0,0,0,0);
  rect(0,0,width,height);
  background(0);
   for (int i = 0; i < squares; i++) {
    squares_bjekts[i].calculate_changes();
    squares_bjekts[i].display();
  }
}

class Square {
  
  float x;
  float y;
  float speed;
  float gravity;
  float wwidth;
  float hheight;
  float c = random(10,150);
  float c2 = random(100,125);
  float c3 = random(100,125);
  float v = random(0,1);
  float owidth;
  float oheight;
  
  Square(float xx, float yy, float tempwidth, float tempheight, float sspeed, float ggravity) {
    x = xx;
    y = yy;
    speed = sspeed;
    gravity = ggravity;
    wwidth = tempwidth;
    hheight = tempheight;
    owidth = tempwidth;
    oheight= tempheight; 
  }
  
   void display() {
    fill(c, c2, c3, c);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,wwidth,wwidth);
   }
  
   void calculate_changes() {
     wwidth = wwidth + 0.01;
     if(wwidth> width/50) {
       wwidth = owidth;
     }
    
    c = c + ((c/c3)*x/c2);
    c2 = c2 + ((c3/c2)*x/c3);
    c3 = c3 + ((c3/c2)*x/c);
    y = y + speed;
    
    speed = speed + (gravity + (wwidth*(gravity/10)));
    
    if (y > height) {
      speed = speed * -0.95; 
      y=0; 
    } 
    
    if(v<0.5) {
      x = x-1.5;
    }
    if(v>0.5) {
      x = x+1.5;
    }
    if(x >= width){
      v=0;
    }
    
    if(x <= 0){
      v=1;
    }
    if (c > 255){
      c = 100;
    }
    if (c2 > 255){
      c2 = 100;
    }
    if (c3 > 255){
      c3 = 100;
    }
    
   if(y<-11) {
     y = -10;
      wwidth = owidth;
   }
  
   }
}
