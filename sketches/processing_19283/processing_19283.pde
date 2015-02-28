
float centerX=200, centerY=200;

void setup()
{
  size(400,400);
  smooth();
 }
  
 
 /*Set ref points to the mouse coordinates, 
 background to pale yellow and stroke to
*/ 
void draw () {
  centerX=mouseX;
  centerY=mouseY;
  background(247, 221, 168);
  stroke(0,150);
 
 
   
  
 //body, 
 noStroke();
 fill(48, 28, 32);
 ellipse(centerX,centerY,60,120);
 
 //segment: top
 fill(93,63,62);
  beginShape();
  vertex(centerX-25,centerY-30);
  bezierVertex(centerX-5,centerY,centerX+5,centerY,centerX+25,centerY-30);
  endShape();
  
  fill(48,28,32);
  beginShape();
  vertex(centerX-25,centerY-30);
  bezierVertex(centerX-5,centerY-15,centerX+5,centerY-15,centerX+25,centerY-30);
  endShape();
  
  //segment: middle
   fill(93,63,62);
  beginShape();
  vertex(centerX-30,centerY-4);
  bezierVertex(centerX-5,centerY+29,centerX+5,centerY+29,centerX+30,centerY-4);
  endShape();
  
  fill(48,28,32);
  beginShape();
  vertex(centerX-30,centerY-4);
  bezierVertex(centerX-5,centerY+14,centerX+5,centerY+14,centerX+30,centerY-4);
  endShape();
  
  //segment: bottom
  fill(93,63,62);
  beginShape();
  vertex(centerX-27,centerY+25);
  bezierVertex(centerX-2,centerY+54,centerX+2,centerY+54,centerX+27,centerY+25);
  endShape();
  
  fill(48,28,32);
  beginShape();
  vertex(centerX-27,centerY+25);
  bezierVertex(centerX-5,centerY+38,centerX+5,centerY+38,centerX+27,centerY+25);
  endShape();
  
  
 
//head
   fill(93, 63, 62);
  ellipse(centerX,centerY-60,100,40);
 
//eyeballs (right then left)
  stroke(0);
  fill(204, 209, 168);
  ellipse(centerX+20,centerY-78,20,30);
  ellipse(centerX-20,centerY-78,20,30);
 
//iris (right then left)
  fill(130, 173, 154);
  ellipse(centerX+17,centerY-84,12,15);
  ellipse(centerX-23, centerY-84,12,15);  
 
//pupil
  fill(0);
  ellipse(centerX+17,centerY-84,4,4);
  ellipse(centerX-23,centerY-84,4,4);
 
//nose
  noStroke();
  fill(104, 109, 100);
  ellipse(centerX,centerY-60,20,10);
 
//smile
  fill(255);
  beginShape();
  vertex(centerX-10,centerY-50);
  bezierVertex(centerX-5,centerY-45,centerX+5,centerY-45,centerX+10,centerY-50);
  endShape();
    
//upper legs (l then r)
  stroke(0);
  strokeWeight(4);
  line(centerX-20, centerY+45,centerX-40, centerY+65);
  line(centerX+20, centerY+45, centerX+40, centerY+65);
 
//upper arms (l then r)
  line(centerX-28, centerY-20, centerX-48, centerY-10);
  line(centerX+28, centerY-20, centerX+48, centerY-10);
 
 
//lower legs (l then r)
  strokeWeight(2);
  line(centerX-40, centerY+65, centerX-50, centerY+105);
  line(centerX+40, centerY+65, centerX+50, centerY+105);
 
 
//forearms (l then r)
  line(centerX-48, centerY-10, centerX-43, centerY+10);
  line(centerX+48, centerY-10, centerX+43, centerY+10);
   
  //line(248,190,243,210);
 
//feet (l then r)
  ellipseMode(CORNER);
  strokeWeight(1);
  fill(212, 186, 133);
  ellipse(centerX-78, centerY+103, 30, 10);
  ellipse(centerX+48, centerY+103, 30, 10);
 
 
//hands (l then r)
  ellipseMode(CENTER);
  ellipse(centerX-48, centerY+15, 18, 10);
  ellipse(centerX+48, centerY+15, 18, 10);
 
  /*GRID
  strokeWeight(1);
   for (int i=5; i< width; i=i+5)
     {
      line (i,0, i, height);
      line(0, i, width, i);
     }
 */
 
 
 }


