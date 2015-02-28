
float pupil_x1, pupil_y1, pupil_x2, pupil_y2;
float d_x, d_y;
float theta;
float iris_x1, iris_y1, iris_x2, iris_y2;
float eye_r1, eye_r2, iris_r1, iris_r2, pupil_r1, pupil_r2;
float flip;
int fill_r, fill_g, fill_b;
int direction1, direction2;
int moveRate1, moveRate2;

void setup() {
  size(600, 600);
  pupil_x1 = width / 2 - 100;      //initial eye position
  pupil_y1 = height / 2;
  pupil_x2 = width / 2 + 100;
  pupil_y2 = height / 2;
  fill_r = int(random(255));
  fill_g = int(random(255));
  fill_b = int(random(255));
  direction1 = 1;                  //initial eye movement direction
  direction2 = 1;
  moveRate1 = 0;                   //initial eye movement rate - start stationary, move when click
  moveRate2 = 0;
  strokeWeight(3);
}

void draw() {
  background(250);

//Motion for entire eyeballs; up and down, bouncing off of the edge of the window

  if (direction1 == 1) {          //Motion, left eye
    pupil_y1 += moveRate1;
    if (pupil_y1 > height - eye_r1 / 2) {
      direction1 = -1;
    }
  } 
  else if (direction1 == -1) {
    pupil_y1 -= moveRate1;
    if (pupil_y1 < eye_r1 / 2) {
      direction1 = 1;
    }
  }

  if (direction2 == 1) {          //Motion, right eye
    pupil_y2 += moveRate2;
    if (pupil_y2 > height - eye_r2 / 2) {
      direction2 = -1;
    }
  } 
  else if (direction2 == -1) {
    pupil_y2 -= moveRate2;
    if (pupil_y2 < eye_r2 / 2) {
      direction2 = 1;
    }
  }
  
  //setting dimensions of eye parts based on mouse distance; "iris" is the invisible circle that the pupil moves along
  eye_r1 = 20 + dist(pupil_x1, pupil_y1, mouseX, mouseY) / 2;
  eye_r2 = 20 + dist(pupil_x2, pupil_y2, mouseX, mouseY) / 2;
  iris_r1 = 20;
  iris_r2 = 20;
  pupil_r1 = eye_r1 - 2*iris_r1;
  pupil_r2 = eye_r2 - 2*iris_r2;

  fill(fill_r, fill_g, fill_b);      //eye color is randomized

  ellipse(pupil_x1, pupil_y1, eye_r1, eye_r1);
  ellipse(pupil_x2, pupil_y2, eye_r2, eye_r2);

  fill(fill_b, fill_r, fill_g);      //pupil color is pseudorandomized with respect to eye color

  eyeDraw(pupil_x1, pupil_y1, iris_r1, pupil_r1);
  eyeDraw(pupil_x2, pupil_y2, iris_r2, pupil_r2);
}

void mouseClicked() {          //on mouse click, colors re-randomize, eye movement speed changes based on distance from center of window
  fill_r = int(random(255));
  fill_g = int(random(255));
  fill_b = int(random(255));

  moveRate1 = abs(int((mouseX - (width/2)) / 20));    //absolute value ensures non-negative movement speed, which confuses movement loops
  moveRate2 = abs(int((mouseY - (height/2)) / 20));
}

void eyeDraw(float px, float py, float iris, float pupil) {
  float ix, iy;
  float dx, dy;

  //pupils-follow-mouse, part 1
  dx = mouseX - px;
  dy = mouseY - py;

  if (mouseX > px) {        //flip allows pupils to follow mouse outside normal tangent range (PI/2 to -PI/2)
    flip = 1;
  } 
  else {
    flip = -1;
  }

  //pupils-follow-mouse, part 2
  theta = atan(dy / dx);
  ix = px + flip * iris * cos(theta);
  iy = py + flip * iris * sin(theta);

  ellipse(ix, iy, pupil, pupil);
}


