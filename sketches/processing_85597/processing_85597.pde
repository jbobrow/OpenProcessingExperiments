
//Name: Andrew Foresman
//Class: ITGM_315
//Date: Winter 2013
//Title: Assignment 1



void setup(){
 
 size(800,800); 
 background(255);
  
}

void draw(){
  
  background(255);

  //start drawing the tail
  
  if((mouseX < 560) && (mouseX >450) && (mouseY > 150) && (mouseY <475)){ 
    
  //draws the tail
  
  strokeWeight(3);
  fill(115,69,69);
  rotate(.2);
  ellipse(513,209,200,400);
  rotate(-.2);
  
  //draws the tail inner outline
  
  noStroke();
  
  strokeWeight(0);
  ellipseMode(CENTER);
  fill(163,119,119);
  rotate(radians(8));
  ellipse(505,230,180,380);
  rotate(radians(-8));
  
  fill(115,69,69);
  rotate(radians(8));
  ellipse(505,230,175,375);
  rotate(radians(-8));
  
  //draws the tail cross hatching
  
  stroke(163,119,119);
  line(445,144,527,161);
  line(500,130,480,187);
  line(446,160,527,180);
  line(529,213,509,335);
  line(543,281,482,260);
  line(543,261,482,240);


}else{
  
  //draws the tail

  stroke(0);
  strokeWeight(3);
  fill(115,69,69);
  rotate(.3);
  ellipse(550,160,200,400);
  rotate(-.3);
  
  //draws the tail inner outline
  
  noStroke();
  
  strokeWeight(0);
  ellipseMode(CENTER);
  fill(163,119,119);
  rotate(.3);
  ellipse(550,160,180,380);
  rotate(-.3);
  
  fill(115,69,69);
  rotate(.3);
  ellipse(550,160,175,375);
  rotate(-.3);
  
  //draws the tail cross hatching
  
  stroke(163,119,119);
  line(500,160,550,180);
  line(535,150,505,210);
  line(520,190,480,180);
  line(549,213,509,335);
  line(543,281,482,260);
  line(543,261,482,240);



}



  //draws the feet outline
  
  fill(0);
  
  triangle(380, 440, 390, 510, 250, 530);
  
  triangle(420, 440, 410, 510, 550, 530);
  
  //draws the feet
  
  fill(156,102,31);
  
  triangle(380, 450, 390, 510, 250, 530);
  
  triangle(420, 450, 410, 510, 550, 530);
  
  //draws the toe lines
  
  stroke(0);
  strokeWeight(2);
  line(525,526,513,517);
  
  line(266,528,279,521);
  
  
  //draws the body outline
  
  stroke(0);
  ellipseMode(CENTER);
  fill(0);
  ellipse(400,403,200,230);

  //draws the body
  
  stroke(0);
  ellipseMode(CENTER);
  fill(156,102,31);
  ellipse(400,400,200,230);
  
  
  
  
  //draws the stomach
  
  noStroke();
  fill(222,200,169);
  ellipse(400,430,150,170);
  stroke(0);
  
  //draws the left arm
  
  
  
  //draws the cheeks
  
  fill(236,216,174);
  ellipse(400,300,150,85);
  
  //draws the ears---------------------//
  
  //draws the right ear
  
  strokeWeight(2);
  fill(156,102,31);
  ellipse(440,180,40,50);
  
  //right ear 

  strokeWeight(1);
  fill(255,182,193);
  ellipse(440,180,20,30);
  
  //draws the left ear
  
  strokeWeight(2);
  fill(156,102,31);
  ellipse(370,180,40,50);
  
  //left ear pink
  
  strokeWeight(1);
  fill(255,182,193);
  ellipse(370,180,20,30);
  
  //------------------------------------//
  
  
  //draws the skull
  fill(156,102,31);
  ellipse(403,200,70,50);
  
  //draws the face shadow
  
  fill(00);
  ellipse(400,262,40,30);
  
  //draws the eyes------------------------//

  //black circle around left eye
  strokeWeight(2);
  fill(0);
  rotate(radians(8));
  ellipse(395,180,70,100);
  rotate(radians(-8));
  
  
  //left eye white
  noStroke();
  fill(254);
  rotate(radians(8));
  ellipse(400,180,70,100);
  rotate(radians(-8));
  
  
  //black circle around right eye
  strokeWeight(2);
  fill(0);
  rotate(radians(-8));
  ellipse(403,295,72,102);
  rotate(radians(8));
  
  //right eye white
  fill(255);
  rotate(radians(-8));
  ellipse(400,295,70,100);
  rotate(radians(8));

  //left eye pupil
  
  float x_left_pupil = map (mouseX, 0, width, 365, 395);
  float y_left_pupil = map (mouseY, 0, height, 225, 255);
  
  fill(0);
  ellipse(x_left_pupil,y_left_pupil,13,13);
  
  //left eye spec
  
  fill(255);
  float x_spec_left_eye = map (mouseX, 0, width, 365, 395);
  float y_spec_left_eye = map (mouseY, 0, height, 225, 255);
  ellipse(x_spec_left_eye,y_spec_left_eye,3,3);
  
  //right eye pupil
  
  float x_right_pupil = map (mouseX, 0, width, 405, 435);
  float y_right_pupil = map (mouseY, 0, height, 225, 255);
  
  fill(0);
  ellipse(x_right_pupil,y_right_pupil,13,13);
  
  
  
  
  //right eye spec
  
  fill(255);
  float x_spec_right_eye = map (mouseX, 0, width, 408, 438);
  float y_spec_right_eye = map (mouseY, 0, height, 222, 262);
  ellipse(x_spec_right_eye,y_spec_left_eye,3,3);
  
  
  
  //draws the teeth--------------\\


  //draws the left tooth shadow
  
  fill(0);
  noStroke();
  rectMode(CENTER);
  
  rotate(radians(8));
  rect(425,277,44,50);
  rotate(radians(-8));
  
  
  //draws the left tooth
  
  fill(255);
  noStroke();
  rectMode(CENTER);
  
  rotate(radians(8));
  rect(425,275,40,50);
  rotate(radians(-8));
  
  
  //draws the right tooth shadow
  
  fill(0);
  noStroke();
  rectMode(CENTER);
  
  rotate(radians(-7));
  rect(373,387,33,52);
  rotate(radians(7));
  
  //draws the right tooth
  
  fill(255);
  noStroke();
  rectMode(CENTER);

  rotate(radians(-8));
  rect(366,390,30,50);
  rotate(radians(8));
  
  
  
  //draws the mouth
  stroke(0);
  strokeWeight(1);
  fill(236,216,174);
  ellipse(400,295,75,65);
  
  //draws the nose
  
  fill(30);
  ellipse(400,272,40,30);
  
  //draws the nose-highlight
  
  fill(250);
  ellipse(400,264,15,8);
  
  //draws the left fingers
  
  fill(22,18,18);
  rotate(radians(-20));
  rect(100, 460, 11, 4);
  rotate(radians(20));
  
  rotate(radians(-20));
  rect(100, 470, 11, 4);
  rotate(radians(20));
  
  
  rotate(radians(-20));
  rect(100, 450, 11, 4);
  rotate(radians(20));
  
  //draws the left arm outline
  
  noStroke();
  fill(0);
  rotate(radians(-21));
  rect(133, 461, 81, 40);
  rotate(radians(21));
  
  //draws the left arm
  
  noStroke();
  fill(156,102,31);
  rotate(radians(-20));
  rect(140, 459, 85, 35);
  rotate(radians(20));
  
  
  
  
  
  
  //draws the right fingers
  
  noStroke();
  fill(22,18,18);
  rect(532, 385,11,4);
  
  rect(527, 393,11,4);
  
  rect(523, 400,11,4);
  
  //draws the right arm outline
  
  noStroke();
  fill(0);
  rotate(radians(30));
  rect(620, 75, 70, 40);
  rotate(radians(-30));
  
  //draws the right arm
  
  noStroke();
  fill(156,102,31);
  rotate(radians(30));
  rect(612, 75, 85, 35);
  rotate(radians(-30));
  
  
  
  //draws the whiskers 
  
  
  //draws the left side whiskers 
  
  stroke(0);
  line(373,288,300,275);
  
  line(330,300,369,301);
  line(375,295,276,290);
  
  //draws the right side whiskers
  
  line(425,289,486,278);
  line(426,294,490,288);
  line(428,305,465,313);

}



