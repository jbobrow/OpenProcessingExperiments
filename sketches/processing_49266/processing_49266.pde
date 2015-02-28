
class Bird {

  float x, y, speed, direction, distance, rad, viewangle, blind;
  float dis, phis, aim;
  int inSight;

  Bird() {
    x = random(width-20)+10;
    y = random(height-20)+10;
    speed = random(2, 10); //3
    direction = random(360);
    distance = random(100, 200);
    viewangle = random(5, 30);
    rad = viewangle*distance;
    rad = map(rad, 1000, 16000, 5, 30);
  }

  void vision() {
    pushMatrix();
    translate(x, y);
    fill(sign, 20);
    noStroke();
    // display visibility    
    // arc(0, 0, distance*2, distance*2, radians(viewangle-direction-180), radians(360-viewangle-direction-180)); 
    popMatrix();
    inSight=0;
    phis = 0;
    blind = direction-180;
    if (blind<0) {
      blind+=360;
    }
  }

  void sense(Bird b2) {
    dis = dist(x, y, b2.x, b2.y);
    float phi = angle(this, b2);

    pushMatrix();
    translate(x, y);
    fill(khaki, 255);
    if (
    dis<distance && (
    phi < blind-viewangle
      || phi > blind+viewangle)
      ) {
      inSight++;
      phis += phi;
    }
    popMatrix();
  }

  void fly() {
    if (inSight != 0) {
      aim = phis/inSight;
      if (direction > aim) {
        if (direction-aim <= 180) {
          direction -= inSight;
        } 
        else {
          direction += inSight;
        }
      } 
      else {
        if (aim-direction > 180) {
          direction -= inSight;
        } 
        else {
          direction += inSight;
        }
      }
    }

    if (direction<0) {
      direction = 360+direction;
    }
    x += cos(radians(-direction)) * speed;
    y += sin(radians(-direction)) * speed;
    if (x < -distance -1) {
      x = width+distance;
    }
    if (x > width + distance+1) {
      x = -distance;
    }
    if (y < -distance-1) {
      y = height+distance;
    }
    if (y > height+distance+1) {
      y = -distance;
    }
  }

  void paint() {
    pushMatrix();
    translate(x, y);
    noStroke();
    if (blackwhite) {
      fill(bright);
    } 
    else {
      fill(dark);
    }

    if (streaks) {
      ellipse(0, 0, rad, rad);
    } 
    else {
      //point ahead
      if (blackwhite) {
        stroke(bright);
      } 
      else {
        stroke(dark);
      }
      line(0, 0, cos(radians(-direction)) * rad, sin(radians(-direction)) * rad);
    }
    //    text(inSight, 10, 10);
    //    text(aim, 10, 20);
    popMatrix();
  }
}


