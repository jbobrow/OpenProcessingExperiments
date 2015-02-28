
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
  
  if(!jump) {                  // if no jump, show body 
    initial_show_body();
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
    runJump();
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
    vertex(199.5, 150);
    bezierVertex(199.5, 150, 145, 214, 171, 248);
    bezierVertex(198, 282.5, 286.5, 277, 302.5, 248);
    bezierVertex(324, 208, 269, 149.5, 269, 149.5);
    endShape(CLOSE);
    
    //head
    shape(head, 146, 30);
    ellipse(236, 116, 180, 114);

  } else {
    
    //belly
    image(body_img, 170, 150);
    
    //head
    image(head_img, 146, 30);
  }
  
    fill(255);
    //eyes
    ellipse(199, 53, 32, 32);
    ellipse(271, 53, 32, 32);
     
    //eye balls
    fill(0);
    float mx = constrain(mouseX, 195, 202);
    float my = constrain(mouseY, 50, 55);
    float mx2 = constrain(mouseX, 267, 274);
    float my2 = constrain(mouseY, 50, 55);
    ellipse(mx2, my2, 23, 23);
    ellipse(mx, my, 23, 23);
    
    //eye shines
    fill(255);
    float mx3 = constrain(mouseX, mx-6, mx+6);
    float my3 = constrain(mouseY, my-6, my+6);
    float mx4 = constrain(mouseX, mx2-6, mx2+6);
    float my4 = constrain(mouseY, my2-6, my2+6);
    ellipse(mx3, my3, 5, 5);
    ellipse(mx4, my4, 5, 5);
        
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
    ellipse(297.5, 93.5, 26, 23);
    ellipse(177, 93.5, 26, 23);
    fill(198, 95, 52 );
    ellipse(297.5, 96, 19.5, 17 );
    ellipse(177, 96.5, 19.5, 17);
    
    //nose
    stroke(0);
    strokeWeight(3);
    strokeCap(ROUND);
    line(232.5, 88, 232.5, 93);
    line(237.5, 88, 237.5, 93);
    
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
    shape(right_hand, 280, 128);
  } else {
    image(right_hand_img, 280, 128);
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
    shape(left_hand, 80, 127);
  } else {
    image(left_hand_img, 80, 127);
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
  if(!jump){ 
    if(skin_type == 1) {
      shape(right_leg, 285, 200);
    } else {
      image(right_leg_img, 285, 200);
    }
    
    /*
    stroke(132, 130, 51);
    strokeWeight(8);
    strokeCap(SQUARE);
    
    beginShape();
    vertex(292.5, 220.5);
    bezierVertex(292.5, 220.5, 360, 204.5, 363.5, 229.5);
    bezierVertex(367.5, 254.5, 324, 266, 289, 261);
    endShape();
    
    line(289.5, 260.5, 347, 277);
    line(291.5, 259.5, 326, 290);
    line(292.5, 259, 281.5, 290);
    */
  } else {
    if(skin_type == 1) {
      shape(right_leg_jump, 265, 220);
    } else {
      image(right_leg_jump_img, 265, 220);
    }
       
    /*
    stroke(132, 130, 51);
    strokeWeight(8);
    strokeCap(SQUARE);

    beginShape();
    vertex(305, 240);
    bezierVertex(305, 240, 330, 253, 306, 327);
    endShape();
    
    line(306, 324, 351, 340);
    line(306, 324, 329, 351);
    line(306, 324, 296, 347);
    */
  }    
}

void initial_show_legs_left() {
  if(!jump){
    if(skin_type == 1) {
      shape(left_leg, 100, 200);
    } else {
      image(left_leg_img, 100, 200);
    }
      
    /*
    stroke(132, 130, 51);
    strokeWeight(8);
    strokeCap(SQUARE);
  
    beginShape();
    vertex(173, 215.5);
    bezierVertex(173, 215.5, 106, 199.5, 102, 224);
    bezierVertex(98.5, 249.5, 176.5, 256, 176.5, 256);
    endShape();
    
    line(177, 255, 120, 272.5);
    line(174.5, 254, 140, 288.5);
    line(174, 253, 187, 284.5);
    */
  } else {
    if(skin_type == 1) {
      shape(left_leg_jump, 130, 220);
    } else {
      image(left_leg_jump_img, 130, 220);
    }
    /*
    stroke(132, 130, 51);
    strokeWeight(8);
    strokeCap(SQUARE);

    beginShape();
    vertex(168, 241);
    bezierVertex(168, 241, 143, 255, 167, 327);
    endShape();
    
    line(167, 324, 122, 340);
    line(167, 324, 145, 351);
    line(167, 324, 176, 347);
    */
  }    
}

void show_mouth(){
  if(!jump){
    draw_tongue();  
    if(skin_type == 1) {
      //mouth with tongue
      fill(114, 191, 68);
      stroke(0);
      strokeWeight(1);
      strokeCap(ROUND);
      line(162, 115, 175, 111);
      line(300, 109, 311, 112);
      beginShape();
      vertex(169, 113);
      bezierVertex(169, 113, 165, 137.5, 194, 154);
      bezierVertex(223, 170.5, 270, 161.5, 282.5, 154);
      bezierVertex(302, 142.5, 308, 120.5, 305, 110.5);
      endShape();
    } else {
      image(mouth_img, 169, 109);
    }
  } else {
    //mouth wide open  
    noStroke();
    beginShape();
    vertex(169, 113);
    bezierVertex(169, 113, 165, 137.5, 194, 154);
    bezierVertex(223, 170.5, 270, 161.5, 282.5, 154);
    bezierVertex(302, 142.5, 308, 120.5, 305, 110.5);
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
  translate(236, 96);
  rotate(angle2);
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
    translate(0, -jump_y);
    noStroke();
    initial_show_body();                   // show body
}

void keyPressed() {
   if(keyCode == 32 && skin_type == 1) {
      skin_type = 2;
   } else {
      skin_type = 1;
   }   
}

