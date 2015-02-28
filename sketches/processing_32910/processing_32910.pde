
float x=1;
float y=2;
float xpos=200;
float ypos=100;
boolean a=true;
//for drawing lines
float [] initx= new float [5];
float [] inity= new float [5];
float [] termx= new float [5];
float [] termy= new float [5];
void setup() {
  size(400, 400);
  background(0, 0, 0);
  //assigning values to line coordinates
  for (int i=0; i<initx.length; i++) {
    initx[i]=i*80;
    inity[i]=i*80+50;
    termx[i]=i*80+100;
  }
}

void draw() {
  frameRate(30);
  background(0, 0, 0);
  for (int i=0; i<initx.length;i++) {
    line(initx[i], inity[i], termx[i], inity[i]);
    smooth();
    stroke(200, 0, 0);

    ellipse(xpos, ypos, 10, 10);
    ypos=ypos+y;
    xpos=xpos+x;
    if (ypos>=inity[i]-10 && ypos<=inity[i]+10 && xpos<=termx[i]-10 && xpos>=initx[i]+10) {
      a=false;
    } 
    else {
      a=true;
    }
    if (ypos<=10 || ypos>=height-10 || a==false) {
      y=y*-1;
    }

    if (xpos<=10 || xpos>=width-10 || xpos==termx[i] || xpos==initx[i]) {
      x=x*-1;
    }
    if (a==true) {
      y=y;
    }
  }
}



