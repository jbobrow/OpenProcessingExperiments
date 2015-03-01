
float x = 5;
float y = 0.0;
float  q = 0.0;
float xVelocity = 0.08;
float yVelocity = 0.2;
void setup() {
  size(500, 500);
  background(0);
}
void draw() {
  background(100);

  for (int f = 0; f < width; f = f + 10) {
    

      fill(255);
      ellipse(x, y, 30, 30);
      x = x + xVelocity;
      y = y + yVelocity;
      //q = q + 1;
//      
      if (x > width || x < 0) {
       // q = q + .06; 
        xVelocity *= -1; 
         //q = q + .06;
        //p = p+f;
      } else if (y > height || y< 0) {
        yVelocity *= -1;
      } 
    
//      else {
//        ellipse(i, p, 30, 30);
//      }
//        i = i + .07;
//      p = p + .002;
//      q = q + 1;
//      
    }
  }




