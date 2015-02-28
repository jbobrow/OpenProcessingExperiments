
class Robot {

  color c;
  float xpos;
  float ypos;
  float w;
  float h;
  float xspeed;
  float yspeed;

  Robot(float tempXpos, float tempYpos, float tempW, float tempH, color tempC) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    w = tempW;
    h = tempH;
    xspeed = 1;
    yspeed = 1;
  }

  void display() {

    //robot's body
    stroke(0);
    fill(c);
    rect(xpos,ypos,50,100);

    //robot's ears
    stroke(0);
    fill(c);
    rect(xpos-50,ypos-50,10,30);
    rect(xpos+50,ypos-50,10,30);

    //zoog's head
    stroke(0);
    fill(c);
    rect(xpos,ypos-50,90,60);

    //robot's eyes
    fill(xpos,0,ypos);
    ellipse(xpos-19,ypos-55,10,10);
    ellipse(xpos+19,ypos-55,10,10);

    //robot's mouth
    fill(xpos,ypos,0);
    rect(xpos,ypos-32,60,7);

    //robot's hands
    stroke(0);
    line(xpos+30,ypos-10,xpos+55,ypos+30);
    line(xpos-30,ypos-10,xpos-55,ypos+30);

    //robot's legs
    stroke(0);
    line(xpos-20,ypos+50,xpos-50,ypos+100);
    line(xpos+20,ypos+50,xpos+50,ypos+100);
  }


void jiggle() {
// Change the location
xpos = xpos + random(-1,1);
ypos = ypos + random(-1,1);
}


}


