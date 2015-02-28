


void setup() {
  size(800, 500);
  background(230);
  smooth();
}

void draw() {

  
 drawCat(20, 55, -100);
  drawCat(10, 55, 60);
  drawCat(20, 55, 280);
  
}

void drawCat(int k, int l, float moveX) { //draws cat

if(mousePressed == true) {
    k = 10;
  }
  else if(mousePressed == false) {
    k = 20;
  }
  
  /*if (millis() >= 0) {
   moveX -= 1; 
  }*/
    
  fill(193, 189, 184);
  triangle(170 + moveX, 100, 250 + moveX, 180, 180 + moveX, 200); //left ear
  triangle(330 + moveX, 100, 250 + moveX, 180, 320 + moveX, 180); // right ear
  quad(190 + moveX, 360, 215 + moveX, 360, 210 + moveX, 400, 200 + moveX, 400); //left leg
  quad(310 + moveX, 360, 285 + moveX, 360, 290 + moveX, 400, 300 + moveX, 400); //right leg
  triangle(210 + moveX, 402, 200 + moveX, 402, 205 + moveX, 425); //left calf
  triangle(290 + moveX, 402, 300 + moveX, 402, 295 + moveX, 425); //right calf
  triangle(206 + moveX, 423, 195 + moveX, 433, 206 + moveX, 433);
  triangle(296 + moveX, 423, 285 + moveX, 433, 296 + moveX, 433); // right foot
  //noStroke();
  ellipse(205 + moveX, 400, 12, 12); //left knee
  ellipse(295 + moveX, 400, 12, 12); //right knee
  //stroke(0,0,0);
  quad(220 + moveX, 220, 280 + moveX, 220, 320 + moveX, 370, 180 + moveX, 370); //torso
  ellipse(250 + moveX, 200, 200, 150); //head
  fill(250, 240, 0);
  ellipse(200 + moveX, 190, l, k); //left eye
  ellipse(300 + moveX, 190, l, k); //right eye
  fill(0, 0, 0);
  /*for(int j = 188; j < width/2; //need to figure out how to move the eyes
   for(mouseX < (width/2)){
   for(mouseX > 188){
   int j = mouseX;
   }
   }
   */
  if (mouseX <= width/2 - 25 + moveX) {
    ellipse(190 + moveX, 190, 6, k-2); //left pupil originall
    ellipse(290 + moveX, 190, 6, k-2); //right pupil
  }
  else if (mouseX >= width/2 +25 + moveX) {
    ellipse(215 + moveX, 190, 6, k-3); //left pupil originall
    ellipse(315 + moveX, 190, 6, k-3);
  }
  else {
    ellipse(205 + moveX, 190, 6, k-2);
    ellipse(305 + moveX, 190, 6, k-2);
  }
  /*else if (mouseX > k/2 - 25) {
    if (mouseX < k/2 +25) {
      ellipse(205, 190, 6, i-2);
      ellipse(305, 190, 6, i-2);
    }
  }
  */
  
  if(keyPressed){
    noStroke();
    fill(242, 159, 159, 100);
    ellipse(185 + moveX, 215, 35, 25);
    ellipse(315 + moveX, 215, 35, 25);
    //ellipse(250, 200, 200, 150); //head
  }


  strokeWeight(2);
  stroke(254, 170, 170);
  triangle(246 + moveX, 202, 254 + moveX, 202, 250 + moveX, 206);
  strokeWeight(1.2);
  stroke(0, 0, 0);
  line(250 + moveX, 206, 236 + moveX, 220); //mouthleft
  line(250 + moveX, 206, 264 + moveX, 220); //mouthright
  line(170 + moveX, 210, 130 + moveX, 205); //whisker upper left
  line(170 + moveX, 215, 131 + moveX, 220); //whisker lower left
  line(330 + moveX, 210, 370 + moveX, 205); //whisker upper right
  line(330 + moveX, 215, 370 + moveX, 220); //whisker lower right
}






