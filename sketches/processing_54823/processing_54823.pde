
PShape body, feet, handz, belly;
PImage headd;
int spacer;

robot r1, r2, r3;

void setup() {
  size(800, 400);
  smooth();
  headd=loadImage("head.png");
  body=loadShape("body.svg");
  feet=loadShape("feet.svg");
  handz=loadShape("hand.svg");
  belly=loadShape("belly.svg");
  spacer= (width/3);

  r1=new robot(spacer-120);
  r2=new robot(spacer*2-120);
  r3=new robot(spacer*3-120);
}

void draw() {
  background(255);

  r1.display();
  r1.update();
  r2.display();
  r2.update();
  r3.display();
  r3.update();
}

class robot {
  //DATA
  float y, w, e, a, cr, d, x, yys, b, aas, bbs, headtest;
  color c;

  //CONTRUCTOR
  robot(int xpos) {
    x=xpos;
    y= random(170, 280);
    w=random(800);
    e=random(5, 30);
    b=0;
    cr=random(120, 255);
    c=color(cr);
    //    cr=random(210, 255);
    //    c=color(255, cr, cr);
    a=random(6, 20);
    d=400-x;
    yys=random(1, 15);
    aas=random(1, 8);
    bbs=random(1, 10);
    headtest=random(1, 10);
  }

  //FUNCTIONALITY
  void display() {
    shapeMode(CENTER);
    imageMode(CENTER);
    strokeWeight(2);

    tint(c);
    //legz
    shape(feet, x, 200);
    line((369-(w*0.06))-d, 40+y, x-28, 357);
    line((430+(w*0.06))-d, 40+y, x+28, 357);
    pushMatrix();
    translate(x, y); 
    //antennaez 
    fill(255-b, 240+b, 0+b);
    line(0, 0, 0, -160);
    ellipse(0, -160, a, a);
    //boday
    shape(body, 0, 0, 600+w, 400);
    if (headtest<=5) {
      image(headd, 0, -88, 75, 90);
    }
    else {
      pushMatrix();
      scale(-1, 1);
      image(headd, 0, -88, 75, 90);
      popMatrix();
    }
    //buttons
    ellipse(-25, -25, 8, 8);
    ellipse(-10, -25, 8, 8);
    ellipse(5, -25, 8, 8);
    ellipse(20, -25, 8, 8);
    //eyes
    fill(255);
    float swtch=0;
    if (headtest>=5) {
      swtch+=9;
    }
    ellipse(-25+swtch, -93, e, e);
    ellipse(15+swtch, -93, e, e);

    //armsz
    curve(-10-(w*0.06), -10, -35-(w*0.06), -42, -60-(w*0.06), 45, -15-(w*0.06), 20);
    curve(10, -10+(w*0.06), 35+(w*0.06), -42, 60+(w*0.06), 45, 15+(w*0.06), 20);
    shape(handz, 61+(w*0.06), 0);
    shape(handz, -60-(w*0.06), 0);
    //belleh
    shape(belly, 0, 10);

    popMatrix();
  }

  void update() {
    float yy=sin(frameCount/yys);
    y +=yy;

    float aa=sin(frameCount/aas);
    a +=aa;

    float bb=sin(frameCount/bbs)*30;
    b +=bb;
  }
}



void mousePressed()
{
  r1=new robot(spacer-120);
  r2=new robot(spacer*2-120);
  r3=new robot(spacer*3-120);
}


