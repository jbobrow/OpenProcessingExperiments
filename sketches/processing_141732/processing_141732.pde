
Cronograph hours = new Cronograph(24, 500, 0x77ffffff, 0x44ff0033, 0xff000055, true, true);
Cronograph minutes = new Cronograph(60, 400, 0x77ffffff, 0x44bbff00, 0xff000055, true, true);
Cronograph seconds = new Cronograph(60, 300, 0x77ffffff, 0x4400ffdd, 0xff000055, true, true);

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  float sec = second();
  float min = minute() + sec/60;
  float h = hour() + min/60;
  hours.display(h, width/2, height/2);
  minutes.display(min, width/2, height/2);
  seconds.display(sec, width/2, height/2);
}

void chordArc(float pos_x, float pos_y, float diameter, float arc_height) {
  pushMatrix();
  float radius = diameter/2;
  translate(pos_x, pos_y);
  
  for (int i = 0; i < arc_height; i++) {
    float y = radius-i;
    float x = sqrt(abs(radius * radius - y * y));
    rect(-x, y, 2*x, 1);
  }
  popMatrix();
}
class Cronograph {
  int range, diameter,  back_alpha, fore_alpha;
  color back_col, fore_col, line_col;
  float half_range;
  float radius;
  float position;
  boolean with_numbers;
  boolean half_way;
  Cronograph(int range, int diameter, color back_col, color fore_col, color line_col, boolean with_numbers, boolean half_way) {
    this.range = range;
    this.diameter = diameter;
    this.back_col = back_col;
    this.line_col = line_col;
    this.fore_col = fore_col;
    this.back_alpha = back_alpha;
    this.fore_alpha = fore_alpha;
    this.with_numbers = with_numbers;
    this.half_way = half_way;
  }

  void display(float position, int pos_x, int pos_y) {
    half_range = range/2;
    radius = diameter/2;
    this.position = position;

    pushMatrix();

    translate(pos_x, pos_y);
    rotate(-TWO_PI/half_range * position);
    //rotate(-TWO_PI/range * position);

    draw_back();
    
    pushMatrix();
    rotate(TWO_PI/range * position);

    draw_fill();
    popMatrix();

    if (with_numbers) draw_numbers();

    popMatrix();
  }

  void draw_back() {
    fill(back_col);
    noStroke();
    ellipse(0, 0, diameter, diameter);

    strokeWeight(1);
    stroke((line_col & 0xffffff) | ((line_col >> 1) & 0x7f000000));


    pushMatrix();

    for (int i = 0; i < half_range; i++) {
      float y = radius - (diameter/half_range * i);
      float x = sqrt(radius*radius - y*y);

      line(-x, y, x, y);

      rotate(PI/half_range);
    }

    popMatrix();
  }

  void draw_fill() {
    float y = radius - ((half_range - abs(half_range - position)) * diameter/half_range);
    float x = sqrt(abs(radius * radius - y * y))- radius*0.1;
    if (x < 0) x = 0;
    float angle = acos(y/radius);

    fill(fore_col);
    noStroke();

    //arc(0, 0, diameter, diameter, HALF_PI-angle, HALF_PI+angle);
    chordArc(0, 0, diameter, radius-y);

    stroke(line_col);
    strokeWeight(3);

    
    if (position > half_range) x = -x;
    
    if (position % half_range > 0) {
    //line(-x, y, 0, 0);
    line(-x, y, 0, y);
    fill(line_col);
    noStroke();
    ellipse(-x, y, 7, 7);
    } else {
      ellipse(0, y, radius*0.15, radius*0.15);
    }
  }

  void draw_numbers() {
    fill(line_col);
    noStroke();
    textAlign(CENTER, CENTER);
    textSize(radius*0.08);

    pushMatrix();

    for (int i = 0; i < half_range; i++) {
      float y = radius - (diameter/half_range * i);
      float x = sqrt(radius*radius - y*y);
      float angle = acos(y/radius);


      pushMatrix();
      translate(-x, y);
      rotate(angle);
      if (position < half_range || !half_way) text(i, 0, 0);
      else text(int(i+half_range), 0, 0);
      popMatrix();

      rotate(PI/half_range);
    }

    popMatrix();
  }
}




