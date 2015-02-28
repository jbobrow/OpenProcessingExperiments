
class Circle {

  float xpos, ypos;       // X, Y Coordinates of Circle
  float radius;           // Radius
  float easing = 0.01;    // decrease speed closer to center
  int id;    
  float vx, vy;           // velocity
  int centerX = width/2;  // Center
  int centerY = height/2; 
  int attractor;          // radius of field size to be filled
  boolean over=false;
  float area;
  int colour= 0;              // color of cirlces
  int transparency=10;
  boolean inside;


  Circle[] others;

  Circle(float x, float y, float r, int ident, Circle[] other) {
    xpos = x;
    ypos = y;
    radius = r;
    id = ident;
    others = other;
  }

  // collission of cirlces -> bounce back
  void collide() {
    for (int i = id; i < numCircles; i++) {
      float dx = others[i].xpos - xpos;
      float dy = others[i].ypos - ypos;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].radius + radius;
      if (distance < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = xpos + cos(angle) * minDist;
        float targetY = ypos + sin(angle) * minDist;
        float ax = (targetX - others[i].xpos);
        float ay = (targetY - others[i].ypos);
        xpos -= ax;
        ypos -= ay;
        others[i].xpos += ax;
        others[i].ypos += ay;
      }
    }
  }   

  // move towards center until inside attractor field
  void move(int attract) {
    attractor = attract;
    // outside of field
    if (dist(xpos, ypos, centerX, centerY) > attractor-radius) {
      vx = (centerX - xpos) * easing;
      vy = (centerY - ypos) * easing;
      xpos += vx / (radius+(numCircles/10))*150;
      ypos += vy / (radius+(numCircles/10))*150;
    }
    // inside of field
    else if ((dist(xpos, ypos, centerX, centerY) > attractor/2-radius) && (full != true)) {
      vx = (centerX - xpos) * easing;
      vy = (centerY - ypos) * easing;
      xpos += vx / radius;
      ypos += vy / radius;
    }
  }

  // move circles by hand if mouseover
  void over(float mx, float my) {
    for (int i = id; i < numCircles; i++) {
      if (dist(xpos,ypos,mx,my) < radius) {
        over=true;
      }
      else {
        over=false;
      }
    }
  }

  void drag() {
    for (int i = id; i < numCircles; i++) {     
      if ((over==true) && (mousePressed==true)) {
        xpos=mouseX;
        ypos=mouseY;
      }
    }
  }

  // visual appearance of circles
  void display() {
    noStroke();
    if (over==false) {
      fill(colour,transparency);
      //noFill();
      stroke(colour,255);
    }
    else {
      fill(200,10,200,30);
      stroke(colour,255);
    }
    ellipse(xpos,ypos,radius*2,radius*2);
  }

  // size of circle surface
  void surface() {
    area = PI*sq(radius);
  }

  // check if circle is inside field area
  void position() {
    if (dist(xpos, ypos, centerX, centerY) < attractor-radius) {
      colour = 255;
      transparency=40;
      inside = true;
    }
    else {
      colour = 0;
      transparency=20;
      inside = false;
    }
  }

//  void printdata_x() {
//    output.print(xpos+",");
//  }
//  void printdata_y() {
//    output.print(ypos+",");
//  }
//  void printdata_r() {
//    output.print(radius+",");
//  }

  // output.println("ellipse("+ xpos+ ","+ ypos+ "," + radius*2 + "," + radius*2 +");");
}


