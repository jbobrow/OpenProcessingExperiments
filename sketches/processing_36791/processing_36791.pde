
void setup() {
  size (400, 400); 
  fill(255, 0, 0);
}
//Swirly Medusa Head
void draw() {
  
  background(255,40);
  fill(255, 0, 0);
  float x_pos;
  float y_pos; 
  float randomLimiter = 20;//the scope of random
  int dotDistance = 15;//the distance between the dots
  int dotSize = 5; //dotSize
 //defines the x-coordinate  
  for (int x=180; x<200; x=x+dotDistance) {
//defines the y-coordinate    
    for (int y=180; y<=200; y=y+dotDistance) {
        
        // Fixed Default Position
       x_pos = x;
       y_pos = y;
      // Random Position based on mouse position
       x_pos = x_pos + random((-mouseX/randomLimiter),mouseX/randomLimiter);
       y_pos = y_pos + random((-mouseX/randomLimiter),mouseX/randomLimiter);
        // Constrain the dots so they stay on the screen
       x_pos=constrain(x_pos, dotSize, (400-dotSize));
       y_pos= constrain(y_pos, dotSize, (400-dotSize));
        //randomizing color (default being black) 
        //the colors work even without limiter
       float red = random(0, mouseX);
       red = map(red, 0,width, 0,255);
        
        //drawing the ellipses
      fill (0);
      ellipse (x_pos, y_pos, dotSize, dotSize);
      noStroke();
      fill (red, random(0, mouseX), random(0, mouseX),40);
      // 
      for(int curveCount = 0; curveCount < mouseX/20; ++curveCount) {
        
        beginShape();
        curveVertex(x_pos, y_pos);
        curveVertex(x_pos, y_pos);
        float intermediateX, intermediateY;
        int limiter = 50;
        intermediateX = x_pos + random((-mouseX/limiter),mouseX/limiter);
        intermediateY = y_pos + random((-mouseX/limiter),mouseX/limiter);
        curveVertex(intermediateX,intermediateY);
        limiter = 25;
        intermediateX = x_pos + random((-mouseX/limiter),mouseX/limiter);
        intermediateY = y_pos + random((-mouseX/limiter),mouseX/limiter);
        curveVertex(intermediateX,intermediateY);
        limiter = 10;
        intermediateX = x_pos + random((-mouseX/limiter),mouseX/limiter);
        intermediateY = y_pos + random((-mouseX/limiter),mouseX/limiter);
        curveVertex(intermediateX,intermediateY);
        limiter = 2;
        intermediateX = x_pos + random((-mouseX/limiter),mouseX/limiter);
        intermediateY = y_pos + random((-mouseX/limiter),mouseX/limiter);
        curveVertex(intermediateX,intermediateY);
        limiter = 1;
        intermediateX = x_pos + random((-mouseX/limiter),mouseX/limiter);
        intermediateY = y_pos + random((-mouseX/limiter),mouseX/limiter);
        curveVertex(intermediateX,intermediateY);
        endShape();
      }
    }
  }
} 


                
