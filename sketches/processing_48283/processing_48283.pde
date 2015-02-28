
class Star {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
 Star(float tempR) {
    r = tempR;
    x = random(width);
    y = random(0,551);
    xspeed = 5;
    yspeed =5;
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    

      
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
     crash.trigger();
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
      crash.trigger();
    }
  
   
     
   for(int i=0; i<5; i++){
    if((x >= (xEnemy[i]-50)) && x <= (xEnemy[i]+50)){ 
    if((y >= (yEnemy[i]-50)) && y <= (yEnemy[i]+50)){
      die.trigger();
      s=s+100;
      
       fill(#2EDEFF);
      noStroke();
      ellipse(xEnemy[i], yEnemy[i], 120, 120);
      image(feathers,xEnemy[i], yEnemy[i]);
      xEnemy[i] = randx();
      yEnemy[i] = -100;
    }   
  }}}
  
  // Draw the ball
  void display() {
    image(fire,x,y);
  }
}

