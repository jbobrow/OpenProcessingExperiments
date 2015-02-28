
Square[] squares_bjekts;
int squares;
void setup() {
  //size(displayWidth,displayHeight);
  size(800,600);
  squares = width;
  //squares = 1500;
  squares_bjekts = new Square[squares];
  for (int i = 0; i < squares; i++) {
    squares_bjekts[i] = new Square(random(1,width), random(0, 100), random(1, 50), random(1, 50), 0, random(0.01, 0.99));
  }
  //square_1 = new Square(100, 0, 0, 0.1);

}

void draw() {
  background(255);
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
  float c = 100;
  float v = random(0,1);
  
  Square(float xx, float yy, float tempwidth, float tempheight, float sspeed, float ggravity) {
    x = xx;
    y = yy;
    speed = sspeed;
    gravity = ggravity;
    wwidth = tempwidth;
    hheight = tempheight;
  }
   // Display the square
   void display() {
    fill(c);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,wwidth,wwidth);
   }
  
   void calculate_changes() {
     
    // Add speed to location.
    c = c + ((c/c)*x/c);
    y = y + speed;
    
    // Add gravity to speed.
    speed = speed + (gravity + (wwidth*(gravity/10)));
    
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
      // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
      speed = speed * -0.95;  
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
    println(speed);
   }
}
