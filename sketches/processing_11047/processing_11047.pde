
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11047*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
created by rebirth
 
 INTERFACE:
 Click to randomize properties.
 1-6: Set the number of levels
 R: toggle complete/partial revolutions (partial revs make smoother animations but asymmetrical designs)
 T: toggle trails
 A: Toggle auto animation
 I: Display property information
 Arrows: Navigate properties in display
 -/+: Modify properties in display
 F: freeze/unfreeze the programi 
 
 DESCRIPTION:
 Generates "spirographs" and makes trippy animations by changing the properties of the spirograph gradually.
 A spirograph is created by moving a circle around a circle.
 In this program up to 6 levels of circles are supported.*/

int ticks;
int tick_max = 2000;
int radius_min = 1;
int radius_max = 110;
int rev_min = 5;
int rev_max = 25;
boolean complete_rev = true;
boolean display = false;
boolean trails = true;
boolean frozen = false;
boolean auto = true;

float draw_hue = 0,draw_sat = tick_max,draw_bright = tick_max;
int color_cycle = 0;

int selected_level = 2;
int selected_property = 1;

float[] shape_x = new float[tick_max];
float[] shape_y = new float[tick_max];

Circle target0,target1,target2;
Circle[] circles = new Circle[10];

Spiro spiro;

PFont font;


void setup() {
  size(800,800);
  colorMode(HSB,tick_max);
  smooth();
  noFill();
  stroke(255);
  background(0);
  //noLoop();

  font = loadFont("ArialMT-48.vlw");
  textFont(font,17);

  circles[0] = new Circle(150, 1, true);
  circles[1] = new Circle(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
  circles[2] = new Circle(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
  circles[3] = new Circle(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
  circles[4] = new Circle(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
  circles[5] = new Circle(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
  spiro = new Spiro(4, circles);
}

void draw() {
  if (!frozen) {
    if (trails) {
      noStroke();
      fill(0, tick_max/9);
      rect(0,0,width, height);
    }
    else {
      background(0);
    }
    if (display) {
      displayInfo();
    }

    //circles[0].cycle(0); don't uncomment this in
    if (auto)
      spiro.cycle();
    create_shape();
    draw_shape();
  }
}

void create_shape() {
  ticks = 0;
  while (ticks < tick_max) {
    shape_x[ticks] = spiro.return_x(ticks);
    shape_y[ticks] = spiro.return_y(ticks);
    // println(ticks + ": " + shape_x[ticks] + ", " + shape_x[ticks]);
    ticks++;
  }
}

void draw_shape() {  
  for(int i2=0; i2 < tick_max - 1; i2++) {
    //   draw_sat = random(255);
    //    draw_bright = random(255);
    draw_hue = i2 + color_cycle;
    if (draw_hue > tick_max)
      draw_hue -= tick_max;
    //      println(draw_hue);
    stroke(draw_hue,draw_sat,draw_bright);
    //    line(shape_x[i2] + width/2, shape_y[i2] + height/2,shape_x[i2+1] + width/2, shape_y[i2+1] + height/2);  original
    line(shape_y[i2] + width/2, shape_x[i2] + height/2,shape_y[i2+1] + width/2, shape_x[i2+1] + height/2);
  }
  //  line(shape_x[tick_max - 1] + width/2, shape_y[tick_max - 1] + height/2,shape_x[0] + width/2, shape_y[0] + height/2); 
  color_cycle+= 100;
  if (color_cycle == tick_max)
    color_cycle = 0;
}

void mousePressed() {
  randomize();
}

void randomize() {
  if (complete_rev) {
    circles[1].update(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
    circles[2].update(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
    circles[3].update(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
    circles[4].update(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
    circles[5].update(random(radius_min,radius_max), int(random(rev_min,rev_max)), random(2) > 1);
  }
  else {
    circles[1].update(random(radius_min,radius_max), random(rev_min,rev_max), random(2) > 1);
    circles[2].update(random(radius_min,radius_max), random(rev_min,rev_max), random(2) > 1);
    circles[3].update(random(radius_min,radius_max), random(rev_min,rev_max), random(2) > 1);
    circles[4].update(random(radius_min,radius_max), random(rev_min,rev_max), random(2) > 1);
    circles[5].update(random(radius_min,radius_max), random(rev_min,rev_max), random(2) > 1);
  }
}


//keyboard input
void keyPressed() {
  switch (key) {
  case 'a':
  case 'A':
    auto = !auto;
    break;
  case 'r': 
  case 'R':
    complete_rev = !complete_rev;
    if (complete_rev) {
      spiro.int_revolutions();
    }
    break;
  case 'i':
  case 'I':
    display = !display;
    break;
  case 't':
  case 'T':
    trails = !trails;
    break;
  case 'f':
  case 'F':
    frozen = !frozen;
    break;
  case '1':
    spiro.update(1);
    break;
  case '2':
    spiro.update(2);
    radius_max = 200;
    if (selected_level > 2)
      selected_level = 2;
    break;
  case '3':
    spiro.update(3);
    radius_max = 150;
    if (selected_level > 3)
      selected_level = 3;
    break;
  case '4':
    spiro.update(4);
    radius_max = 110;
    if (selected_level > 4)
      selected_level = 4;
    break;
  case '5':
    spiro.update(5);
    radius_max = 100;
    if (selected_level > 5)
      selected_level = 5;
    break;
  case '6':
    spiro.update(6);
    radius_max = 90;
    break;
  case '-':
  case '_':
    switch (selected_property) {
    case 1:
      if (circles[selected_level - 1].radius > radius_min)
        circles[selected_level - 1].radius--;
      break;
    case 2:
      if (circles[selected_level - 1].revolutions > rev_min)
        circles[selected_level - 1].revolutions -= (complete_rev ? 1 : .1);
      break;
    case 3:
      circles[selected_level - 1].clockwise = !circles[selected_level - 1].clockwise;
      break;
    }
    break;
  case '=':
  case '+':
    switch (selected_property) {
    case 1:
      if (circles[selected_level - 1].radius < radius_max)
        circles[selected_level - 1].radius++;
      break;
    case 2:
      if (circles[selected_level - 1].revolutions < rev_max)
        circles[selected_level - 1].revolutions += (complete_rev ? 1 : .1);
      break;
    case 3:
      circles[selected_level - 1].clockwise = !circles[selected_level - 1].clockwise;
      break;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT && selected_level < spiro.levels)
      selected_level++;
    if (keyCode == LEFT && selected_level > 2)
      selected_level--;
    if (keyCode == UP && selected_property > 1)
      selected_property--;
    if (keyCode == DOWN && selected_property < 3)
      selected_property++;
  }
}

void displayInfo() {
  for(int i = 0; i < spiro.levels; i++) {
    fill(tick_max);
    text("level:", 0, 20);
    text("radius:", 0, 40);
    text("revolutions:", 0, 60);
    text("directions:", 0, 80);
    text(i+1, 100*i + 120, 20);
    text(circles[i].radius, 100*i + 100, 40);
    text(circles[i].revolutions, 100*i + 100, 60);
    text(circles[i].clockwise ? "clockwise" : "countercw", 100*i + 105, 80);
    /*fill(tick_max/3, tick_max, tick_max);
     text(circles[i].target_radius, 100*i + 100, 100);
     text(circles[i].target_revolutions, 100*i + 100, 120);
     text("radius target:", 0, 100);
     text("rev target:", 0, 120);
     */
  }
  stroke(tick_max,tick_max,tick_max);
  noFill();
  rect(100*selected_level,  5 + 20*selected_property, 90, 18);
}

//a signle circle. many of these make up a spirograph.
class Circle {
  float radius;
  float revolutions;
  boolean clockwise;

  float target_radius;
  float target_revolutions;
  boolean radius_up = true;
  boolean revolutions_up = false;

  Circle(float radius_in, float revolutions_in, boolean clockwise_in) {
    target_radius = radius = radius_in; 
    target_revolutions = revolutions = revolutions_in;
    clockwise = clockwise_in;
  }

  void update(float radius_in, float revolutions_in, boolean clockwise_in) {
    radius = radius_in; 
    revolutions = revolutions_in;
    clockwise = clockwise_in;
  }

  void int_revolutions() {
    revolutions = int(revolutions);
  }

  float return_x(int ticks) {
    if (clockwise)
      return cos(2 * (float)ticks/(tick_max - 1) * PI * revolutions) * radius;
    else
      return cos(-2 * (float)ticks/(tick_max - 1) * PI * revolutions) * radius;
  }
  float return_y(int ticks) {
    if (clockwise)
      return sin(2 * (float)ticks/(tick_max - 1) * PI * revolutions) * radius;
    else
      return sin(-2 * (float)ticks/(tick_max - 1) * PI * revolutions) * radius;
  }

  //mode 1 cycles form big to small, mode 2 heads to a random value and then selects another random value
  boolean cycle(int property) {
    switch (property) {
      //radius
    case 0:
      if (abs(radius - target_radius) < 1) {
        target_radius = random(radius_min,radius_max);
        return true;
      }
      else {
        if (target_radius > radius)
          radius += 1;
        else
          radius -= 1;
      }
      break;
      //revolutions
    case 1:
      float rev_change = (complete_rev ? 1 : .1);
      if (abs(revolutions - target_revolutions) < 1) {
        target_revolutions = random(rev_min,rev_max);
        return true;
      }
      else {
        if (target_revolutions > revolutions)
          revolutions += rev_change;
        else
          revolutions -= rev_change;
      }
      break;
    default:
      //println("error");
      break;
    }
    return false;
  }
}

//spirograph class.
class Spiro {
  int levels;
  boolean new_target = true;
  int active_level;//the level that is currently animating
  int property;//what is changing, radius or revoltuions
  Circle[] shapes = new Circle[10];

  Spiro(int levels_in, Circle[] shapes_in) {
    levels = levels_in;
    shapes = shapes_in;
  }

  //update the number of levels
  void update(int levels_in) {
    levels = levels_in;
  }

  //sets all Circles' revolutions to whole numbers
  void int_revolutions() {
    for(int i = 0; i < levels; i++) {
      shapes[i].int_revolutions();
    }
  }

  //total up all the circles x cors to get the current x cor
  float return_x(int ticks) {
    float total = 0;
    for(int i=0; i < levels; i++) {
      total += shapes[i].return_x(ticks);
    }
    return total;
  }

  //total up all the circles y cors to get the current y cor
  float return_y(int ticks) {
    float total = 0;
    for(int i=0; i < levels; i++) {
      total += shapes[i].return_y(ticks);
    }
    return total;
  }
  
  void cycle() {
    if (new_target) { //target is reached, select a new one
      active_level = int(random(1, levels));
      //println("active level: " + active_level);
      property = int(random(2));
      //println("property: " + property);
    }
    new_target = shapes[active_level].cycle(property);
  }
}



