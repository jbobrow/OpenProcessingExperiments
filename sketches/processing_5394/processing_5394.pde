
//frog robot by Tara Ting

//instruction: press left and right hands to move the hands
//             click frog's belly to jump
//             frog's eyes and tongue will follow the black ball as it moves around

float x, y;                    //easing for the black ball
float targetX, targetY;
float easing = 0.1;

int press_position = 0;        // 0 = release, 1 = left, 2 = right, 3 = body

float jump_y = 1;              // jump
float jump_easing = 0.1;
float targetY_jump = 100;
boolean jump = false;

int skin_type = 1;

PShape left_hand;
PShape right_hand;
PShape left_leg;
PShape right_leg;
PShape head;
PShape left_hand_click;
PShape left_leg_jump;
PShape right_leg_jump;
PShape rightjump_long;
PShape leftjump_long;

PImage left_leg_jump_img;
PImage right_leg_jump_img;
PImage left_leg_img;
PImage right_leg_img;
PImage left_hand_img;
PImage right_hand_img;
PImage left_hand_click_img;
PImage head_img;
PImage body_img;
PImage mouth_img;

PImage fly;

float inc = 0.0; //grass
float inc2 = 0.0; //grass

int frog_sway = 0;
int left_right = 1;
float frog_angle = 0;
float frog_angle_inc = PI/128;

int x_shift = -236;
int y_shift = -214;

int enter_flag = 0;

float jump_y_pressed = 1;              // jump
float jump_easing_pressed = 0.1;
float targetY_jump_pressed = 100;
boolean key_pressed = false;

int arrow_key = 0;

float time_interval = 0.4;
float swing_interval1 = 10.0;
float swing_interval2 = 20.0;

void setup() {
  size(480, 320);
  smooth();
  
  left_hand = loadShape("left_hand.svg");
  right_hand = loadShape("right_hand.svg");
  left_leg = loadShape("left_leg.svg");
  right_leg = loadShape("right_leg.svg");
  head = loadShape("head.svg");
  left_hand_click = loadShape("left_hand_click.svg");
  left_leg_jump = loadShape("left_leg_jump.svg");
  right_leg_jump = loadShape("right_leg_jump.svg");
  rightjump_long = loadShape("rightjump_long.svg");
  leftjump_long = loadShape("leftjump_long.svg");
  
  left_leg_jump_img = loadImage("left_leg_jump_img.png");
  right_leg_jump_img = loadImage("right_leg_jump_img.png");
  left_hand_img = loadImage("left_hand_img.png");
  left_hand_click_img = loadImage("left_hand_click_img.png");
  right_hand_img = loadImage("right_hand_img.png");
  left_leg_img = loadImage("left_leg_img.png");
  right_leg_img = loadImage("right_leg_img.png");
  head_img = loadImage("head_img.png");
  body_img = loadImage("body_img.png");
  mouth_img = loadImage("mouth_img.png");
  
  fly = loadImage("fly.png");

}

void draw() {
  background(255);
  
  noStroke();
  fill(190, 221, 252);         // water
  rect(0, 180, 480, 140);
  
  if(!jump && arrow_key == 0) {                  // if no jump, show body 
    if(enter_flag == 1){
      pushMatrix();
      translate(236, 214);
      rotate(frog_swing());
      initial_show_body();
      popMatrix();   
    } else {
      pushMatrix();  
      translate(236, 214);
      initial_show_body();
      popMatrix();   
    }
  }
  
  stroke(132, 130, 51);        // stroke of hands after pressed mouse
  strokeWeight(8);
  strokeCap(SQUARE);

  if(mousePressed) {    
    if(press_position != 2 && (mouseX < 145 && mouseX > 60 && mouseY > 116 && mouseY < 201)) {
      press_position = 1;
    } else if(press_position != 1 && (mouseX < 398 && mouseX > 332 && mouseY > 125 && mouseY < 191)) {
      press_position = 2;
    } else if(press_position != 1 && press_position != 2 && (mouseX < 315 && mouseX > 158 && mouseY > 153 && mouseY < 279)) {
      jump = true;     
    }
    
    if(press_position > 0){ 
      if(press_position == 1){
        moving_left_hand();
       } else if(press_position == 2){
        moving_right_hand();
       }              
    }
  }
  else {
    press_position = 0;            //mouse release
  }
  
  if(jump){
    pushMatrix();
    translate(236, 214);
    runJump();
    popMatrix();
  } else if(arrow_key == 2){
      pushMatrix();
      translate(236, 214);
      rotate(PI/16);
      run_left_jump();
      popMatrix();
    } else if(arrow_key == 1) {
      pushMatrix();
      translate(236, 214);
      rotate(-PI/16);
      run_right_jump();
      popMatrix();
    }

  
  //black ball
  noStroke();
  targetX = mouseX;
  x = x + ((targetX - x) * easing);
  targetY = mouseY;
  y = y + ((targetY - y) * easing);
  image(fly, x, y);
  //fill(0);
  //ellipse(x, y, 15, 15);
  
  grass_swaying();  //grass swaying

}

float frog_swing() {
  inc2 += time_interval;
  float angle = sin(inc2)/swing_interval1 + sin(inc2*1.2)/swing_interval2;
  return angle;
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

void initial_show_body() {
  //legs
  noFill();
  initial_show_legs_right();
  initial_show_legs_left();
   
  // return hands position
  if(press_position != 1) {   
    initial_show_hand_left();
  } 
  if(press_position != 2) {
    initial_show_hand_right();
  }
  
  fill(114, 191, 68);
  noStroke(); 
    
  if(skin_type == 1) {
      
    //belly
    beginShape();
    vertex(199.5 + x_shift, 150 + y_shift);
    bezierVertex(199.5 + x_shift, 150 + y_shift, 145 + x_shift, 214 + y_shift, 171 + x_shift, 248 + y_shift);
    bezierVertex(198 + x_shift, 282.5 + y_shift, 286.5 + x_shift, 277 + y_shift, 302.5 + x_shift, 248 + y_shift);
    bezierVertex(324 + x_shift, 208 + y_shift, 269 + x_shift, 149.5 + y_shift, 269 + x_shift, 149.5 + y_shift);
    endShape(CLOSE);
    
    //head
    shape(head, 146 + x_shift, 30 + y_shift);
    ellipse(236 + x_shift, 116 + y_shift, 180, 114);

  } else {
    
    //belly
    image(body_img, 170 + x_shift, 150 + y_shift);
    
    //head
    image(head_img, 146 + x_shift, 30 + y_shift);
  }
  
    fill(255);
    //eyes
    ellipse(199 + x_shift, 53 + y_shift, 32, 32);
    ellipse(271 + x_shift, 53 + y_shift, 32, 32);
     
    //eye balls
    fill(0);
    float mx = constrain(mouseX, 195, 202);
    float my = constrain(mouseY, 50, 55);
    float mx2 = constrain(mouseX, 267, 274);
    float my2 = constrain(mouseY, 50, 55);
    ellipse(mx2 + x_shift, my2 + y_shift, 23, 23);
    ellipse(mx + x_shift, my + y_shift, 23, 23);
    
    //eye shines
    fill(255);
    float mx3 = constrain(mouseX, mx-6, mx+6);
    float my3 = constrain(mouseY, my-6, my+6);
    float mx4 = constrain(mouseX, mx2-6, mx2+6);
    float my4 = constrain(mouseY, my2-6, my2+6);
    ellipse(mx3 + x_shift, my3 + y_shift, 5, 5);
    ellipse(mx4 + x_shift, my4 + y_shift, 5, 5);
        
    /*
    //eye lids
    fill(163, 207, 86);
    beginShape();
    vertex(182.6, 49);
    bezierVertex(184, 43, 190, 37, 199, 37);
    bezierVertex(208, 37, 214, 44, 215, 49);
    bezierVertex(215, 49, 211, 40, 196, 42);  
    bezierVertex(187, 43, 182.6, 49, 182.6, 49);
    endShape();
   
   
    beginShape();
    vertex(254, 49);
    bezierVertex(256, 44, 261, 37, 271, 37);
    bezierVertex(280, 37, 285, 43, 287, 49);
    bezierVertex(287, 49, 283, 43, 274, 42);  
    bezierVertex(259, 40, 254.5, 49, 254.5, 49);
    endShape();
   */ 

    //cheeks
    fill(204, 124, 69);
    ellipse(297.5 + x_shift, 93.5 + y_shift, 26, 23);
    ellipse(177 + x_shift, 93.5 + y_shift, 26, 23);
    fill(198, 95, 52 );
    ellipse(297.5 + x_shift, 96 + y_shift, 19.5, 17 );
    ellipse(177 + x_shift, 96.5 + y_shift, 19.5, 17);
    
    //nose
    stroke(0);
    strokeWeight(3);
    strokeCap(ROUND);
    line(232.5 + x_shift, 88 + y_shift, 232.5 + x_shift, 93 + y_shift);
    line(237.5 + x_shift, 88 + y_shift, 237.5 + x_shift, 93 + y_shift);
    
    show_mouth(); 
}

void moving_left_hand() {
  float angle; 
  angle = atan2(mouseY-193, mouseX-175);
  pushMatrix();
  translate(175, 193);
  rotate(angle);
  
  if(skin_type == 1) {
    shape(left_hand_click, -20, -10);
  } else {
    image(left_hand_click_img, -20, -10);
  }
  
  //line(0, 0, 96, 0);
  //line(91, -14, 63, 0);
  //line(82, 26, 63, 0);
  popMatrix();
}

void moving_right_hand() {
  float angle;
  angle = atan2(mouseY-194, mouseX-296);
  pushMatrix();
  translate(296, 194);
  rotate(angle);
  if(skin_type == 1) {
    shape(right_hand, -20, -66);
  } else {
    image(right_hand_img, -20, -66);
  }
  //line(0, 0, 88, -50);   
  //line(60, -35, 76, -60);
  //line(60, -35, 87, -21);
  popMatrix();  
}

void initial_show_hand_right() {
  if(skin_type == 1) {
    shape(right_hand, 280 + x_shift, 128 + y_shift);
  } else {
    image(right_hand_img, 280 + x_shift, 128 + y_shift);
  }
  /*
  stroke(132, 130, 51);
  strokeWeight(8);
  strokeCap(SQUARE);

  line(296, 194, 376, 146.5);
  line(348, 161.5, 364.5, 136.5);
  line(348, 161.5, 375.5, 175.5);
  */
}

void initial_show_hand_left() {
  if(skin_type == 1) {
    shape(left_hand, 80 + x_shift, 127 + y_shift);
  } else {
    image(left_hand_img, 80 + x_shift, 127 + y_shift);
  }
  /*
  stroke(132, 130, 51);
  strokeWeight(8);
  strokeCap(SQUARE);
  
  line(175, 193, 85, 151);
  line(107, 133, 115, 164);
  line(84.5, 167, 116.5, 162); 
  */
}

void initial_show_legs_right() {
  if(!jump && arrow_key == 0){ 
    if(skin_type == 1) {
      shape(right_leg, 285 + x_shift, 200 + y_shift);
    } else {
      image(right_leg_img, 285 + x_shift, 200 + y_shift);
    }    
  } else if(jump) {
    if(skin_type == 1) {
      shape(right_leg_jump, 265 + x_shift, 220 + y_shift);
    } else {
      image(right_leg_jump_img, 265 + x_shift, 220 + y_shift);
    }
  } else if(arrow_key == 2) {
    if(skin_type == 1) {
      shape(leftjump_long, 265 + x_shift, 220 + y_shift);
    } else {
      shape(leftjump_long, 265 + x_shift, 220 + y_shift);
    }
  } else if(arrow_key == 1) {
    if(skin_type == 1) {
      shape(right_leg, 285 + x_shift, 200 + y_shift);
    } else {
      image(right_leg_img, 285 + x_shift, 200 + y_shift);
    }
  }    
}

void initial_show_legs_left() {
  if(!jump && arrow_key == 0){
    if(skin_type == 1) {
      shape(left_leg, 100 + x_shift, 200 + y_shift);
    } else {
      image(left_leg_img, 100 + x_shift, 200 + y_shift);
    }
   } else if(jump) {
     if(skin_type == 1) {
       shape(left_leg_jump, 130 + x_shift, 220 + y_shift);
     } else {
       image(left_leg_jump_img, 130 + x_shift, 220 + y_shift);
     } 
   } else if(arrow_key == 2) {
     if(skin_type == 1) {
       shape(left_leg, 100 + x_shift, 200 + y_shift);
     } else {
       image(left_leg_img, 100 + x_shift, 220 + y_shift);
     }
   } else if(arrow_key == 1) {
     if(skin_type == 1) {
       shape(rightjump_long, 130 + x_shift, 220 + y_shift);
     } else {
       shape(rightjump_long, 130 + x_shift, 220 + y_shift);
     }
   }   
 }    


void show_mouth(){
  if(!jump && arrow_key == 0){
    draw_tongue();  
    if(skin_type == 1) {
      //mouth with tongue
      fill(114, 191, 68);
      stroke(0);
      strokeWeight(1);
      strokeCap(ROUND);
      line(162 + x_shift, 115 + y_shift, 175 + x_shift, 111 + y_shift);
      line(300 + x_shift, 109 + y_shift, 311 + x_shift, 112 + y_shift);
      beginShape();
      vertex(169 + x_shift, 113 + y_shift);
      bezierVertex(169 + x_shift, 113 + y_shift, 165 + x_shift, 137.5 + y_shift, 194 + x_shift, 154 + y_shift);
      bezierVertex(223 + x_shift, 170.5 + y_shift, 270 + x_shift, 161.5 + y_shift, 282.5 + x_shift, 154 + y_shift);
      bezierVertex(302 + x_shift, 142.5 + y_shift, 308 + x_shift, 120.5 + y_shift, 305 + x_shift, 110.5 + y_shift);
      endShape();
    } else {
      image(mouth_img, 169 + x_shift, 109 + y_shift);
    }
  } else {
    //mouth wide open  
    noStroke();
    beginShape();
    vertex(169 + x_shift, 113 + y_shift);
    bezierVertex(169 + x_shift, 113 + y_shift, 165 + x_shift, 137.5 + y_shift, 194 + x_shift, 154 + y_shift);
    bezierVertex(223 + x_shift, 170.5 + y_shift, 270 + x_shift, 161.5 + y_shift, 282.5 + x_shift, 154 + y_shift);
    bezierVertex(302 + x_shift, 142.5 + y_shift, 308 + x_shift, 120.5 + y_shift, 305 + x_shift, 110.5 + y_shift);
    endShape(CLOSE);
  }
}

void draw_tongue() {
  
  int rotate_y = mouseY-96;
  int rotate_x = mouseX-150;          //balance the tongue's moving range
  
  if(rotate_y < 110) {                //restrict the tongue's position
    rotate_y = 110;
  }
  
  fill(198, 95, 52);
  noStroke();
    
  float angle2 = atan2(rotate_y, rotate_x);
  pushMatrix();
  translate(236 + x_shift, 96 + y_shift);
  rotate(angle2);
  beginShape();
  vertex(83, 4 );
  bezierVertex(113, 12, 111, 33, 98, 35);
  bezierVertex(84, 37, 56, 13, 56, 13);
  bezierVertex(36, 6, 50, 4 , 50, 4);
  endShape(); 
      
  stroke(135, 26, 32);
  strokeCap(ROUND);
  line(40, 4, 100, 25);        
  popMatrix();
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
    initial_show_body();                   // show body
    popMatrix();
}

void run_left_jump() {
    jump_y_pressed = jump_y_pressed + ((targetY_jump_pressed - jump_y_pressed) * jump_easing_pressed);
    if(jump_y_pressed >= (targetY_jump_pressed - 1)) {
      jump_easing_pressed = -jump_easing_pressed;          // falling
    } 
    if(jump_y_pressed <= 0){                       // return to before jump status  
      arrow_key = 0;      
      jump_easing_pressed = -jump_easing_pressed;
      jump_y_pressed = 1;
    }
    pushMatrix();
    translate(0, -jump_y_pressed);
    noStroke();
    initial_show_body();                   // show body
    popMatrix();
}

void run_right_jump() {
    jump_y_pressed = jump_y_pressed + ((targetY_jump_pressed - jump_y_pressed) * jump_easing_pressed);
    if(jump_y_pressed >= (targetY_jump_pressed - 1)) {
      jump_easing_pressed = -jump_easing_pressed;          // falling
    } 
    if(jump_y_pressed <= 0){                       // return to before jump status
      arrow_key = 0;      
      jump_easing_pressed = -jump_easing_pressed;
      jump_y_pressed = 1;
    }
    pushMatrix();
    translate(0, -jump_y_pressed);
    noStroke();
    initial_show_body();                   // show body
    popMatrix();
}

void keyPressed() {
   if(keyCode == 32 && skin_type == 1) {
      skin_type = 2;
   } else {
      skin_type = 1;
   }
   if(keyCode == ENTER){
    if(enter_flag == 0){
      enter_flag = 1;
    } else {
      enter_flag = 0;
    }
   }
   if(keyCode == LEFT){
     arrow_key = 1;
   } else if(keyCode == RIGHT) {
     arrow_key = 2;
   }
   if(keyCode == UP) {
     time_interval = time_interval + 0.1;
     swing_interval1 = swing_interval1 + 1.00;
     swing_interval2 = swing_interval2 + 2.00;
   } else if(keyCode == DOWN) {
     time_interval = time_interval - 0.1;
     swing_interval1 = swing_interval1 - 1.00;
     swing_interval2 = swing_interval2 - 2.00;
   }
   if(time_interval < 0) {
     time_interval = 0;
   }
}

