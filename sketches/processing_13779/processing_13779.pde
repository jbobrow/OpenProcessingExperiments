


class StreetLight {
  float x1, y1, h1, cx;
  color c, c1, c2, c3, c4;
  boolean on;
  float theta = 0, vertices = 6, delta;

  // constructor
  StreetLight(float tx, float ty, float th) {

    x1 = tx;
    y1 = ty;
    h1 = th;

    c = color(18, 18, 11);
    c1 = color(224, 146, 27);
    c2 = color(255);
    c3 = color(0);
    c4 = color(57, 56, 56);
  }

  boolean isOn() {
    return on;
  }

  void turnOn() {
    on = true;
  }

  void turnOff() {
    on = false;
  }

  void display() {
    drawLight();
  }

  void drawLight() {
    noStroke();
    fill(c);

    //post.
    rectMode(CORNER);
    rect(x1, y1, h1/25, -h1/1.25);

    //horizontal pole.
    rectMode(CORNER);
    rect(x1 - h1/50, y1 + (-h1*.68), h1/3, -h1/30);

    for(float n = y1 - h1/2; n >= y1 + (-h1*.68); n = n - h1/50) {
      //chain.
      cx = x1 + 11*h1/50;
      stroke(c4);
      delta = 2*PI/vertices;
      float xc1 = cx + (h1/100)*cos(theta);
      float yc1 = n + (h1/100)*sin(theta);
      float xc2, yc2;

      for (int i=0; i < vertices; i++) {
        theta += delta;
        xc2 = cx + (h1/100)*cos(theta);
        yc2 = n + (h1/100)*sin(theta);
        line(xc1, yc1, xc2, yc2);
        xc1 = xc2;
        yc1 = yc2;
      }
    }

    noStroke();
    fill(c1);

    //pumpkin.
    ellipse(x1 + 11*h1/50, y1 + h1/12.5 + (-h1*.52), h1/5, -h1/7.5);

    if (on == true) {

      fill(c2); 
      //nose.
      triangle(x1 + 11*h1/50 - h1/125, y1 + h1/13.16 + (-h1*.52), x1 + 11*h1/50 + h1/125, y1 + h1/13.16 + (-h1*.52), x1 + 11*h1/50, y1 + h1/10.97 + (-h1*.52));
      //left eye.
      triangle(x1 + 11*h1/50 - h1/18.52, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 - h1/41.67, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 - h1/25.64, y1 + h1/12.5 + (-h1*.52));
      //right eye.
      triangle(x1 + 11*h1/50 + h1/18.52, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 + h1/41.67, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 + h1/25.64, y1 + h1/12.5 + (-h1*.52));

      //mouth.  
      beginShape();
      arc(x1 + 11*h1/50, y1 + h1/10.97 + (-h1*.50), h1/11, h1/24, 0, PI);
      endShape(CLOSE);
    } 
    else {
      fill(c3);
      //nose.
      triangle(x1 + 11*h1/50 - h1/125, y1 + h1/13.16 + (-h1*.52), x1 + 11*h1/50 + h1/125, y1 + h1/13.16 + (-h1*.52), x1 + 11*h1/50, y1 + h1/10.97 + (-h1*.52));
      //left eye.
      triangle(x1 + 11*h1/50 - h1/18.52, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 - h1/41.67, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 - h1/25.64, y1 + h1/12.5 + (-h1*.52));
      //right eye.
      triangle(x1 + 11*h1/50 + h1/18.52, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 + h1/41.67, y1 + h1/16.67 + (-h1*.52), x1 + 11*h1/50 + h1/25.64, y1 + h1/12.5 + (-h1*.52));

      //mouth.  
      beginShape();
      arc(x1 + 11*h1/50, y1 + h1/10.97 + (-h1*.50), h1/11, h1/24, 0, PI);
      endShape(CLOSE);
    }

    noStroke();
    fill(c1);
    //tooth;
    rect(x1 + h1/5.2, y1 + (-h1*.68) + h1/3.4, h1/45, -h1/60);
  }
} // end of class StreetLight


