
class Creature {
  int currentX, currentY, currentXmouse, currentYmouse;
  int lastX, lastY;



  // creature width
  // creature height
  // number of eyes, 
  // color of feet,
  // 


  float stepRange = 3;

  public Creature() {
    this(0,0);
  }

  public Creature(int x, int y) {
    this(x,y,3);
  }

  // a class / object construtor, 
  // this gets automatically called when 
  // a new class is created.
  public Creature(int x, int y, float stepRange) {
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
    currentXmouse = mouseX;
    currentYmouse = mouseY;

    // make sure that the position never leaves the screen
    currentX = constrain(currentX, 0, width);
    currentY = constrain(currentY, 0, height);
  }


  // class drawing function
  public void draw() {

    stroke(pmouseX, pmouseY, 100);
    line(currentX + 50, currentYmouse+50, pmouseX, currentYmouse); 
    line(currentX + 50, currentYmouse+50, currentXmouse, currentYmouse +20); 
    line(currentX + 50, currentYmouse+50, currentXmouse, currentYmouse +40); 
    line(currentX + 50, currentYmouse+50, currentXmouse, currentYmouse +60); 
    line(currentX + 50, currentYmouse+50, currentXmouse, currentYmouse +80);
    line(currentX + 50, currentYmouse+50, pmouseX, currentYmouse +100);  


    // line(currentX, currentY, currentXmouse, lines);


    for(int k= 0; k<100; k+=20) {
      for (int l = 0; l<width; l+=30) {
        

        line(currentX - 50, currentYmouse-50, currentXmouse, currentYmouse + k);
        line(currentX - 50, currentYmouse-50, currentXmouse, currentYmouse - k);
        line(currentX - 50, currentYmouse-50, currentXmouse, currentYmouse );
        line(currentX - 50, currentYmouse-50, currentXmouse, currentYmouse );
        line(currentX - 50, currentYmouse-50, currentXmouse, currentYmouse );
        line(currentX - 50, currentYmouse-50, currentXmouse, currentYmouse );
        line(currentX - 50 , currentYmouse-50, currentXmouse - k, currentYmouse );
        line(currentX - 50, currentYmouse-50, currentXmouse + k, currentYmouse );
      }
    }
  }

}



