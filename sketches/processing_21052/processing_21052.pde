
class Creature {
  int currentX, currentY;
  int lastX, lastY;
  float xoff = 0.0;
float randColor = random(255);
  
 


  float stepRange = 100;

  public Creature() {
     this(0,0);
  }

  public Creature(int x, int y) {
     this(x,y,3);
  }

  
  public Creature(int x, int y, float stepRange) {
    currentX = lastX = x;
    currentY = lastY = y;
    
    this.stepRange = stepRange;
    
  }

  public void update() {
    lastX = currentX;
    lastY = currentY;


    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));


    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);

    
  }



  public void draw() {
    
     xoff = xoff + .400;
  float n = noise(xoff) * height;
  
    stroke(255, xoff);
       colorMode( RGB, 255, 255, 255);
      line(currentX, currentY, lastX, lastY); 

    
 
 

  fill( 200, n, randColor);
  triangle( currentX, currentY%n, n%350, xoff, xoff, 500);

  }
}


