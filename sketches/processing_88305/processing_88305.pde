
float x1, x2, y1, y2;
float theta1, theta2 = HALF_PI;
float length;
int num_strips = 1;
Strip p;
ArrayList strips = new ArrayList();
boolean useFade = false;
void setup() {
  size(800, 800);
  smooth();
  for (int i =0; i<num_strips; i++) {
    strips.add(new Strip(TWO_PI / (i+1)));
  }
  p = new Strip(PI);
  colorMode(HSB, 360, 100, 100);
  background(255);
}
void draw() {
  if (!useFade) {
    background(0);
  } 
  else {
    fill(255, 0, 0, 20);
    rect(-10, -10, width+20, height+20);
  }
  for (int i =0; i<strips.size(); i++) {
    Strip s = (Strip) strips.get(i);
    s.update();
    s.display();
    s.keyPress();
  }
  /*
  p.center_x = mouseX;
  p.center_y = mouseY;
  p.update();
  p.display();
  p.keyPress();*/
}

class Strip {
  float rotation_theta, length_theta, rot_inc, length_inc;
  float length, x, y, center_x, center_y;
  ArrayList points = new ArrayList();
  int num_points = 20;
  float key_inc = .005;
  boolean show_num = true;
  ////////////  ////////////  ////////////  ////////////
  Strip(float start_ang) {
    for (int i=0; i<num_points; i++) {
      points.add(new PVector(0, 0, i));
    }
    center_x = width*.5;
    center_y = height *.5;
    length = width*.45;
    rot_inc = start_ang;
    length_inc = .18;
  }
  ////////////  ////////////  ////////////  ////////////
  void update() {
    //    length = sin(length_theta)*width*.45;
    //    x = cos(rotation_theta) * length + width * .5;
    //    y = sin(rotation_theta) * length + height *.5;
    for (int i =0; i<points.size(); i++) {
      PVector p = (PVector) points.get(i);
      points.set(i, getPosition(p));
    };
    rotation_theta += rot_inc;
    length_theta += length_inc;
    while(rotation_theta > TWO_PI) {
      rotation_theta -= TWO_PI;
    }
    while (length_theta > TWO_PI) {
      length_theta -= TWO_PI;
    }
  }
  ////////////  ////////////  ////////////  ////////////
  void display() {
    strokeWeight(1);
    stroke(frameCount%360, 100, 100);
    noFill();
    beginShape();
    for (int i =0; i<points.size(); i++) {
      PVector p = (PVector) points.get(i);
      if ((i == 0) || (i == points.size()-1)) {
        curveVertex(p.x, p.y);
      }
      curveVertex(p.x, p.y);
    }
    endShape();
    if (show_num) {
      fill(255, 0, 100);
      text(rot_inc + " " + length_inc, 40, 40);
    }
  }
  ////////////  ////////////  ////////////  ////////////
  PVector getPosition(PVector cur_point) {
    //get angle offset from current point
    float off = cur_point.z;
    //subtract it from theta1
    float tempL = sin(length_theta - (off*length_inc)) * length;
    //    toReturn.x = ;
    //    toReturn.y = sin(rotation_theta - off) * tempL + center_y;

    PVector toReturn = new PVector(
    cos(rotation_theta - (off*rot_inc)) * tempL + center_x, 
    sin(rotation_theta - (off*rot_inc)) * tempL + center_y, cur_point.z);
    return toReturn;
  }
  ////////////  ////////////  ////////////  ////////////
  void keyPress() {
    if (keyPressed) {
      switch(keyCode) {
      case UP:
        length_inc += key_inc;
        break;
      case DOWN:
        length_inc -= key_inc;
        break;
      case  RIGHT:
        rot_inc += key_inc;
        break;
      case  LEFT:
        rot_inc -= key_inc;
        break;
      }
      switch(key) {
      case'=':
        PVector p = (PVector) points.get(points.size()-1);
        points.add(new PVector(0, 0, p.z+1));
        break;
      case '-':
        if (points.size() > 1) {
          points.remove(0);
        }
        break;
      case ' ':
        show_num = !show_num;
        break;
      }
    }
  }
};



