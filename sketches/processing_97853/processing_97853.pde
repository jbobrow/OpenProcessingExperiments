
PVector circle_pos;
float line_x;
float line_h;
float circle_rad = 150;
float epsilon = 3;
PFont fontA;
int stage;

void setup() {
  size(670, 530);
//  size(1080, 720);
  background(255);

  reset();
  strokeWeight(4*epsilon/3);

  fontA = loadFont("StCharles-48.vlw");
  textFont(fontA, 48);
  smooth();
}

void reset() {
  circle_pos = new PVector(0, height/2);
  line_x = random(circle_rad, width-circle_rad);
  line_h = 1.5*circle_rad;
  stage = 1;
  loop();
}

float step_size = 2;
int dir = 1;
void draw() {
  background(255);
  fill(0);
  text("Level " + ceil(step_size), 10, 40);

  fill(100, 200, 50, 90);
  stroke(0);
  ellipse(circle_pos.x, circle_pos.y, circle_rad, circle_rad);
  if (circle_pos.x+circle_rad > width)
    ellipse(circle_pos.x-width, circle_pos.y, circle_rad, circle_rad);
  if (circle_pos.x >= width+circle_rad)
    circle_pos.x -= width;

  switch(stage) {
  case 0: //Picking size of line.
    fill(200, 20, 50);
    text("Bonus stage!", 50, 100);
    line(line_x, height/2-line_h, line_x, height/2+line_h);
    line_h += dir*step_size;
    if (line_h < circle_rad/2-epsilon || line_h > 2*circle_rad)
      dir *= -1;

    break;
  case 1: //Moving circle towards line
    line(line_x, height/2-line_h, line_x, height/2+line_h);
    circle_pos.x += step_size;
    break;
  case 2: //Displaying score message
    line(line_x, height/2-line_h, line_x, height/2+line_h);
    noLoop();
    float centerLineDistance = abs(circle_pos.x - line_x);

    //Slicing the Circle
    if (centerLineDistance < circle_rad/2 - epsilon) {
      //close to the center
      if (centerLineDistance < epsilon) {
        //Line hasn't moved
        if (line_h == 1.5*circle_rad) {
          fill(200, 20, 50);
          text("Bonus stage!", 50, 100);
          //          println("Bonus Stage!");
          stage = 0;
          loop();
        }
        //Line moved, endpoints on circle
        else if (line_h <circle_rad/2 + epsilon)
        {
          fill(200, 20, 50);
          text("Boom! That's worth 2 bajillion points!!", 20, 100);
          step_size += 2;
          noLoop();
        }
        //Line moved, too big
        else {
          fill(200, 20, 50);
          text("Well, you tried", 50, 100);
          //          println("Well, you tried");
          stage = 2;
        }
      }
      else {
        fill(200, 20, 50);
        text("Slice!", 50, 100);
        //        println("Slice!");
        step_size += 1; 
        noLoop();
      }
    }
    else if (abs(centerLineDistance - circle_rad/2) <= epsilon) {
      fill(200, 20, 50);
      text("A Touch!! Well Done!", 20, 85);
      fill(200, 20, 50);
      text("Give yourself a bajillion points", 20, 130);
      //     println("A Touch!! Well Done!");
      //      println("Add a bajillion points for yourself.");
      step_size += 2;
    }
    else {
      fill(200, 20, 50);
      text("No Good :(", 20, 80);
      //      println("No Good :(");
      step_size = max(1, step_size-1);
    }
    break;
  }
}

void keyPressed() {
  if (key == 'p')
    println(circle_pos.x + ", " + circle_pos.y + "; " + line_x + ", " + line_h);
  if (key !=' ')
    return;
  if (stage == 2)
    reset();
  else
    stage = 2;
}
void mousePressed() {
  if (stage == 2)
    reset();
  else
    stage = 2;
}
