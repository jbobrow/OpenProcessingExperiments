
void setup()
{
  size(640,480);
  smooth();
}

//float clickCounter

void draw()
{
  background(66,105,156);

  //right eye shape
  pushMatrix();
  
  float angle = map(mouseY, 0, width, 0, radians(45));
  translate(487,282);
  rotate(angle);
  fill(227,221,206);
  noStroke();
  
  beginShape();
  vertex(-115,-221);
  vertex(-127,-217);
  vertex(-115,-221);
  vertex(75,-169);
  bezierVertex(182,-127, 142,56, 61,86);
  arc(60,-132, 416,436, radians(90),radians(180));
  vertex(-148,-132);
  vertex(-127,-217);
  endShape();
  
  //detail
  fill(255);
  ellipse(-113,-186, 25,25);
  fill(35,31,32);
  ellipse(-113,-186, 15,15);
  
  fill(255);
  ellipse(95,-118, 18,18);
  fill(35,31,32);
  ellipse(95,-118, 12,12);
  
  fill(255);
  ellipse(43,18, 15,15);
  fill(35,31,32);
  ellipse(43,18, 10,10);
   
    //right eye center
    stroke(0);
    strokeWeight(7);
    fill(58,100,166);
    ellipse(-37,-90, 160,160);
  
  //eye lenses
  strokeWeight(1);  
  float mx1 = constrain(mouseX, 120,100);
  float my1 = constrain(mouseY, 120,100);
  
  float ellipseX1 = dist(200,200, mx1,my1);
  float ellipseY1 = dist(200,200, mx1,my1);
  
  float ellipseX2 = dist(150,200, mx1,my1);
  float ellipseY2 = dist(150,200, mx1,my1);
  
  float ellipseX3 = dist(120,170, mx1,my1);
  float ellipseY3 = dist(120,170, mx1,my1);
  
  noStroke();
  fill(80,131,189); 
  ellipse(-37,-90, ellipseX1,ellipseY1);
  fill(58,100,166);
  ellipse(-37,-90, ellipseX2,ellipseY2);
  fill(43,71,140);
  ellipse(-37,-90, ellipseX3,ellipseY3);
   
  popMatrix(); 
  
  pushMatrix();
  stroke(0);
    strokeWeight(3);
    noFill();
    if (mousePressed)
    {
      if (mouseButton == LEFT)//WIPER
      {
        translate(451,269);
        float angleWiper = map(mouseX,0, width,0, radians(45));
        rotate(angleWiper);
        line(0,0, 0,-120);
      }
      else//SHUT
      {
        translate(487,282);
        rotate(angle);
        fill(227,221,206);
        arc(-37,-93, 163,163, radians(190),radians(370)); 
      }
    }
  popMatrix();
  
  //left eye shape
  pushMatrix();
  noStroke();
  fill(227,221,206);
  translate(158,281);
  rotate(-angle);
 
  beginShape();
  vertex(116,-221);
  vertex(128,-217);
  vertex(116,-221);
  vertex(-75,-169);
  bezierVertex(-182,-127, -147,56, -66,86);
  arc(-66,-132, 416,436, radians(0),radians(90));
  vertex(142,-132);
  vertex(128,-217);
  endShape();
  
  fill(255);
  ellipse(112,-186, 25,25);
  fill(35,31,32);
  ellipse(112,-186, 15,15);
  
  fill(255);
  ellipse(-50,18, 15,15);
  fill(35,31,32);
  ellipse(-50,18, 10,10);
  
  fill(255);
  ellipse(-100,-118, 18,18);
  fill(35,31,32);
  ellipse(-100,-118, 12,12);
    
    //left eye center
    stroke(0);
    strokeWeight(7);
    fill(58,100,166); 
    ellipse(30,-90, 160,160);
   
    
  //eye lenses
  noStroke();
  fill(80,131,189); 
  ellipse(30,-90, ellipseX1,ellipseY1);
  fill(58,100,166);
  ellipse(30,-90, ellipseX2,ellipseY2); 
  fill(43,71,140);
  ellipse(30,-90, ellipseX3,ellipseY3); 
  popMatrix();
  
    pushMatrix();
  stroke(0);
    strokeWeight(3);
    noFill();
    if (mousePressed)
    {
      if (mouseButton == LEFT)//WIPER
      {
        translate(183,269);
        float angleWiper = map(mouseX,0, width,0, radians(45));
        rotate(angleWiper);
        line(0,0, 0,-120);
      }
      else//SHUT
      {
        translate(158,281);
        rotate(-angle);
        fill(227,221,206);
        arc(28,-93, 163,163, radians(170),radians(350));
      }
    }
  popMatrix();

}

