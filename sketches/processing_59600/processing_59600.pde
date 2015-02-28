
// Code adapted from Casey Reas
  //http://www.openprocessing.org/user/54
  
class Rocks {
  //PROPERTIES 
  //for end
  int savedTime;
  int totalTime = 10000;

  //for boulders
  float angle = 0; 
  float offset = 275; 
  float speed = 0.05;
  float xspeed = 2;

  //CONSTRUCTOR
  Rocks () {
  }

  //MOVE
  void move () {
    // speed for boulders
    speed = map(mouseX, 0, width, 0.05, 0.1);

    //boulder 1
    y1 = sin(angle)*50 + offset;
    shape(boulder, x1, y1, 30, 30); 
    if (x1>width || x1 <0) {
      xspeed*=-1;
    }
    x1+=xspeed;
    angle += speed;

    //boulder 2
    y3 = cos(angle)*50 + offset+130;
    shape(boulder, x3, y3, 35, 35); 
    if (x2>width || x1 <0) {
      xspeed*=-1;
    }
    x3+=xspeed;
    angle += speed;

    //boulder 3
    y4 = sin(angle)*50 + offset+260;
    shape(boulder, x4, y4, 40, 40); 
    if (x>width || x1 <0) {
      xspeed*=-1;
    }
    x4+=xspeed;
    angle += speed;
  }

  //DISPLAY
  void display() {

    //text
    fill (255);
    textSize (15);
    text ("Health", 20, 30);
    textSize (15);
    text (health, 30, 50);
    noFill();
    strokeWeight (3);
    stroke (255);
    rect (10, 10, 60, 50);

    //boulder1
    float circleX1 = x1+10;
    float circleY1 = y1+10;
    float circleRadius1 = 15;

    float circleX2, circleY2;
    float circleRadius2 = 30;

    circleX2 = mouseX-20;
    circleY2 = mouseY-5;

    //boulder2
    float circleX3 = x3+10;
    float circleY3 = y3+10;
    float circleRadius3 = 15;

    //boulder3
    float circleX4 = x4+10;
    float circleY4 = y4+10;
    float circleRadius4 = 15;


    //if dog and boulder intersect then health is deducted
    if ((circleCircleIntersect(circleX1, circleY1, circleRadius1, circleX2, circleY2, circleRadius2) == true) || (circleCircleIntersect(circleX3, circleY3, circleRadius3, circleX2, circleY2, circleRadius2) == true)|| (circleCircleIntersect(circleX4, circleY4, circleRadius4, circleX2, circleY2, circleRadius2) == true)) {
      health--;
    }

    //if health reaches 0 the game is over
    if (health <= 0) {
      fill(0);
      noStroke();
      rect (0, 0, 900, 600);
      textSize (40);
      fill(255);
      text ("POOR GROUCHO", 300, 300);
      noFill();
    }

    //draw collision circles
    noFill();
    noStroke();
    ellipse(circleX1, circleY1, circleRadius1, circleRadius1);
    ellipse(circleX2, circleY2, circleRadius2, circleRadius2);
    ellipse(circleX3, circleY3, circleRadius3, circleRadius3);
    ellipse(circleX4, circleY4, circleRadius4, circleRadius4);
  }

  boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
    if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
      return true;
    } 
    else {
      return false;
    }
  }
}


