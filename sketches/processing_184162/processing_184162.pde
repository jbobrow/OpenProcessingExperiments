
float count;
float count_theta;

Dot[] dots = new Dot[360];

void setup() {
  size(400, 400);
  background(255);

  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Dot(i);
  }
}

void draw() {
  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);

  count = sin(count_theta);
  count_theta += 0.015;

  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(5);
  stroke(0, 0, 200, 80);
  strokeJoin(ROUND);
  fill(150, 150, 255);

  beginShape();
  for (int i = 0; i < dots.length; i++) {
    dots[i].move(count);
    curveVertex(dots[i].x, dots[i].y);
  }
  endShape(CLOSE);

  popMatrix();
}

class Dot {
  float x;
  float y;
  float theta;

  float goal_x;
  float goal_y;
  float goal_R;
  float default_x;
  float default_y;
  float default_R;

  float easing_x = 0.05;
  float easing_y = 0.05;

  Dot(float tmpTheta) {
    theta = tmpTheta;

    goal_R = 8;
    goal_x = goal_R * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
    goal_y = (-1) * goal_R * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) 
      - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)));

    /*
    default_R = 180;
     default_x = default_R * cos(radians(theta));
     default_y = default_R * sin(radians(theta));
     */
     
    default_R = 150 * sin(radians(theta*7));
    default_x = default_R * cos(radians(theta));
    default_y = default_R * sin(radians(theta));
  }

  void move(float count) {
    if (count < 0) {
      x += (goal_x - x) * easing_x;
      y += (goal_y - y) * easing_y;
    } else {
      x += (default_x - x) * easing_x;
      y += (default_y - y) * easing_y;
    }
  }
}



