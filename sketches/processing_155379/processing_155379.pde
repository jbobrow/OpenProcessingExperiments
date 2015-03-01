
/**
 * Windmill 
 * 
 * Press buttons up or down to increase or decrease the speed of the wind. 
 */

PVector origin;
int speed;
int speedMax = 20;
int millHeight = 100;
int bladeLength = 40;
float angle;

windMill mill, mill2;

void setup () {
  size(400, 300);
  stroke(255);
  background(0);

  // origin = (30, 30);
  frameRate(15);
  mill = new windMill(0, 0, 100, 40);
}

void draw() {
  //println(origin);
  background(5);

  updateText();
  mill.display();
  blades();
  // line(100, 100, 100,150);
  //   translate(width / 2, height / 2);
  // pushMatrix();
  // rotate(radians(90));
  // line(0, 0, 0, -50);
  // popMatrix();
  // pushMatrix();
  // rotate(radians(130));
  // line(0, 0, 0, -50);
  // popMatrix();

  //println(frameCount%1.5);
}

void blades() {
 
}

void updateText() {
  textAlign(LEFT, TOP);
  text(speed+" knots", 20, 20);
  textAlign(LEFT, BOTTOM);
  text("the windmill: press 'a' or 'd' to control the speed of the mill", 20, height - 20);
}

void keyPressed() {
  if (key == 'a') {
    if (speed < speedMax) {
      speed++;
    }
  } 
  else if (key == 'd') {
    if (speed > 0) {
      speed--;
    }
  }
}



class windMill {
  int xo;
  int yo;
  int millHeight;
  int bladeLength;
  windMill(int x, int y, int m, int b) {
    xo = x;
    yo = y;
    millHeight = m;
    bladeLength = b;
  }
  void display() {
  translate(width / 2, height / 2);
  strokeWeight(2);
  float rotSpeed = speed*0.01;
  
  angle = angle + rotSpeed;
  
  println(angle);
  pushMatrix();
  stroke(200);
  line(xo, yo + millHeight, xo, yo);
  ellipse(xo, yo, 5, 5);
  
  rotate(angle);
  
  // draw the three blades
  for (int i = 0; i<3;i++) {
    //print(i);
    pushMatrix();
    rotate(radians(120*i));
    stroke(255 - 50*i);
    line(0, 0, 0, -50);
    popMatrix();
  }
  popMatrix();
    
    
  }

  void blade() {
    //    rotate();
    line(xo, yo - millHeight, xo, yo);
  }
}



