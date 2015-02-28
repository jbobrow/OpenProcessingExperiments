
//frog robot by Tara Ting

//instruction: press left and right hands to move the hands
//             click frog's belly to jump
//             frog's eyes and tongue will follow the black ball as it moves around

PShape fly;
PImage bg;

float x_fly, y_fly;                          // easing for the fly
float targetX, targetY;
float easing = 0.1;

float jump_y = 1;                            // jump
float jump_easing = 0.1;
float targetY_jump = 100;
boolean jump = false;

float[] eyeArray = new float[3];             // eyes
float radius_eye_green;
float x1;
float x2; 
float y1;
float y2;
float mx;                      
float my;

float w;                                     // width
float h;                                     // height
float y;                                     // y coordinate

float s_frog;                                // scale
float s_fly;

PShape belly;                                // body parts
PShape head;                    
PShape left_eye;
PShape left_hand;
PShape left_hand_palm;
PShape left_leg_1;
PShape left_leg_2;
PShape left_leg_3;
PShape left_leg_f1;
PShape left_leg_f2;
PShape left_leg_f3;
PShape left_leg_jump;
PShape mouth_close;
PShape mouth_open;
PShape right_eye;
PShape right_hand;
PShape right_hand_palm;
PShape right_leg_1;
PShape right_leg_2;
PShape right_leg_3;
PShape right_leg_f1;
PShape right_leg_f2;
PShape right_leg_f3;
PShape right_leg_jump;

float inc = 0.0;                     //grass
float inc2 = 0.0;                     

void setup() {
  size(480, 320);
  smooth();
  
  bg = loadImage("bg.png");
  fly = loadShape("fly.svg");

  belly = loadShape("belly.svg");
  head = loadShape("head.svg");
  left_eye = loadShape("left_eye.svg");
  left_hand = loadShape("left_hand.svg");
  left_hand_palm = loadShape("left_hand_palm.svg");
  left_leg_1 = loadShape("left_leg_1.svg");
  left_leg_2 = loadShape("left_leg_2.svg");
  left_leg_3 = loadShape("left_leg_3.svg");
  left_leg_f1 = loadShape("left_leg_f1.svg");
  left_leg_f2 = loadShape("left_leg_f2.svg");
  left_leg_f3 = loadShape("left_leg_f3.svg");
  left_leg_jump = loadShape("left_leg_jump.svg");
  mouth_close = loadShape("mouth_close.svg");
  mouth_open = loadShape("mouth_open.svg");
  right_eye = loadShape("right_eye.svg");
  right_hand = loadShape("right_hand.svg");
  right_hand_palm = loadShape("right_hand_palm.svg");
  right_leg_1 = loadShape("right_leg_1.svg");
  right_leg_2 = loadShape("right_leg_2.svg");
  right_leg_3 = loadShape("right_leg_3.svg");
  right_leg_f1 = loadShape("right_leg_f1.svg");
  right_leg_f2 = loadShape("right_leg_f2.svg");
  right_leg_f3 = loadShape("right_leg_f3.svg");  
  right_leg_jump = loadShape("right_leg_jump.svg");  
}

void draw() {
  background(225);
  bg();
    
  if(mousePressed) {
    jump = true;
  }
  
  if(!jump) {                      // if no jump, show body 
    body();
  } else {
    runJump();
  }

  fly();
  grass_swaying();                 //grass swaying

}

void bg() {
  float x = map(mouseX, 0, 480, 0, -452);
  image(bg, x, 0);
}

/*
void jump_key() {
  if(mouseX < 315 && mouseX > 158 && mouseY > 153 && mouseY < 279) {
    jump = true;     
  } 
}
*/

void fly() {
  s_fly = map(mouseX, 0, 480, 48, 200);
  noStroke();
  targetX = mouseX;
  x_fly = x_fly + ((targetX - x_fly) * easing);
  targetY = mouseY;
  y_fly = y_fly + ((targetY - y_fly) * easing);
  shape(fly, x_fly, y_fly, s_fly, s_fly);
}

void grass_swaying() {
  inc += 0.01;
  float angle = sin(inc)/10.0 + sin(inc*1.2)/20.0;
  grass(18, 9, angle/1.3, 3);
  grass(33, 12, angle, 1);
  grass(44, 10, angle/1.3, 2);
  grass(62, 5, angle, 1);
  grass(300, 7, angle*2, 2);
  grass(200, 9, angle/1.3, 3);
  grass(250, 12, angle, 2);
  grass(98, 10, angle/1.3, 3);
  grass(135, 9, angle/1.3, 2);
  grass(147, 11, angle, 3);
  grass(460, 8, angle/1.3, 1);
  grass(414, 4, angle*2, 3);
  grass(387, 14, angle, 1);
  grass(444, 6, angle/1.3, 3);
}

void grass(int x, int units, float angle, int grass_color) {
  if(grass_color == 1){
    stroke(138, 227, 23);
  } else if(grass_color == 2) {
    stroke(104, 180, 0);
  } else {
    stroke(54, 131, 3);
  }
  pushMatrix();
  translate(x, 320);
  for(int i = units; i >0; i--) {
    strokeWeight(i);
    line(0, 0, 0, -8);
    translate(0, -8);
    rotate(angle);
  }
  popMatrix();
}

void body() {
  legs();
  hands();  
  belly();
  head(271, 137); 
  eyes();
  cheeks();
  nose();  
  mouth(); 
}

void legs() {
  right_leg();
  left_leg();
}

void right_leg() {
  if(!jump){ 
    shape(right_leg_1, 311, 210);
    shape(right_leg_2, 313, 209);
    shape(right_leg_3, 314, 270);
    shape(right_leg_f1, 367, 275);
    shape(right_leg_f1, 365, 282);
    shape(right_leg_f2, 350, 295);
    shape(right_leg_f3, 330, 296);
  } else {
    shape(right_leg_jump, 291, 240);       
  }    
}

void left_leg() {
  if(!jump){
    shape(left_leg_1, 168, 207);
    shape(left_leg_2, 162, 207);
    shape(left_leg_3, 170, 267);
    shape(left_leg_f1, 168, 273);
    shape(left_leg_f1, 170, 280);
    shape(left_leg_f2, 185, 293);
    shape(left_leg_f3, 206, 294);
  } else {
    shape(left_leg_jump, 188, 240);
  }    
}

void runJump() {
    jump_y = jump_y + ((targetY_jump - jump_y) * jump_easing);
    if(jump_y >= (targetY_jump - 1)) {
      jump_easing = -jump_easing;          // falling
    } 
    if(jump_y <= 0){                       // return to before jump status
      jump = false;         
      jump_easing = -jump_easing;
      jump_y = 1;
    }
    pushMatrix();
    translate(0, -jump_y);
    noStroke();
    body();                                // show body
    popMatrix();
}

void hands() {
  left_hand();
  right_hand();
}

void right_hand() {
  float s = map(mouseY, 0, 320, 1, 2);
  pushMatrix();
  translate(302, 157);
  scale(s);
  shape(right_hand, 0, 0);
  shape(right_hand_palm, 44, -6);
  //shape(right_hand, 302, 157);
  //shape(right_hand_palm, 346, 151);
  popMatrix();
}

void left_hand() {
  float s = map(mouseY, 0, 320, 1, 2);
  pushMatrix();
  translate(173, 157);
  scale(s);
  shape(left_hand, 0, 0);
  shape(left_hand_palm, -23, -7);
  //shape(left_hand, 173, 156);
  //shape(left_hand_palm, 150, 150);
  popMatrix();
}

void belly() {
  shape(belly, 213, 165);
  /*
  beginShape();
  vertex(199.5, 150);
  bezierVertex(199.5, 150, 145, 214, 171, 248);
  bezierVertex(198, 282.5, 286.5, 277, 302.5, 248);
  bezierVertex(324, 208, 269, 149.5, 269, 149.5);
  endShape(CLOSE);
  */
}  
void head(int x, int y) {
  h = map(mouseY, 0, 320, 93, 130);
  w = map(mouseX, 0, 480, 144, 300);
  noStroke();
  fill(114, 191, 68);
  ellipse(x, y, w, h);
}

void eyes() {
  float y;
  noStroke();
  
  if(mouseX < 240) {
    y = eye_green(242, true, 1);
    eye_inner(244, y, 1);
    y = eye_green(304, false, 2);
    eye_inner(302, y, 2);
  } else {
    y = eye_green(304, true, 2);
    eye_inner(302, y, 2);
    y = eye_green(242, false, 1);
    eye_inner(244, y, 1);
  }
  
}

float eye_green(int x, boolean showFirst, int side) {
    y = map(mouseY, 320, 0, 68, 88);
  if(side == 1) {
    w = map(mouseX, 0, 480, 35, 80);
  } else {
    w = map(mouseX, 0, 480, 80, 35);
  }
  if(!showFirst) {
    y = y - (w/2 - radius_eye_green);
  }    
  fill(114, 191, 68);
  ellipse(x, y, w, w);
  
  radius_eye_green = w/2;
  
  return y;

}

void eye_inner(int x, float y, int side) {
  
  if(side == 1) {
    w = map(mouseX, 0, 480, 27, 60);
  } else {
    w = map(mouseX, 0, 480, 60, 27);
  } 
  
  fill(255); 
  ellipse(x, y, w, w);
    
  eyeArray = eye_balls(side, w, x, y);
  eye_shines(side, eyeArray[0], eyeArray[1], eyeArray[2]);
    
}

float[] eye_balls(int side, float w_eyeWhite, int x_eyeWhite, float y_eyeWhite) {

  if(side == 1) {
    w = map(mouseX, 0, 480, 20, 50);
  } else {
    w = map(mouseX, 0, 480, 50, 20);
  }
  
  x1 = x_eyeWhite - w_eyeWhite/2 + w/2;
  x2 = x_eyeWhite + w_eyeWhite/2 - w/2; 
  y1 = y_eyeWhite - w_eyeWhite/2 + w/2;
  y2 = y_eyeWhite + w_eyeWhite/2 - w/2;
  
  mx = constrain(mouseX, x1, x2);
  my = constrain(mouseY, y1, y2);
  
  fill(0); 
  ellipse(mx, my, w, w);  
  eyeArray[0] = w;
  eyeArray[1] = mx;
  eyeArray[2] = my;
  
  return eyeArray;
}

void eye_shines(int side, float w_eyeBall, float x_eyeBall, float y_eyeBall) {

  int diff = 3;
  if(side == 1) {
    w = map(mouseX, 0, 480, 5, 23);
  } else {
    w = map(mouseX, 0, 480, 23, 5);
  }
  
  x1 = x_eyeBall - w_eyeBall/2 + w/2 + diff;
  x2 = x_eyeBall + w_eyeBall/2 - w/2 - diff; 
  y1 = y_eyeBall - w_eyeBall/2 + w/2 + diff;
  y2 = y_eyeBall + w_eyeBall/2 - w/2 - diff;
  
  mx = constrain(mouseX, x1, x2);
  my = constrain(mouseY, y1, y2);
  
  fill(255); 
  ellipse(mx, my, w, w);  
 
}

void cheeks() {
  
  fill(204, 124, 69);
  ellipse(225, 121, 21, 18);
  ellipse(321, 121, 21, 18);
  
  fill(198, 95, 52 );
  ellipse(225, 123, 15, 15);
  ellipse(321, 123, 15, 15);
}

void nose() {
  stroke(0);
  strokeWeight(1);
  strokeCap(ROUND);
  line(268, 115, 268, 118);
  line(273, 115, 273, 118);
}   

void mouth(){
  if(!jump){
    tongue();
    mouth_tongue();  
  } else {
    open_mouth();
  }
}

void open_mouth() { 
  shape(mouth_open, 218, 135);
}

void mouth_tongue() {
  int x1 = 218;
  int x2 = 214;
  int x3 = 237;
  int x4 = 261;
  int x5 = 299;
  int x6 = 308;
  int x7 = 324;
  int x8 = 329;
  int x9 = 327;
  int y1 = 135;
  int y2 = 154;
  int y3 = 168;
  int y4 = 181;
  int y5 = 174;
  int y6 = 168;
  int y7 = 158;
  int y8 = 141;
  int y9 = 133;
  
  stroke(0);
  strokeWeight(1);
  strokeCap(ROUND);
  line(222, 134, 213, 137);
  line(321, 132, 332, 134);
  
  if(mouseY < 150) {
    // open mouth
    float diff1 = map(mouseY, 0, 150, 12, 0);
    float diff2 = map(mouseY, 0, 150, 20, 0);
    float diff3 = map(mouseY, 0, 150, 28, 0);
    shape(mouth_open, 218, 136);
    fill(114, 191, 68);
    stroke(0);
    beginShape();
    vertex(x1, y1);
    bezierVertex(x1, y1, x2, y2-diff1, x3, y3-diff2);
    bezierVertex(x4, y4-diff3, x5, y5-diff3, x6, y6-diff2);
    bezierVertex(x7, y7-diff1, x8, y8, x9, y9);
    endShape();
  } else {
    // close mouth
    fill(114, 191, 68);
    shape(mouth_close, 218, 135);
  }
}

void tongue() {
  
  int rotate_y = mouseY-96;
  int rotate_x = mouseX-150;          //balance the tongue's moving range
  
  if(rotate_y < 110) {                //restrict the tongue's position
    rotate_y = 110;
  }
  
  fill(198, 95, 52);
  noStroke();
    
  float angle2 = atan2(rotate_y, rotate_x);
  pushMatrix();
  translate(272, 130);
  rotate(angle2);
  scale(0.7, 0.7);
  beginShape();
  vertex(83, 4);
  bezierVertex(113, 12, 111, 33, 98, 35);
  bezierVertex(84, 37, 56, 13, 56, 13);
  bezierVertex(36, 6, 50, 4, 50, 4);
  endShape();         
  stroke(135, 26, 32);
  strokeCap(ROUND);
  line(40, 4, 100, 25);        
  popMatrix();
}





 

