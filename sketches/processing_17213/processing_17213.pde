
int l=50;
int x, y;
float ox, oy;
float lastX, lastY;



void setup () {
  size (900,450);
  background (255);
  frameRate(15);
  lastX=0;
  lastY=0;
}

void draw() {

  float dx,dy;
  float dis;
  float st;
  int check = 0;
  int sc=10;
  smooth();




  if (mousePressed==true) {

    dx=mouseX-lastX;
    dy=mouseY-lastY;
    dis =sqrt(dx*dx+dy*dy);
    ox=40*sc/dis*random(1,1.3);
    oy=40*sc/dis*random(1,1.3);
    noStroke();

    color col= color(0,0,0,random(25,150));
    println(dis);


    if (lastX == 0) {
      ellipse(mouseX, mouseY, ox, oy);
      // noStroke();
      line(lastX, lastY, mouseX, mouseY);
      stroke(random(190,240));
      fill(col);

      check = 1;
    }
    else {
      if ((dis>2*l)&&(dis<4*l)) {
        //noStroke();
        ellipse(mouseX, mouseY, ox, oy);
        stroke(random(190,240));
        line(lastX, lastY, mouseX, mouseY);
        fill(col);

        check = 1;
      }
      else if ((dis>l/2)&&(dis<2*l)) {

        //noStroke();
        ellipse(mouseX-lastX/random(5,10), mouseY, ox, oy);
        ellipse(mouseX-lastX/random(5,10), mouseY-lastY/random(5,10), ox, oy);
        stroke(random(190,240));
        line(lastX, lastY, mouseX-lastX/random(5,10), mouseY-lastY/random(5,10));
        fill(col);

        check = 1;
      }
    }
    if(check ==1) {     
      lastX = mouseX;
      lastY= mouseY;
    }
    //saveFrame("frame free 00.jpg");
  }
}
void keyPressed() {
  if ((key==' ')||(key=='c')) {
    rect(0,0,width,height);
    fill(255,255,255,random(3,8));
  }
}



                                
