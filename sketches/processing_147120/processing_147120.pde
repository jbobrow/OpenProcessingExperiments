
 //This code was made by Mariam Osman
//Please roll over to the drawing
//Declaration 
color b1, b2;
float x=230;
float y=140;
float eyeSize=30;
float a=0;
float h=0;

void setup()
{
  size(500,500);
   b1 = color(90); // For the gradient background; The first color from left going to right
   b2 = color(60,80,120); // The second color
   
}
 
void draw()
{
   
  setGradient(0, 0, width, height, b1, b2); 
  //Buildings
  fill(255, 243, 216);
  stroke(0);
  strokeWeight(3);
  rect(0, 40, 200, 460);
  fill(255);
  rect(250, 140, 150, 260);
  fill((mouseX/2)+90);
  rect(250, 140, 150, 260);
  fill(227, 217, 195);
  rect(350, 240, 200, 260);

  
  //Windows  
  fill(mouseX/2);
  stroke(0);
  strokeWeight(3);
  rect(30, 70, 50, 50);
  rect(120, 150, 50, 50);
  rect(30, 230, 50, 50);
  rect(120, 310, 50, 50);
  fill(mouseY/2);
  rect(120, 70, 50, 50);
  rect(30, 150, 50, 50);
  rect(120, 230, 50, 50); 
  rect(30, 310, 50, 50);
  
  //begin shirt
  stroke(0);
  strokeWeight(3);
  fill(70,mouseX+90,mouseY+90);
  beginShape();
  vertex(0, 500);
  vertex(30, 450);
  vertex(60, 412);
  vertex(100, 380);
  vertex(200, 350);
  vertex(283, 369);
  vertex(310, 375);
  vertex(380, 395);
  vertex(420, 410);
  vertex(470, 460);
  vertex(500, 500);
  endShape();
  //end shirt
    
  //begin bottom of neck
  fill(237,175,108);
  beginShape();
  vertex(100, 380);
  vertex(200, 350);
  vertex(283, 369);
  vertex(310, 375);
  vertex(380, 395);
  vertex(370, 440);
  vertex(250, 450);
  vertex(120, 440);
  vertex(100, 380);
  endShape();
  //end bottom of neck
    
  //begin top of neck
  beginShape();
  vertex(170,370);
  vertex(182,325);
  vertex(186,313);
  vertex(202,270);
  vertex(303,280);
  vertex(304,348);
  vertex(310,387);
  endShape();
  //end top of neck
    
  //begin face
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(186,308);
  vertex(290,311);
  vertex(320,260);
  vertex(323,240);
  vertex(325,170);
  vertex(310,120);
  vertex(280,90);
  vertex(250,85);
  vertex(190,100);
  vertex(170,125);
  vertex(150,170);
  vertex(150,200);
  vertex(157,245);
  vertex(160,280);
  vertex(162,295);
  vertex(186,308);
  endShape();
  //end face
    
  //begin hair
  fill(10);
  noStroke();
  beginShape();
  vertex(149, 180);
  vertex(147, 157);
  vertex(155, 130);
  vertex(170, 100);
  vertex(190, 85);
  vertex(210, 75);
  vertex(220, 73);
  vertex(250, 75);
  vertex(300, 85);
  vertex(320, 100);
  vertex(335, 130);
  vertex(330, 220);
  vertex(328, 220);
  vertex(318, 220);
  vertex(316, 200);
  vertex(314, 150);
  vertex(300, 140);
  vertex(270, 130);
  vertex(220, 110);
  vertex(200, 115);
  vertex(170, 140);
  vertex(150, 180);
  endShape();
  //end hair
  
  //begin ear
  fill(237,175,108);
  beginShape();
  vertex(310,240);
  vertex(325,210);
  vertex(325,190);
  vertex(310,180);
  endShape();
  //end ear 

  stroke(0);
  strokeWeight(7);
    
  //begin eyebrows
  fill(0);
  rect(170,170, 40, 3);
  rect(250,170, 40, 3);

    
  //begin nose line
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(242,249);
  vertex(231,249);
  vertex(222,247);
  vertex(222,244);
  vertex(225,230);
  vertex(227,210);
  
  endShape();
  //end nose line
    
  
  //begin left eye
 
  pushMatrix();
  translate(x-40, y+60-h);
  fill(255);
  //draw white eyeball
  ellipse(0, 0, eyeSize+5, eyeSize);
  a=atan2((mouseX-(x-40)), (mouseY-(y+60)));
  rotate(-a);

  //begin the iris
  fill(0);
  ellipse(eyeSize/4, 0, eyeSize/2, eyeSize/2);
  popMatrix();
 
 
  //begin right eye
  pushMatrix();
  translate(x+40, y+60-h);
  fill(255);
  ellipse(0, 0, eyeSize+5, eyeSize);
  a=atan2((mouseX-(x+40)), (mouseY-(y+60-h)));
  rotate(-a);
  
  //begin the iris
  fill(0);
  ellipse(eyeSize/4, 0, eyeSize/2, eyeSize/2);
  popMatrix();

    
  //begin lip
  fill(190,104,44);
  stroke(0);
  strokeWeight(3);
  beginShape();
  curveVertex(205,265);
  curveVertex(210,271);
  curveVertex(226,279);
  curveVertex(252,273);
  curveVertex(253,267);
  endShape();
  line(210,270,253,272);
  //end lip



}

  //The gradient function
void setGradient(int x, int y, float w, float h, color c1, color c2 ) 
{
// Left to right gradient
    for (int i = x; i <= x+w; i++) 
    {
      float inter = map(i, x, x+w, 0, 1); 
      color c = lerpColor(c1, c2, inter); 
      stroke(c); 
      line(i, y, i, y+h); 
  
    }
}

