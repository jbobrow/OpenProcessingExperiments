
PVector circle_position;
float line_x;
float circle_radius;
boolean ended;
PFont fontA;
void setup() {
  size(670, 730);
  background(255);
  circle_radius = 150;
  reset(); 
  strokeWeight(4);

  fontA = loadFont("StCharles-48.vlw");
  textFont(fontA, 48);

  smooth();
}
void reset() {
  ended = false;
  circle_position = new PVector(0, height/2);
  line_x = random(circle_radius, width-circle_radius);
  loop();
}
float step_size = 2;
void draw() {
  background(255);
  fill(0);
  text("Level " + ceil(step_size), 10, 40);

  if (ended) {
    noLoop();
    fill(100, 0, 0);
    float epsilon = 3;
    float dist_cenTolin = abs(circle_position.x - line_x);
    if (dist_cenTolin<circle_radius/2-epsilon) {
      text("Slice! Not Bad", 20, 85);
      step_size++;
    }
    else if (abs(dist_cenTolin - circle_radius/2) <= epsilon) {
      text("A Touch!! Well Done!", 20, 85);
      text("Add 1 Bajillion Points!", 20, 130);
      step_size += 2;
    }
    else {
      text("No Good :(", 20, 85);
      step_size = max(1, step_size-1);
    }
  }

  fill(100, 200, 50, 60);
  stroke(0);
  ellipse(circle_position.x, circle_position.y, circle_radius, circle_radius);
  circle_position.x = (circle_position.x + step_size);
  if (circle_position.x+circle_radius > width)
    ellipse(circle_position.x-width, circle_position.y, circle_radius, circle_radius);
  if (circle_position.x >= width+circle_radius)
    circle_position.x -= width;

  stroke(150, 32, 130);
  line(line_x, 150, line_x, height-circle_radius/2);

}


void keyPressed() {
  if(key != ' ')
    return;
  if (ended)
  {
    reset();
    ended = false;
  }
  else
    ended = true;
}

