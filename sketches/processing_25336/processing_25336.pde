
Robot myrobot, myrobot2;

void setup() {
  size(200,200);
  smooth();
  myrobot = new Robot(120,120,color(255,35,70),color(0),color (200,255,0), color(252,28,3),70,20,30,20,50,1,1);
  myrobot2 = new Robot(30,70,color(255,35,70),color(0),color (200,255,0), color(252,28,3),70,20,30,20,50,1,1);
}

void draw() {
  background(62,203,190);
  myrobot.display();
    myrobot2.display();
}

class Robot{
  color headC,eyesC,bodyC,legsC;
  float xpos;
  float ypos;
  float bodyheight, bodywidth;
  float eyeslength, eyeswidth;
  float headsize;
  float xspeed;
  float yspeed;

  Robot(float X, float Y, color headcolor,color eyescolor,color bodycolor, color legscolor, float BodyHeightTemp,float BodyWidthTemp,float EyesLengthTemp, float EyesWidthTemp,float HeadSizeTemp,float xspeedTemp, float yspeedTemp) {
    xpos = X;
    ypos = Y;
    headC = headcolor;
    eyesC= eyescolor;
    bodyC = bodycolor;
    legsC= legscolor;
    bodyheight= BodyHeightTemp;
    bodywidth=BodyWidthTemp;
    eyeslength=EyesLengthTemp;
    eyeswidth= EyesWidthTemp;
    headsize=HeadSizeTemp;
    xspeed = xspeedTemp;
    yspeed = yspeedTemp;
  }

  void display() {
    for (int c= 0; c<=width; c+=30) {
      stroke(62,126,203);
      line(0,c,width,c);
    }

    for (int d= 0; d<=height; d+=30) {
      stroke(62,126,203);
      line(d,0,d,height);
    } 

    //legs
    stroke(255);
    line(xpos-bodywidth/2-15,ypos+bodyheight/2+35,xpos-bodywidth/2,ypos+bodyheight/2+20);
    line(xpos+bodywidth/2+15, ypos+bodyheight/2+35,xpos+bodywidth/2,ypos+bodyheight/2+20);

    //body
    fill(bodyC);
    rectMode(CENTER);
    rect(xpos,ypos+20,bodywidth,bodyheight);

    //head
    fill(headC);
    stroke(0);
    ellipse(xpos,ypos-bodyheight/2+5,headsize,headsize);

    //eyes
    fill(eyesC);
    ellipse(xpos-25+bodywidth/2,ypos+5-bodyheight/2,eyeswidth,eyeslength);
    fill(eyesC);
    ellipse(xpos+25-bodywidth/2,ypos+5-bodyheight/2,eyeswidth,eyeslength);
  }
}


