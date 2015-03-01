
/*
Day2_1_byHangDoThiDuc
 */

void setup() {
  size(800, 600);
  /*blue words predefined functions ready to use
   right-click "Find in Reference" to see more info, also related functions*/
  frameRate(30);
}

void draw() {
  background(255); //so everytime function runs, we start fresh
  
  //my character body
  fill(0, 140, 110);
  noStroke();
  triangle(mouseX-50, mouseY+100, mouseX, mouseY+100, mouseX-5, mouseY+300); //dark left leg
  triangle(mouseX-5, mouseY+100, mouseX+50, mouseY+100, mouseX+5, mouseY+300); //dark right leg
  triangle(mouseX, mouseY, mouseX+50, mouseY+100, mouseX-50, mouseY+100); //upper body
  fill(0, 149, 125);
  triangle(mouseX-50, mouseY+100, mouseX-5, mouseY+300, mouseX-50, mouseY+280); //light left leg
  triangle(mouseX+5, mouseY+300, mouseX+50, mouseY+100, mouseX+50, mouseY+280); //light right leg
  triangle(mouseX-75, mouseY-50, mouseX, mouseY-30, mouseX-40, mouseY+30); //left ear
  triangle(mouseX+80, mouseY-30, mouseX, mouseY-30, mouseX+40, mouseY+30); //right ear
  fill(120, 190, 180);
  ellipse(mouseX, mouseY, 120, 120); //head originally 400, 150- everything relative to head !!!
  triangle(mouseX-25, mouseY+100 , mouseX-15, mouseY+110, mouseX-15, mouseY+150); //left hand
  triangle(mouseX+25, mouseY+100, mouseX+15, mouseY+110, mouseX+15, mouseY+150); //right hand

  //glasses
  stroke(0, 0, 0);
  strokeWeight(6);
  noFill();
  ellipse(mouseX-35, mouseY-5, 55, 55); //left
  ellipse(mouseX+35, mouseY-5, 55, 55); //right
  rectMode(CENTER);
  rect(mouseX, mouseY-5, 5, 5);
  point(mouseX-35, mouseY-5); //left
  point(mouseX+35, mouseY-5); //right

  //mouth
  fill(0, 140, 110);
  noStroke();
  triangle(mouseX-10, mouseY+35, mouseX+10, mouseY+35, mouseX, mouseY+45);

  //shoes
  triangle(mouseX-80, mouseY+310, mouseX-5, mouseY+300, mouseX-50, mouseY+280); //left
  triangle(mouseX+5, mouseY+300, mouseX+80, mouseY+310, mouseX+50, mouseY+280); //right
}



