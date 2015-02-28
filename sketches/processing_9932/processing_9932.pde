
class Bubble {
  color c;
  // vertical velocity
  float vy;
  float x;
  float y;
  float d;  // diameter
  
  boolean newBall;
   
  Bubble(float x, float y){
    c = color(255);
    vy = 0;
    this.x = x;
    this.y = y;
    d = 1;
    // this is a new ball!
    newBall = true;
 }
   
  void display(){
    // After the ball is created and is released...
    /* I've placed this first in the condition as it's the state the ball will spend most time in.
       The efficiency increase is probably negligible in this case...  */
    if(!newBall){
      y = constrain(y, 0, height - d/2);
      y = y + vy;
      vy += gravity;
      
      if (y >= height-d/2){
        vy *= -0.9;     
      }
    }
    // Only true when ball first created and mouse is pressed      
    else {     
      if (d < 81){
        d++;
      }
      // force release once it reaches maximum size...
      else {
       newBall = false; 
      }
    }
    
    // drawing the ball is independent of the above condition...
    fill(c);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y, d, d);
  }
   
}

