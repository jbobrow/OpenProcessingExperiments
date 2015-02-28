

 
float x, y;                    //beweging naar het balletje
float targetX, targetY; 
float easing = 0.1; 
 
int press_position = 0;        // 0 = release, 1 = left, 2 = right, 3 = body 
 
float jump_y = 1;              // springen
float jump_easing = 0.1; 
float targetY_jump = 100; 
boolean jump = false; 
 
void setup() { 
  size(480, 320); 
  smooth(); 
} 
 
void draw() { 
  background(32); 
  
  fill(100, 1300);
  ellipse(40,100, 40,40);
  fill(100, 80);
  ellipse(420, 20, 80, 80);
  fill(100, 20);
  ellipse(400, 260, 65, 65);
  fill(100, 120);
  ellipse(450, 180, 48, 48);
  ellipse(30, 200, 70, 70);
  fill(100, 140);
  ellipse(1, 1, 25, 25);
  ellipse(155, 320, 40, 40);
  
   

   
  if(!jump) {                  // Niet springen, laat lichaam zien 
    initial_show_body(); 
  } 
 
 
  stroke(100, 13000);        // handen bewegen bij muisklik op de hand
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
      float angle;  
      if(press_position == 1){ 
        angle = atan2(mouseY-193, mouseX-175); 
        pushMatrix(); 
        translate(175, 193); 
        rotate(angle); 
        line(0, 0, 96, 0); 
        line(91, -14, 63, 0); 
        line(82, 26, 63, 0); 
        popMatrix(); 
       } else if(press_position == 2){ 
        angle = atan2(mouseY-194, mouseX-296); 
        pushMatrix(); 
        translate(296, 194); 
        rotate(angle); 
        line(0, 0, 88, -50); 
        line(60, -35, 76, -60); 
        line(60, -35, 87, -21); 
        popMatrix();   
       }               
    } 
  } 
  else { 
    press_position = 0;            //mouse release 
  } 
  if(jump){ 
    runJump(); 
  } 
     
  //zwarte balletjes
  random(x + 20, x + 20);
  noStroke(); 
  targetX = mouseX; 
  x = x + ((targetX - x) * easing); 
  targetY = mouseY; 
  y = y + ((targetY - y) * easing); 
  fill(0); 
  ellipse(x, y, 4, 4);
  
  targetX = mouseX;
  x = x + (targetX - x); 
  ellipse(x + 9, y, 8, 9);
  
  targetY = mouseY;
  y = y +  (targetY - y + 65);
  ellipse(x, y + 4, 5, 5);
  
   targetX = mouseX; 
  x = x + ((targetX - x) * easing); 
  targetY = mouseY; 
  y = y + ((targetY - y) * easing);
  ellipse( x + 2, y + 4, 3, 3);
  
   
  
  
} 
 
void initial_show_body() { 
   
  //benen 
  noFill(); 
  initial_show_legs_right(); 
  initial_show_legs_left(); 
   
   
  fill(100, 1300); 
  noStroke();  
   
  //buik 
  beginShape(); 
  vertex(200, 100); 
  bezierVertex(199.5, 150, 145, 214, 171, 248); 
  bezierVertex(198, 282.5, 286.5, 277, 302.5, 248); 
  bezierVertex(324, 208, 269, 149.5, 269, 149.5);
 fill(100,100,100); 
  endShape(CLOSE); 
   
  //hoofd 
  ellipse(236, 116, 180, 160); 
   
  //ogen 
  ellipse(199, 53, 76, 66); 
  ellipse(271, 53, 76, 66); 
    
  //oogbal 
  fill(0); 
  float mx = constrain(mouseX, 195, 202); 
  float my = constrain(mouseY, 50, 55); 
  float mx2 = constrain(mouseX, 267, 274); 
  float my2 = constrain(mouseY, 50, 55); 
  ellipse(mx2, my2, 60, 60); 
  ellipse(mx, my, 60, 60); 
   
  //oog straalt 
  fill(255); 
  float mx3 = constrain(mouseX, mx-6, mx+6); 
  float my3 = constrain(mouseY, my-6, my+6); 
  float mx4 = constrain(mouseX, mx2-6, mx2+6); 
  float my4 = constrain(mouseY, my2-6, my2+6); 
  ellipse(mx3, my3, 5, 5); 
  ellipse(mx4, my4, 5, 5); 
  
  
  //rode wangen 
  fill(204, 124, 69); 
  ellipse(297.5, 93.5, 36, 33); 
  ellipse(177, 93.5, 36, 33); 
  fill(198, 95, 52 ); 
  ellipse(297.5, 96, 22, 27 ); 
  ellipse(177, 96.5, 22, 27); 
   
  //neus 
  noStroke(); 
  strokeWeight(1.5); 
  strokeCap(ROUND); 
 ellipse(235,80,32,62); 
  show_mouth(); 
   
  // handen terug naar oorspronkelijke positie 
  if(press_position != 1) {    
    initial_show_hand_left(); 
  }  
  if(press_position != 2) { 
    initial_show_hand_right(); 
  } 
 
} 
 
void initial_show_hand_right() { 
  stroke(100, 1330); 
  strokeWeight(8); 
  strokeCap(SQUARE); 

line(290,200,340,150);
ellipse(350, 143, 22, 22);
 
} 
 
void initial_show_hand_left() { 
  stroke(100, 1330); 
  strokeWeight(8); 
  strokeCap(SQUARE); 
   
  line(200, 200, 120, 170);
  ellipse(110, 164, 22, 22);
} 
 
void initial_show_legs_right() { 
  if(!jump){  
    stroke(100,3550); 
    strokeWeight(10); 
    strokeCap(SQUARE); 
     
    beginShape(); 
    vertex(292.5, 220.5); 
    bezierVertex(292.5, 220.5, 320, 204.5, 363.5, 229.5); 
    bezierVertex(367.5, 254.5, 324, 266, 289, 261); 
    endShape(); 
    
     ellipse(280,260,30,30);
     
   
 
  } else { 
    stroke(100, 1330); 
    strokeWeight(10); 
    strokeCap(SQUARE); 
 
    beginShape(); 
    vertex(305, 240); 
    bezierVertex(305, 240, 330, 253, 306, 327); 
    endShape(); 
   
   ellipse(305, 340, 30, 30);  
    
  }     
} 
 
void initial_show_legs_left() { 
  if(!jump){ 
    stroke(100,1330); 
    strokeWeight(10); 
    strokeCap(SQUARE); 
   
    beginShape(); 
    vertex(173, 215.5); 
    bezierVertex(173, 215.5, 136, 199.5, 102, 224); 
    bezierVertex(98.5, 249.5, 176.5, 256, 176.5, 256); 
    endShape(); 
    
    ellipse( 190, 260, 30, 30);
   
  } else { 
    stroke(100, 1330); 
    strokeWeight(10); 
    strokeCap(SQUARE); 
 
    beginShape(); 
    vertex(168, 241); 
    bezierVertex(168, 241, 143, 255, 167, 327); 
    endShape(); 
    
    ellipse(170, 339, 30, 30);
    
  
  }     
} 
 
void show_mouth(){ 
  if(!jump){ 
    draw_tongue();
    
    //mond met tong
    fill(100,100,100); 
    stroke(0); 
    strokeCap(ROUND); 
    line(162, 115, 175, 111); 
    line(300, 109, 311, 112); 
    beginShape(); 
    vertex(169, 113); 
    bezierVertex(169, 113, 165, 137.5, 194, 154); 
    bezierVertex(223, 170.5, 270, 161.5, 282.5, 154); 
    bezierVertex(302, 142.5, 308, 120.5, 305, 110.5); 
    endShape(); 
    fill(100,100);
  } else { 
    //mond wijd open 
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
  int rotate_x = mouseX-150;          //tong balanceren 
   
  if(rotate_y < 110) {                //tong positie
    rotate_y = 110; 
  } 
   
  fill(198, 95, 52); 
  noStroke(); 
     
  float angle2 = atan2(rotate_y, rotate_x); 
  pushMatrix(); 
  translate(236, 96); 
  rotate(angle2); 
  beginShape(); 
  vertex(90, 7); 
  bezierVertex(113, 12, 111, 33, 98, 35); 
  bezierVertex(80, 37, 56, 13, 56, 13); 
  bezierVertex(46, 6, 50, 4, 50, 4); 
  endShape();  
       
  stroke(135, 26, 32); 
  strokeCap(ROUND); 
  line(40, 4, 100, 25);         
  popMatrix(); 
} 
 
void runJump() { 
    jump_y = jump_y + ((targetY_jump - jump_y) * jump_easing); 
    if(jump_y >= (targetY_jump - 1)) { 
      jump_easing = -jump_easing;          // vallen 
    }  
    if(jump_y <= 0){                       // terug voor het vallen
      jump = false;          
      jump_easing = -jump_easing; 
      jump_y = 1; 
    } 
    translate(0, -jump_y); 
    noStroke(); 
    initial_show_body();                   // lichaam laten zien 
 
} 

