


void setup() {
  size(500, 500);
  background(230);
  smooth();
}

void draw() {

  
  drawBird(0, 9, 15);
  
  drawCat(20, 55, 120);
  
 if (millis() > 5000) {
   
   drawOlive(80, 121, 13, 50, 50,-110,100);
   fill(250, 240, 0);
  ellipse(200 + 120, 190, 55, 40); //left eye
  ellipse(300 + 120, 190, 55, 40); //right eye
  fill(0);
  ellipse(182 + 120, 195, 4, 16); //left pupil originall
  ellipse(282 + 120, 195, 4, 16);
 
  

}
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


void drawBird(int h, int i, int j) {
  if(mousePressed == true){
    h = 7;
  }
  else if (mousePressed == false){
    h = -3;
  }
 noStroke();
 fill(230); //bird underhead rect??
  rect(140,40,180,60);
  //HEAD PARTS START HERE
  noStroke();
  fill(255);
  triangle(250+h,65,305+h,72,250+h,100);//feather 2
  fill(114,118,137);
  ellipse(250+h,73,60,50);//head
  fill(255,129,131);
  triangle(250+h,47,310+h,60,280+h,72);//feather
  fill(170,162,155);
  quad(180+h,55,222+h,61,238+h,78,223+h,80);//beak
  if(keyPressed == true){
    i = 1;
    j = 1;       
  }
  else if (keyPressed == false){
    i = 9;
    j = 15;
  }
  fill(240,255,129);
  ellipse(242+h,71,15,j);//eyewhite
  fill(119,109,149);
  ellipse(241+h,70,9,i);//iris
/*HEAD PARTS ENDS HERE*/
  stroke(170,162,155);
  strokeWeight(5);
  line(180,140,190,160);
  line(180,170,190,160);
  noStroke();
  fill(142,136,109);
  rect(130,0,50,400);//tree
  //treering1
  /*stroke(198,188,164);
  noFill();
  smooth();
  strokeWeight(8);
  for (int i = 10; i < 300; i+=70) {
    arc(134,i,38,38,PI+HALF_PI,TWO_PI+HALF_PI);
  }
  //treering1 ends here
  //treering2
  fill(108,96,69);
  smooth();
  noStroke();
  for (int i = 10; i < 300; i+=70) {
    arc(131,i,13,13,PI+HALF_PI,TWO_PI+HALF_PI);
  }
  */
  //treering2ends here
  noStroke();
 
  fill(114,118,137);
  ellipse(250,140,80,110);//body
  fill(255);
  triangle(238,190,278,180,200,280);//tail 1
  fill(114,118,137);
  triangle(238,189,279,179,240,245);//tail 2
  triangle(188,160,230,145,235,185);//thigh
   
  fill(255,129,131);
  triangle(245,135,291,135,270,208);//wing3
  fill(255);
  triangle(250,135,291,135,280,210);//wing1
  fill(114,118,137);
  ellipse(268,136,46,85);//wing2
}

void drawOlive(int bWidth, int bHeight, float eHWidth, int hWidth, int hHeight, int u, int r) {
  fill(0);
  noStroke();
  
  
 
beginShape();//legleft
vertex(230+u,200+r);
vertex(195+u,200+r);
vertex(184+u,300+r);
vertex(188+u,320+r);
vertex(192+u,320+r);
vertex(190+u,290+r);
endShape();
 
 
beginShape(); //left foot
vertex(188+u,320+r);
vertex(180+u,323+r);
vertex(192+u,323+r);
vertex(192+u,320+r);
endShape();
 
 
beginShape();//legright
vertex(170+u,200+r);
vertex(205+u,170+r);
vertex(216+u,300+r);
vertex(212+u,320+r);
vertex(210+u,320+r);
vertex(210+u,290+r);
endShape();
 
 
beginShape(); //Right foot
vertex(212+u,320+r);
vertex(220+u,323+r);
vertex(210+u,323+r);
vertex(210+u,320+r);
endShape();
 
 
fill(165,159,38);//shirt color
 
  ellipse(200+u, 220+r, bWidth, bHeight);//body
 
fill(255);
ellipse(200+u, 200+r, hHeight, hWidth);//head
smooth();
stroke(1);
strokeWeight(1.5);
 
 ellipse(190+u, 200+r, eHWidth, eHWidth);//Left eye
 ellipse(210+u, 200+r, eHWidth, eHWidth);//right eye
 
fill(0);
strokeWeight(1);
//ellipse(190,200,3,3); //Eye ball left
//ellipse(210,200,3,3);//Eye ball right
if(mouseX <= 195+u && mouseX > 185+u){
  ellipse(mouseX,200+r,3,3);//Moving Eye ball right
  ellipse(mouseX+20,200+r,3,3);
}else if(mouseX > 195+u){
   ellipse(195+u,200+r,3,3);
   ellipse(215+u, 200+r, 3, 3);
}else if(mouseX < 185+u){
  ellipse(186+u,200+r,3,3);
  ellipse(206+u, 200+r, 3, 3);
}
 
 
beginShape();
vertex(230+u,210+r);//right arm
vertex(230+u,240+r);
vertex(210+u,250+r);
vertex(225+u,235+r);
endShape();
beginShape();
vertex(170+u,210+r);//left arm
vertex(170+u,240+r);
vertex(190+u,250+r);
vertex(175+u,235+r);

endShape();
fill(160,17,10);
ellipse(200+u,182+r,40,16);
strokeWeight(1.5);
line(200+u,167+r,200+u,180+r);
 
  if (keyPressed == true) {
    bWidth += 5;
    bHeight += 5;
    
    hWidth =60;
    hHeight =60;
   
  if (eHWidth<18) {
     
    eHWidth += .5 ;
  }
  }
}


