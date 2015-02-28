
class Frog {

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
  PShape long_tongue;
  PShape medium_tongue;
  
  float jump_y = 1;                            // jump
  float jump_easing = 0.1;
  float targetY_jump = 100;
  //boolean jump = false;
  
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
  float s;                                     // scaling
  
  float s_frog;                                // scale the entire frog body
  int scale_frog;
  
  int c_xpos;                            // top left point of the belly
  int c_ypos;                            // use for locating the frog
  
  boolean jump = false;  
  boolean jump_other = false;
  int frogNum;
  
  Frog(int x, int y, int frogNumber, int frogSize) {
    
    c_xpos = x;
    c_ypos = y; 
    frogNum = frogNumber;
    scale_frog = frogSize;
    
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
    long_tongue = loadShape("long_tongue.svg");
    medium_tongue = loadShape("medium_tongue.svg");

  }
  
  void body() {
    s_frog = map(scale_frog, 1, 10, 0.3, 1);
    pushMatrix();
    translate(c_xpos, c_ypos - s_frog*100);
    scale(s_frog);
    legs();
    hands();  
    belly();
    head(); 
    eyes();
    cheeks();
    nose();  
    mouth(); 
    popMatrix();
  }
  
  void legs() {
    right_leg();
    left_leg();
  }
  
  void right_leg() {
    if(!jump){ 
      shape(right_leg_1, c_xpos + 98, c_ypos + 45);
      shape(right_leg_2, c_xpos + 100, c_ypos + 44);
      shape(right_leg_3, c_xpos + 101, c_ypos + 105);
      shape(right_leg_f1, c_xpos + 154, c_ypos + 110);
      shape(right_leg_f1, c_xpos + 152, c_ypos + 117);
      shape(right_leg_f2, c_xpos + 137, c_ypos + 130);
      shape(right_leg_f3, c_xpos + 117, c_ypos + 131);
    } else {
      shape(right_leg_jump, c_xpos + 78, c_ypos + 75);       
    }    
  }
  
  void left_leg() {
    if(!jump){
      shape(left_leg_1, c_xpos - 45, c_ypos + 42);
      shape(left_leg_2, c_xpos - 51, c_ypos + 42);
      shape(left_leg_3, c_xpos - 43, c_ypos + 102);
      shape(left_leg_f1, c_xpos - 45, c_ypos + 108);
      shape(left_leg_f1, c_xpos - 43, c_ypos + 115);
      shape(left_leg_f2, c_xpos - 28, c_ypos + 128);
      shape(left_leg_f3, c_xpos - 7, c_ypos + 129);
    } else {
      shape(left_leg_jump, c_xpos - 25, c_ypos + 75);
    }    
  }
    
  void hands() {
    left_hand();
    right_hand();
  }
  
  void right_hand() {
    s = map(mouseY, 0, 320, 1, 1.8);
    pushMatrix();
    translate(c_xpos + 100, c_ypos - 10);
    scale(s);
    shape(right_hand, 0, 0);
    shape(right_hand_palm, 44, -6);
    //shape(right_hand, 302, 157);
    //shape(right_hand_palm, 346, 151);
    popMatrix();
  }
  
  void left_hand() {
    s = map(mouseY, 0, 320, 1.5, 1);
    pushMatrix();
    translate(c_xpos - 50, c_ypos - 5);
    scale(s);
    shape(left_hand, 0, 0);
    shape(left_hand_palm, -23, -7);
    //shape(left_hand, 173, 156);
    //shape(left_hand_palm, 150, 150);
    popMatrix();
  }
  
  void belly() {
    shape(belly, c_xpos, c_ypos);
    /*
    beginShape();
    vertex(199.5, 150);
    bezierVertex(199.5, 150, 145, 214, 171, 248);
    bezierVertex(198, 282.5, 286.5, 277, 302.5, 248);
    bezierVertex(324, 208, 269, 149.5, 269, 149.5);
    endShape(CLOSE);
    */
  }  
  void head() {
    h = map(mouseY, 0, 320, 93, 130);
    if(frogNum == 1) {
      w = map(mouseX, 0, 480, 144, 300);
    } else {
      w = map(mouseX, 0, 480, 300, 200);
    }
    noStroke();
    fill(114, 191, 68);
    ellipse(c_xpos + 58, c_ypos - 28, w, h);
  }
  
  void eyes() {
    float y;
    noStroke();
    
    if(frogNum == 1) {
      if(mouseX < 240) {
        y = eye_green(c_xpos + 29, true, 1);
        eye_inner(c_xpos + 31, y, 1);
        y = eye_green(c_xpos + 91, false, 2);
        eye_inner(c_xpos + 89, y, 2);
      } else {
        y = eye_green(c_xpos + 91, true, 2);
        eye_inner(c_xpos + 89, y, 2);
        y = eye_green(c_xpos + 29, false, 1);
        eye_inner(c_xpos + 31, y, 1);
      }
    } else {
      if(mouseX < 240) {
        y = eye_green(c_xpos + 91, true, 2);
        eye_inner(c_xpos + 89, y, 2);
        y = eye_green(c_xpos + 29, false, 1);
        eye_inner(c_xpos + 31, y, 1);
      } else {
        y = eye_green(c_xpos + 29, true, 1);
        eye_inner(c_xpos + 31, y, 1);
        y = eye_green(c_xpos + 91, false, 2);
        eye_inner(c_xpos + 89, y, 2);
      }
    } 
  }
  
  float eye_green(int x, boolean showFirst, int side) {
    y = map(mouseY, 320, 0, c_ypos - 97, c_ypos - 77);
    if(frogNum == 1) {  
      if(side == 1) {
        w = map(mouseX, 0, 480, 35, 80);
      } else {
        w = map(mouseX, 0, 480, 80, 35);
      }
    } else {
      if(side == 1) {
        w = map(mouseX, 0, 480, 80, 35);
      } else {
        w = map(mouseX, 0, 480, 35, 80);
      }
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
    if(frogNum == 1) {  
      if(side == 1) {
        w = map(mouseX, 0, 480, 27, 60);
      } else {
        w = map(mouseX, 0, 480, 60, 27);
      } 
    } else {
      if(side == 1) {
        w = map(mouseX, 0, 480, 60, 27);
      } else {
        w = map(mouseX, 0, 480, 27, 60);
      }
    }      
        
    fill(255); 
    ellipse(x, y, w, w);
      
    eyeArray = eye_balls(side, w, x, y);
    eye_shines(side, eyeArray[0], eyeArray[1], eyeArray[2]);
      
  }
  
  float[] eye_balls(int side, float w_eyeWhite, int x_eyeWhite, float y_eyeWhite) {
    if(frogNum == 1) {  
      if(side == 1) {
        w = map(mouseX, 0, 480, 20, 50);
      } else {
        w = map(mouseX, 0, 480, 50, 20);
      }
    } else {
      if(side == 1) {
        w = map(mouseX, 0, 480, 50, 20);
      } else {
        w = map(mouseX, 0, 480, 20, 50);
      }
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
    if(frogNum == 1) {  
      if(side == 1) {
        w = map(mouseX, 0, 480, 5, 23);
      } else {
        w = map(mouseX, 0, 480, 23, 5);
      }
    } else {
      if(side == 1) {
        w = map(mouseX, 0, 480, 23, 5);
      } else {
        w = map(mouseX, 0, 480, 5, 23);
      }
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
    w = map(mouseX, 240, 480, 21, 50);
    fill(204, 124, 69);
    if(mouseY < 160 && mouseX < 240 || frogNum == 2){
      w = 21;
    }
    ellipse(c_xpos + 12, c_ypos - 44, w, w);
    ellipse(c_xpos + 108, c_ypos - 44, w, w);
       
    fill(198, 95, 52);
    ellipse(c_xpos + 12, c_ypos - 42, 15, 15);
    ellipse(c_xpos + 108, c_ypos - 42, 15, 15);
  }
  
  void nose() {
    stroke(0);
    strokeWeight(1);
    strokeCap(ROUND);
    line(c_xpos + 55, c_ypos - 50, c_xpos + 55, c_ypos - 47);
    line(c_xpos + 60, c_ypos - 50, c_xpos + 60, c_ypos - 47);
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
    shape(mouth_open, c_xpos + 5, c_ypos - 30);
  }
  
  void mouth_tongue() {
    int x1 = c_xpos + 5;
    int x2 = c_xpos + 1;
    int x3 = c_xpos + 24;
    int x4 = c_xpos + 48;
    int x5 = c_xpos + 86;
    int x6 = c_xpos + 95;
    int x7 = c_xpos + 111;
    int x8 = c_xpos + 116;
    int x9 = c_xpos + 114;
  
    int y1 = c_ypos - 30;
    int y2 = c_ypos - 11;
    int y3 = c_ypos + 3;
    int y4 = c_ypos + 16;
    int y5 = c_ypos + 9;
    int y6 = c_ypos + 3;
    int y7 = c_ypos - 7;
    int y8 = c_ypos - 24;
    int y9 = c_ypos - 32;
    
    stroke(0);
    strokeWeight(1);
    strokeCap(ROUND);
    line(c_xpos + 9, c_ypos - 31, c_xpos, c_ypos - 28);
    line(c_xpos + 108, c_ypos - 33, c_xpos + 119, c_ypos - 31);
    
    if(mouseY < 150) {
      // open mouth
      float diff1 = map(mouseY, 0, 150, 12, 0);
      float diff2 = map(mouseY, 0, 150, 20, 0);
      float diff3 = map(mouseY, 0, 150, 28, 0);
      shape(mouth_open, c_xpos + 5, c_ypos - 29);
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
      shape(mouth_close, c_xpos + 5, c_ypos - 30);
    }
  }
  
  void tongue() {
    
    int rotate_y = mouseY-(c_ypos - 69);
    int rotate_x = mouseX-(c_xpos - 63);          //balance the tongue's moving range
    
    if(rotate_y < 180) {                //restrict the tongue's position
      rotate_y = 180;
    }
    
    fill(198, 95, 52);
    noStroke();
      
    float angle2 = atan2(rotate_y, rotate_x);
    pushMatrix();
    translate(c_xpos + 59, c_ypos - 35);
    rotate(angle2);
    scale(0.7, 0.7);
    
    if(mouseX < 96 || mouseX > 384) {    
      beginShape();
      vertex(83, 4);
      bezierVertex(113, 12, 111, 33, 98, 35);
      bezierVertex(84, 37, 56, 13, 56, 13);
      bezierVertex(36, 6, 50, 4, 50, 4);
      endShape();        
      stroke(135, 26, 32);
      strokeCap(ROUND);
      line(40, 4, 100, 25);        
    } else if(mouseX > 95 && mouseX < 193 || mouseX > 288 && mouseX < 385) {
      shape(medium_tongue, 0, 65);
    } else if(mouseX > 192 && mouseX < 289) {
      shape(long_tongue, 0, 50);
    }

    popMatrix();
  }
       
  void determineWhoJumps() {
    if(mousePressed && mouseX < width/2 && frogNum == 1) {
      jump = true;
    } else if(mousePressed && mouseX > width/2 && frogNum == 2) {
      jump = true;
    } else if(mouseY > 200 && frogNum == 2) {
      jump = true;
    }
    
    if(!jump) {                      // if no jump, show body 
      body();  
    } else if(jump) {
      runJump();
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
}

