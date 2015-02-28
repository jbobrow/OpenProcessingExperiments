
class Tent {
  color myColor;
  int initialX;
  int initialY;
  int break1X;
  int break1Y;
  int finalX;
  int finalY;
  int currentX;
  int currentY;
  int speed = 10; //inversely prop
  int weight = 10;
  boolean showTentacles;
  
  int direction;

  Tent[] myTentacles;


  Tent(int x, int y, color c) {
    this.initialX = x;
    this.initialY = y;
    this.myColor = c;
    currentX = initialX;
    currentY = initialY;
    direction = int(ceil(random(0,2))-1);
    if(direction==0){direction = -1; }
    //get a random direction: 1 or -1
    finalX = initialX + direction*int(random(50,200));
    finalY = initialY + int(random(100,400));
    myTentacles = new Tent[6];
    showTentacles = false; //don't display them by default
  }

  void setColor(color c) {
    this.myColor = c;
  }
  color getColor() {
    return this.myColor;
  }
  void setWeight(int i) {
    this.weight = i;
  }


  void update() {
    if(currentY<finalY) { //check if reached the final Y point;
      //currentY += (finalY-initialY)/speed;
      currentY += speed;
    }
    else { //if so then update the X point
      if(abs(currentX-initialX)<abs(finalX-initialX)) { //check if reached the final X point;
        //currentX += (finalX-initialX)/(finalX-initialX)speed;
        currentX += direction*speed;
      }
    }
  }

  void enable() {
    this.myColor = color(red(this.myColor),green(this.myColor),blue(this.myColor),255); // increase alpha
  }
  void disable() {
    this.myColor = color(red(this.myColor),green(this.myColor),blue(this.myColor),50); // reduce alpha
  }

  void showTentacles(boolean s) {
    if(myTentacles[0] == null) {
      createTentacles();
      println("creating my tentacles");
    }
    createTentacles();
    showTentacles = s;
  }

  void createTentacles() {
    //if not created yet, create tentacles

      for(int i = 0; i<myTentacles.length; i++) {
      myTentacles[i] = new Tent(finalX+3*direction,finalY,myColor);
      myTentacles[i].setWeight(this.weight - 4);
    }
  }

  void draw() {
    update();
    strokeWeight(weight);
    stroke(myColor);
    noFill();
    strokeCap(SQUARE);


    beginShape();
    vertex(initialX, initialY);
    vertex(initialX, currentY);
    vertex(currentX, currentY);
    endShape(); 

    fill(myColor);
    noStroke();
    ellipse(currentX, currentY, 20,20);

    //if it is set, display own tentacles
    if(myTentacles[0] != null && showTentacles == true) {
      for(int i = 0; i<myTentacles.length; i++) {
        myTentacles[i].draw();
      }
    }
  }
}


