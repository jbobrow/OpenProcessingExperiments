
// HW #2
// Written by Kevin Kuntz
// Andrew ID: kkuntz
// © Kevin Kuntz  January 2014 Pittsburgh, Pa 15213  All Rights reserved


float x, y;
float hwd = 200;
float hht = 200;
float xDist, yDist;
float easingCoef;
  
  
//Background
void setup()
{
  size(400,400);
  //background(80,210,210);
  easingCoef = .1;
}
//Charicature

void draw()
{
  x = x + xDist * easingCoef;
  y = y + yDist * easingCoef;
  //x=mouseX;
  //y=mouseY;
  float hwd = 200;
  float hht = 200;
  xDist = mouseX - x;
  yDist = mouseY - y;
  smooth();
  noCursor();
  background(80,210,210);
  fill(80,210,210,10);
    //hair
  noStroke();
  fill(115,130,130);
  rect(x + -.075 * hwd, y + .3 * hht, 1.125 * hwd, .3*hht, 10);
    //head
  noStroke();
  fill(225,200,145);
  rect(x,y,hwd,hht,25);
    //eyes
  noStroke();
  fill(0);
  ellipse(x + .25 * hwd, y + .5 * hht, 10,10);
  ellipse(x + .75 * hwd, y + .5 * hht, 10,10);
    //eyebrows and moustach
  noStroke();
  fill(115,130,130);
  rect(x + .0625 * hwd, y + .3 * hht, .375 * hwd, .125 * hht, 10);
  rect(x + .5625 * hwd, y + .3 * hht, .375 * hwd, .125 * hht, 10);
  rect(x + .125 * hwd, y + .7 * hht, .75 * hwd, .375 * hht, 10,10,0,0);
    //ears
  noStroke();
  fill(225,200,145);
  beginShape();
    vertex(x, y + .45 * hht);
    bezierVertex(x + -.1 * hwd, y + .46 * hht, x + -.1 * hwd, y + .56 * hht, x , y + .57 * hht);
  endShape();
  beginShape();
    vertex(x + hwd, y + .45 * hht);
    bezierVertex(x + 1.1 * hwd, y + .46 * hht, x + 1.1 * hwd, y + .56 * hht, x + hwd, y + .57 * hht);
  endShape();
    //nose
  stroke(0);
  beginShape();
    vertex(x + .62 * hwd, y + .6 * hht);
    bezierVertex(x + .68 * hwd, y + .8 * hht, x + .32 * hwd, y + .8 * hht,  x + .38 * hwd, y + .6 * hht);
  endShape();
  
  //INITIALS
    //Chosen Initial from KDK is the letter D used to make the glasses
  float inx = x + .25 * hwd;
  float iny = y + .42 * hht;
  float inwd = 80;
  float inht = 90;
  
  //frames
  fill(0);
  noStroke();
  rect(x, y + .41 * hht,hwd,5);
  
  //left D
  noFill();
  noStroke();
  ellipse(inx,iny,inwd,inwd);
  strokeWeight(5);
  stroke(225,10,15);
  fill(255,220);
  beginShape();
    vertex(inx - .47 * inwd, iny);
    bezierVertex(inx - .3 * inwd, iny + .6 * inht, inx + .3 * inwd, iny + .6 * inht, inx + .47 * inwd, iny);
  endShape(CLOSE);
  
  //right D
  translate(.5 * hwd, 0);
  beginShape();
    vertex(inx - .47 * inwd, iny);
    bezierVertex(inx - .3 * inwd, iny + .6 * inht, inx + .3 * inwd, iny + .6 * inht, inx + .47 * inwd, iny);
  endShape(CLOSE);
  noFill();
}












