
/* color constants */
color not_white = #EDC9AF;
color not_red = #900020;
color not_black = #383037;

void setup() {
  strokeCap(PROJECT);
  ellipseMode(CENTER);
  size(600, 600);
  background(not_white);
  //noLoop();
}

void draw() {
  draw_face(0, -width/4, width, not_white, not_red, not_black);
  fill(not_white);
  noStroke();
  /* for covering up an unwanted bit */
  rect(0, 9*width/10.0, width/4, width/10.0);
  rect(3*width/4.0, 9*width/10.0, width/4, width/10.0);
  
  int r = width/4-1;
  int q = width/4;
  draw_face_in_circle(q, q, r, not_white, not_red, not_black);
  draw_face_in_circle(3*q, q, r, not_white, not_black, not_red);
  draw_face_in_circle(q, 3*q, r, not_black, not_white, not_red);
  draw_face_in_circle(3*q, 3*q, r, not_red, not_white, not_black);
  //save("wow.png");
}

void draw_face_in_circle(int x, int y, int r, color light, color mid, color dark) {
  fill(dark);
  stroke(not_white);
  strokeWeight(ceil(width/150.0));
  ellipse(x, y, 2*r, 2*r);
  float w = sqrt( 4*sq(r) / 3.0 );
  float x_face = x - w/2;
  float y_face = y - w/sqrt(2);
  draw_face(x_face, y_face, w, light, mid, dark);
}

void draw_face(float x, float y, float w, color light, color mid, color dark) {
  /* faces have proportions, like these */
  /* floating point precision, yo */
  float h = w * sqrt(2);  /* face is in a root 2 rect */
  float half_w = w/2;
  float eye_w = w / 5;
  float eyeshad_r = eye_w / sqrt(2);
  float eyeshad_y = h/2 - eyeshad_r;
  float eyeline = eyeshad_y + eye_w/2;
  float eyebag_y = eyeshad_y + eye_w;
  float eye_left = 3*w / 10.0;
  float eye_right = 7*w / 10.0;
  float pupil_d = eye_w - 2*(eye_w-eyeshad_r);
  float nostril_y = eyeline + eye_w;
  float nostril_left = half_w - eye_w/2;
  float nostril_right = half_w + eye_w/2;
  float brow_y = eyeline-1.5*(eyeline-eyeshad_y);
  float brow_left = half_w - 3*eye_w/8;
  float brow_right = half_w + 3*eye_w/8;
  float nose_y = 2*h / 3;
  float nose_left = half_w - (2*h/3.0 - eyeline)/4;
  float nose_right = half_w + (2*h/3.0 - eyeline)/4;
  float lip_y = 13*h / 18;
  float lip_left = half_w - eye_w/4;
  float lip_right = half_w + eye_w/4;
  float lipdivot_y = lip_y + h/54;
  float mouth_y = 7*h / 9;
  float mouthdivot_y = mouth_y + h/54;
  float chin_y = 5*h / 6;
  float chin_r = h/6;
  float eye_to_side = eye_left - eyeshad_r;
  strokeWeight(ceil(w/150.0));
  
  /* draw the outside of the head first */
  noStroke();
  fill(light);
  arc(x+half_w, y+half_w, w, w, radians(180), radians(360), OPEN);
  rect(x, y+half_w-1, w, eyeline-half_w+1);
  fill(mid);
  rect(x, y+eyeline, w, eye_to_side);
  arc(x+eye_to_side, y+eyeline+eye_to_side-1, 2*eye_to_side,
      2*(chin_y-eyeline-eye_to_side), radians(90), radians(180));
  arc(x+w-eye_to_side, y+eyeline+eye_to_side-1, 2*eye_to_side,
      2*(chin_y-eyeline-eye_to_side), 0, radians(90));

  /* draw the chin */
  arc(x+half_w, y+chin_y, 2*chin_r, 2*chin_r, 0, radians(180), OPEN);
  
  /* draw the surface of the face */
  fill(light);
  rect(x+eye_to_side, y+eyeshad_y, w - 2*eye_to_side, chin_y-eyeshad_y);
  stroke(dark);
  line(x+eye_to_side, y+eyeshad_y, x+eye_to_side, y+chin_y);
  line(x+w-eye_to_side, y+eyeshad_y, x+w-eye_to_side, y+chin_y);
  
  /* draw the cheeks */
  arc(x+eye_left, y+chin_y-1, 2*eyeshad_r, 2*eyeshad_r, 0, radians(180), OPEN);
  arc(x+eye_right, y+chin_y-1, 2*eyeshad_r, 2*eyeshad_r, 0, radians(180), OPEN);
  noStroke();
  /* trim the stroke of the cheeks */
  rect(x+eye_left, y+mouth_y, 2*eye_w, chin_y-mouth_y+1);
  
  /* draw the browline and the nostrils */
  fill(mid);
  quad(x+brow_left, y+brow_y, x+brow_right, y+brow_y,
       x+nostril_left, y+nostril_y, x+nostril_right, y+nostril_y);
  /* draw the bridge of the nose */
  fill(dark);
  triangle(x+half_w, y+eyeline, x+nose_left, y+nose_y, x+nose_right, y+nose_y);
  
  /* draw the eyes */
  ellipse(x+eye_left, y+eyeshad_y, 2*eyeshad_r, 2*eyeshad_r);
  ellipse(x+eye_right, y+eyeshad_y, 2*eyeshad_r, 2*eyeshad_r);
  /* the white of the eyes */
  fill(light);
  arc(x+eye_left, y+eyebag_y, 2*eyeshad_r, 2*eyeshad_r, radians(180)+radians(45), radians(360)-radians(45));
  arc(x+eye_right, y+eyebag_y, 2*eyeshad_r, 2*eyeshad_r, radians(180)+radians(45), radians(360)-radians(45));
  /* the iris/pupil */
  fill(dark);
  ellipse(x+eye_left, y+eyeline, pupil_d, pupil_d);
  ellipse(x+eye_right, y+eyeline, pupil_d, pupil_d);
  /* the eyelid */
  noFill();
  stroke(dark);
  ellipse(x+eye_left, y+eyeshad_y, 2*eyeshad_r, 2*eyeshad_r);
  ellipse(x+eye_right, y+eyeshad_y, 2*eyeshad_r, 2*eyeshad_r);
  strokeCap(SQUARE);
  arc(x+eye_left, y+eyebag_y, 2*eyeshad_r, 2*eyeshad_r, radians(180)+radians(45), radians(360)-radians(45), OPEN);
  arc(x+eye_right, y+eyebag_y, 2*eyeshad_r, 2*eyeshad_r, radians(180)+radians(45), radians(360)-radians(45), OPEN);
  strokeCap(PROJECT);
  noStroke();
  
  /* draw the mouth */
  fill(mid);
  beginShape();
  vertex(x+nostril_left, y+mouth_y);
  vertex(x+lip_left, y+lip_y);
  vertex(x+half_w, y+lipdivot_y);
  vertex(x+lip_right, y+lip_y);
  vertex(x+nostril_right, y+mouth_y);
  vertex(x+lip_right, y+mouth_y);
  vertex(x+half_w, y+mouthdivot_y);
  vertex(x+lip_left, y+mouth_y);
  endShape();
}
