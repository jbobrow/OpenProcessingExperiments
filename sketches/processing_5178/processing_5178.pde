

//// TIM SUGLINAN ////
/// UCLA DMA 28 ///


Robot r1, r2, r3, r4,r5;

Eye e1;                            
float x, y;                        //variables to
float targetX, targetY;            //set up the easing
float easing =.05;                 //for pupil movement

float d;                           //variables to
float targetD;                     //set up the easing
float easing2 = .01;               //for left to right movement

float square;                      //jump variables
int e = 1;
float j = 100;
boolean jump = true;
boolean fall = false;
boolean run = false;

void setup()
{
  size(480, 320);
  smooth();
  noStroke();
  e1 = new Eye( 240, 100, 145);
  r1 = new Robot(1);
  r2 = new Robot(2);
  r3 = new Robot(3);
  r4 = new Robot(4);
  r5 = new Robot(5);
}

void draw()
{
  background(179,221,242);
  targetD = mouseX;
  d = d + ((targetD - d)* easing);     //easing for left and right movement
  float square = sq (d-240);

  if (mouseX > 240) {                   //if statement keeps body on inside of the mouse
    d = d - 6;
  }
  else if (mouseX < 240) {
    d = d + 6;
  }


  if (! run)
  {
    r4.display_bot();
    pushMatrix();  
    translate (d-240,0);  
    if ((d > 0 && d < 48) || (d > 96 && d < 144) || (d > 192 && d < 240) || (d > 288 && d < 336) || (d > 384 && d < 432))
    {
      r1.display_bot();
    }


    else {
      r2.display_bot();
    }
    popMatrix();

    targetX = mouseX;
    x = x + ((targetX - x) * easing);
    targetY = mouseY;
    y = y + ((targetY - y) * easing);

    e1.update(x, y);                  
    e1.display();                       
  }

  if (mousePressed == true) {
    run = true;
  }

  if (run) {        //jump

    pushMatrix();
    translate (0, ((-1.75)*(j-170)));
    r4.display_bot();
    popMatrix();

    translate (0,j-170);
    pushMatrix();
    translate(d-240,0);
    r3.display_bot();
    popMatrix();

    e1.display();

    pushMatrix();
    translate (0, ((-1.75)*(j-170)));
    r5.display_bot();
    popMatrix();


    if (jump) {
      square = pow(.9, e);
      e++;
      j -= (10 * square);
      if (j < 75) {
        jump = false;
        fall = true;
      }
    }

    if (fall) {
      square = pow(.9, e);
      --e;
      j += (10 * square);
      if (j > 160) {
        fall = false;
        jump = true;
        e = 0;
        run = false;
      }
    }

  }
}

/////////////////CLASSES/////////////////

class Eye
{
  float ex, ey;                 
  float size;
  float angle = 0.0;

  Eye(float x, float y, int s) {        
    ex = x;
    ey = y;
    size = s;
  }

  void update( float mx, float my) {    //takes inpute from mouse
    angle= atan2(my-ey, mx-ex);         //subtracts position defined in void draw from mouse position
  }

  void display() {

    targetD = mouseX;
    d = d + ((targetD - d)* easing);     //easing for left and right movement

    if (mouseX > 240){                   //if statement keeps eye on inside of the mouse
      d = d - 6;
    }
    else {
      d = d + 6;
    }

    pushMatrix ();
    fill (255);
    translate (0, ey);
    ellipse( d, 0, size, size);            //large ellipse
    popMatrix ();
    pushMatrix();
    translate (d, ey);
    rotate (angle);
    fill(168,107,72);
    ellipse(size/6, 0, size/2, size/2);    //middle size ellipse
    fill(0);
    ellipse(size/6, 0, size/4, size/4);    //small ellipse
    popMatrix();

  }
}

class Robot
{
  float fz;

  Robot(int z) {
    fz = z;
  }


  void display_bot () {

    if (fz == 1) {
      //right hand            //right arm regular
      fill(240,212,194);
      beginShape();
      vertex(322,172);
      vertex(323,174);
      vertex(321,179);
      vertex(320,181);
      vertex(320,185);
      vertex(320,189);
      vertex(321,190);
      vertex(322,187);
      vertex(322,185);
      vertex(323,183);
      vertex(324,181);
      vertex(325,181);
      vertex(326,182);
      vertex(325,187);
      vertex(324,192);
      vertex(323,193);
      vertex(323,192);
      vertex(325,195);
      vertex(326,194);
      vertex(328,187);
      vertex(328,182);
      vertex(328,187);
      vertex(326,194);
      vertex(328,195);
      vertex(330,189);
      vertex(331,182);
      vertex(330,189);
      vertex(328,195);
      vertex(331,194);
      vertex(332,189);
      vertex(332,183);
      vertex(332,189);
      vertex(330,194);
      vertex(333,194);
      vertex(334,189);
      vertex(334,183);
      vertex(334,177);
      vertex(333,176);
      vertex(332,173);
      endShape();

      //right arm
      fill(234,183,183);
      beginShape();
      vertex(312,91);
      vertex(336,139);
      vertex(335,166);
      vertex(321,166);
      vertex(321,141);
      vertex(306,118);
      endShape();
      //cuff
      fill(227,154,155);
      beginShape();
      vertex(336,167);
      vertex(336,172);
      vertex(320,172);
      vertex(319,166);
      endShape(CLOSE);

      pushMatrix();               //left arm rotate
      rotate (-.4);
      translate(-50,70);

      //left hand
      fill(240,212,194);
      beginShape();
      vertex(149,170);
      vertex(148,173);
      vertex(148,180);
      vertex(148,186);
      vertex(149,190);
      vertex(151,191);
      vertex(150,186);
      vertex(150,180);
      vertex(150,186);
      vertex(151,192);
      vertex(154,192);
      vertex(152,185);
      vertex(152,179);
      vertex(152,185);
      vertex(154,193);
      vertex(154,191);
      vertex(154,183);
      vertex(154,179);
      vertex(154,183);
      vertex(155,191);
      vertex(157,192);
      vertex(158,191);
      vertex(158,189);
      vertex(157,183);
      vertex(157,178);
      vertex(158,178);
      vertex(159,179);
      vertex(160,182);
      vertex(159,185);
      vertex(160,186);
      vertex(162,186);
      vertex(162,178);
      vertex(161,176);
      vertex(159,171);
      vertex(159,169);
      endShape();
      //left arm
      fill(234,183,183);
      beginShape();
      vertex(170,88);
      vertex(146,136);
      vertex(146,164);
      vertex(160,163);
      vertex(160,138);
      vertex(175,114);
      endShape();
      //cuff
      fill(227,154,155);
      beginShape();
      vertex(145,163);
      vertex(146,169);
      vertex(162,168);
      vertex(162,163);
      endShape(CLOSE);

      popMatrix();

      pushMatrix ();              //right leg up
      rotate (-.2);
      translate(260,145);

      pushMatrix();
      translate (-20, 40);

      //right foot
      fill(242,109,110);    
      beginShape();
      curveVertex(0,131);
      curveVertex(0,131);
      curveVertex(0,155);
      curveVertex(20,156);
      curveVertex(18,131);
      curveVertex(18,131);
      endShape();


      //right leg
      fill(138,159,210);
      beginShape();
      vertex(23,0);
      vertex(28,54);
      vertex(18,131);
      vertex(1,131);
      vertex(11,57);
      vertex(6,9);
      endShape();
      popMatrix();

      popMatrix();


      //Left foot               //left leg regular
      fill(242,109,110);
      beginShape();
      curveVertex(223,276);
      curveVertex(223,276);
      curveVertex(219,300);
      curveVertex(239,301);
      curveVertex(240,276);
      curveVertex(240,276);
      endShape();

      //left leg
      fill(138,159,210);
      beginShape();
      vertex(218,155);
      vertex(213,203);
      vertex(223,276);
      vertex(240,276);
      vertex(231,206);
      vertex(235,159);
      endShape();
    }

    if (fz == 2) {

      pushMatrix();            //right arm rotate
      rotate(.3);
      translate(15,-90);
      //right hand
      fill(240,212,194);
      beginShape();
      vertex(322,172);
      vertex(323,174);
      vertex(321,179);
      vertex(320,181);
      vertex(320,185);
      vertex(320,189);
      vertex(321,190);
      vertex(322,187);
      vertex(322,185);
      vertex(323,183);
      vertex(324,181);
      vertex(325,181);
      vertex(326,182);
      vertex(325,187);
      vertex(324,192);
      vertex(323,193);
      vertex(323,192);
      vertex(325,195);
      vertex(326,194);
      vertex(328,187);
      vertex(328,182);
      vertex(328,187);
      vertex(326,194);
      vertex(328,195);
      vertex(330,189);
      vertex(331,182);
      vertex(330,189);
      vertex(328,195);
      vertex(331,194);
      vertex(332,189);
      vertex(332,183);
      vertex(332,189);
      vertex(330,194);
      vertex(333,194);
      vertex(334,189);
      vertex(334,183);
      vertex(334,177);
      vertex(333,176);
      vertex(332,173);
      endShape();

      //right arm
      fill(234,183,183);
      beginShape();
      vertex(312,91);
      vertex(336,139);
      vertex(335,166);
      vertex(321,166);
      vertex(321,141);
      vertex(306,118);
      endShape();
      //cuff
      fill(227,154,155);
      beginShape();
      vertex(336,167);
      vertex(336,172);
      vertex(320,172);
      vertex(319,166);
      endShape(CLOSE);
      popMatrix();

      //right foot              //right leg regular
      beginShape();
      fill(242,109,110);
      curveVertex(260,276);
      curveVertex(260,276);
      curveVertex(260,300);
      curveVertex(280,301);
      curveVertex(278,276);
      curveVertex(278,276);
      endShape();
      //right leg
      fill(138,159,210);
      beginShape();
      vertex(283,145);
      vertex(288,199);
      vertex(278,276);
      vertex(261,276);
      vertex(271,202);
      vertex(266,154);
      endShape();


      //left hand              //left arm regular
      fill(240,212,194);
      beginShape();
      vertex(149,170);
      vertex(148,173);
      vertex(148,180);
      vertex(148,186);
      vertex(149,190);
      vertex(151,191);
      vertex(150,186);
      vertex(150,180);
      vertex(150,186);
      vertex(151,192);
      vertex(154,192);
      vertex(152,185);
      vertex(152,179);
      vertex(152,185);
      vertex(154,193);
      vertex(154,191);
      vertex(154,183);
      vertex(154,179);
      vertex(154,183);
      vertex(155,191);
      vertex(157,192);
      vertex(158,191);
      vertex(158,189);
      vertex(157,183);
      vertex(157,178);
      vertex(158,178);
      vertex(159,179);
      vertex(160,182);
      vertex(159,185);
      vertex(160,186);
      vertex(162,186);
      vertex(162,178);
      vertex(161,176);
      vertex(159,171);
      vertex(159,169);
      endShape();
      //left arm
      fill(234,183,183);
      beginShape();
      vertex(170,88);
      vertex(146,136);
      vertex(146,164);
      vertex(160,163);
      vertex(160,138);
      vertex(175,114);
      endShape();
      //cuff
      fill(227,154,155);
      beginShape();
      vertex(145,163);
      vertex(146,169);
      vertex(162,168);
      vertex(162,163);
      endShape(CLOSE);

      pushMatrix();

      rotate(.2);
      translate(0,-55);
      //Left foot                          //left leg up
      fill(242,109,110);
      beginShape();
      curveVertex(223,276);
      curveVertex(223,276);
      curveVertex(219,300);
      curveVertex(239,301);
      curveVertex(240,276);
      curveVertex(240,276);
      endShape();
      //left leg
      fill(138,159,210);
      beginShape();
      vertex(218,155);
      vertex(213,203);
      vertex(223,276);
      vertex(240,276);
      vertex(231,206);
      vertex(235,159);
      endShape();

      popMatrix();

    }

    if (fz == 3) {
      pushMatrix();               //left arm rotate
      rotate (-.4);
      translate(-50,70);

      //left hand
      fill(240,212,194);
      beginShape();
      vertex(149,170);
      vertex(148,173);
      vertex(148,180);
      vertex(148,186);
      vertex(149,190);
      vertex(151,191);
      vertex(150,186);
      vertex(150,180);
      vertex(150,186);
      vertex(151,192);
      vertex(154,192);
      vertex(152,185);
      vertex(152,179);
      vertex(152,185);
      vertex(154,193);
      vertex(154,191);
      vertex(154,183);
      vertex(154,179);
      vertex(154,183);
      vertex(155,191);
      vertex(157,192);
      vertex(158,191);
      vertex(158,189);
      vertex(157,183);
      vertex(157,178);
      vertex(158,178);
      vertex(159,179);
      vertex(160,182);
      vertex(159,185);
      vertex(160,186);
      vertex(162,186);
      vertex(162,178);
      vertex(161,176);
      vertex(159,171);
      vertex(159,169);
      endShape();
      //left arm
      fill(234,183,183);
      beginShape();
      vertex(170,88);
      vertex(146,136);
      vertex(146,164);
      vertex(160,163);
      vertex(160,138);
      vertex(175,114);
      endShape();
      //cuff
      fill(227,154,155);
      beginShape();
      vertex(145,163);
      vertex(146,169);
      vertex(162,168);
      vertex(162,163);
      endShape(CLOSE);

      popMatrix();

      pushMatrix();            //right arm rotate
      rotate(.3);
      translate(15,-90);
      //right hand
      fill(240,212,194);
      beginShape();
      vertex(322,172);
      vertex(323,174);
      vertex(321,179);
      vertex(320,181);
      vertex(320,185);
      vertex(320,189);
      vertex(321,190);
      vertex(322,187);
      vertex(322,185);
      vertex(323,183);
      vertex(324,181);
      vertex(325,181);
      vertex(326,182);
      vertex(325,187);
      vertex(324,192);
      vertex(323,193);
      vertex(323,192);
      vertex(325,195);
      vertex(326,194);
      vertex(328,187);
      vertex(328,182);
      vertex(328,187);
      vertex(326,194);
      vertex(328,195);
      vertex(330,189);
      vertex(331,182);
      vertex(330,189);
      vertex(328,195);
      vertex(331,194);
      vertex(332,189);
      vertex(332,183);
      vertex(332,189);
      vertex(330,194);
      vertex(333,194);
      vertex(334,189);
      vertex(334,183);
      vertex(334,177);
      vertex(333,176);
      vertex(332,173);
      endShape();

      //right arm
      fill(234,183,183);
      beginShape();
      vertex(312,91);
      vertex(336,139);
      vertex(335,166);
      vertex(321,166);
      vertex(321,141);
      vertex(306,118);
      endShape();
      //cuff
      fill(227,154,155);
      beginShape();
      vertex(336,167);
      vertex(336,172);
      vertex(320,172);
      vertex(319,166);
      endShape(CLOSE);
      popMatrix();



      //right foot              //right leg regular
      beginShape();
      fill(242,109,110);
      curveVertex(260,276);
      curveVertex(260,276);
      curveVertex(260,300);
      curveVertex(280,301);
      curveVertex(278,276);
      curveVertex(278,276);
      endShape();
      //right leg
      fill(138,159,210);
      beginShape();
      vertex(283,145); 
      vertex(278,276);
      vertex(261,276);
      vertex(266,154);
      endShape();

      //Left foot               //left leg regular
      fill(242,109,110);
      beginShape();
      curveVertex(223,276);
      curveVertex(223,276);
      curveVertex(219,300);
      curveVertex(239,301);
      curveVertex(240,276);
      curveVertex(240,276);
      endShape();

      //left leg
      fill(138,159,210);
      beginShape();
      vertex(218,155);      
      vertex(223,276);
      vertex(240,276);
      vertex(235,159);
      endShape();



    }

    if (fz == 4) {

      fill(185,185,186);
      beginShape();
      vertex(0,205);
      vertex(0,165);
      vertex(20,120);
      vertex(50,100);
      vertex(90,150);
      vertex(120,130);
      vertex(140,160);
      vertex(175,110);
      vertex(210,175);
      vertex(250,120);
      vertex(300,190);
      vertex(350,160);
      vertex(380,170);
      vertex(420,130);
      vertex(450,150);
      vertex(480,120);
      vertex(480,205);
      endShape();

      fill(99,193,108);
      rect(0,200,480,120);
    }

    if (fz == 5) {

      translate(0,-150);
      fill(255,150);
      ellipse(50,100,40,40);
      ellipse(70,110,50,50);
      ellipse(75,95,45,45);
      ellipse(80,100,50,50);
      ellipse(90,106,48,48);
      ellipse(95,96,40,40);

      ellipse(170,130,50,50);
      ellipse(180,120,30,30);
      ellipse(185,140,45,45);
      ellipse(190,115,40,40);
      ellipse(205,110,35,35);
      ellipse(219,135,50,50);

      ellipse(290,110,50,50);
      ellipse(295,100,25,25);
      ellipse(305,100,40,40);
      ellipse(315,90,35,35);
      ellipse(330,105,45,45);

      ellipse(400,120,50,50);
      ellipse(420,110,35,35);
      ellipse(430,130,40,40);
      ellipse(435,135,20,20);
      ellipse(445,120,45,45);
    }

  }
}























