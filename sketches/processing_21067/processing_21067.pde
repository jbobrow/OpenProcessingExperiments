
class Creature {
  int currentX, currentY;
  int lastX, lastY;


  // creature width
  // creature height
  // number of eyes, 
  // color of feet,
  // 



  float stepRange = 500;

  public Creature() {
    this(50,0);
  }

  public Creature(int x, int y) {
    this(x,y,7);
  }

  // a class / object construtor, 
  // this gets automatically called when 
  // a new class is created.
  public  Creature(int x, int y, float stepRange) {
    currentX = lastX = x;
    currentY = lastY = y;

    this.stepRange = stepRange;
  }

  public void update() {
    lastX = currentX;
    lastY = currentY;

    // add a random increment to x and y
    currentX += int(random(-stepRange, stepRange));
    currentY += int(random(-stepRange, stepRange));

    // make sure that the position never leaves the screen
    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);
  }


  // class drawing function
  public void draw() {

    //    line(currentX, currentY, lastX, lastY); 
    noStroke();
    fill(255);
    ellipse(currentX, currentY, 40,40);

    ellipse(currentX - random(30), currentY + random(30), 5,5);
    ellipse(currentX + random(30), currentY - random(30), 5,5);
    ellipse(currentX + random(30), currentY + random(30), 5,5);
    ellipse(currentX - random(35), currentY - random(35), 5,5);
    ellipse(currentX + random(40), currentY + random(40), 5,5);

    stroke(0,0,255);
    fill(0,0,255);
    strokeWeight(2);

    line(currentX, currentY, lastX, lastY);



    // draw a line from this 
    // position to the last one.
  }
}





