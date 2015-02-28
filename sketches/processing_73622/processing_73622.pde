
//MEGA MAN
//BY EVAN BINDER
/*8-bit sprite of Mega Man*/

//GLOBAL VARIABLES
float r = 68; //red value ManA
float g = 118; //green value ManA
float b = 187; //blue value ManA

float t = 109;//red value ManB
float h = 204;//green value ManB
float n = 221;//blue value ManB


//CLASS DECLARATION

ManA megaManA;

ManB megaManB;


void setup() {
  background (255);
  frameRate (100);
  size (900, 700);



  megaManA = new ManA();//INITIALIZATION


  megaManB = new ManB();//INITIALIZATION
}


void draw() {
  if (mousePressed) {
    background (255);
    megaManB.display();//jumping mega man displayed

    if (keyPressed) {//random tunic
      r= random(255);//red value ManA
      g = random(255);//green value ManA
      b = random(255);//blue value ManA
      t= random(255);//red value ManB
      h = random(255);//green value ManB
      n = random(255);//blue value ManB
      background (255);
    }
  } 
  else { 
    background (255);
    megaManA.display();//initial megaMan displayed
    if (keyPressed) {//random tunic
      background (255);
      megaManA.display();//initial megaMan displayed
      r= random(255);//red value ManA
      g = random(255);//green value ManA
      b = random(255);//blue value ManA
      t= random(255);//red value ManB
      h = random(255);//green value ManB
      n = random(255);//blue value ManB
      background (255);
    }
  }
}






//++++++++++++++++++++++ OBJECTS+++++++++++++

class ManA {


  //CONSTRUCTOR
  ManA() {
  }
  //FUNCTION
  void display() {
    noStroke();
    fill(0);
    rect(mouseX, mouseY, 30, 10); //right topmost helmet
    rect(mouseX-20, mouseY+10, 30, 10); //left topmost helmet
    rect(mouseX-30, mouseY+20, 10, 10); //left top helmet
    rect(mouseX-40, mouseY+30, 10, 20); //left top helmet
    rect(mouseX-50, mouseY+50, 10, 30); //left ear
    rect(mouseX-40, mouseY+80, 10, 10); //left shoulder
    rect(mouseX-50, mouseY+90, 20, 10); //left bicep
    rect(mouseX-70, mouseY+100, 20, 10); //left elbow
    rect(mouseX-80, mouseY+110, 10, 20); //leftmost side left gloe
    rect(mouseX-90, mouseY+130, 10, 40); //leftmost bottom side left glove
    rect(mouseX-80, mouseY+170, 30, 10); //bottom glove
    rect(mouseX-50, mouseY+140, 20, 30); //glove lining bodmouseY
    rect(mouseX-60, mouseY+140, 10, 10); //glove lining
    rect(mouseX-40, mouseY+130, 10, 10); //glove lining
    rect(mouseX-40, mouseY+170, 10, 10); //glove lining
    rect(mouseX-50, mouseY+180, 10, 10); //hip
    rect(mouseX-60, mouseY+190, 10, 20); //knee
    rect(mouseX-70, mouseY+200, 10, 10); //knee
    rect(mouseX-90, mouseY+210, 20, 10); //top of shoe
    rect(mouseX-100, mouseY+220, 10, 10); //left toe
    rect(mouseX-100, mouseY+230, 90, 10); //sole of left foot
    rect(mouseX-20, mouseY+210, 10, 30); //left ankle
    rect(mouseX-10, mouseY+200, 10, 10); //inside hip
    rect(mouseX, mouseY+190, 10, 10); //nether regions
    rect(mouseX+10, mouseY+200, 10, 10); //inside right hip
    rect(mouseX+20, mouseY+210, 10, 20); //right ankle 
    rect(mouseX+20, mouseY+230, 90, 10); //right sole
    rect(mouseX+100, mouseY+220, 10, 10); //right toe
    rect(mouseX+80, mouseY+210, 20, 10); //right top shoe
    rect(mouseX+60, mouseY+200, 20, 10); //right knee
    rect(mouseX+60, mouseY+190, 10, 10); //right knee
    rect(mouseX+50, mouseY+180, 10, 10); //right hip
    rect(mouseX+40, mouseY+130, 10, 50); //right armpit
    rect(mouseX+50, mouseY+140, 10, 30); //right inner bicep
    rect(mouseX+60, mouseY+140, 10, 10); //right bicep
    rect(mouseX+60, mouseY+170, 30, 10); //right glove bottom
    rect(mouseX+90, mouseY+130, 10, 40); //right gloe right side
    rect(mouseX+80, mouseY+110, 10, 20); //right shoulder
    rect(mouseX+50, mouseY+100, 30, 10); //right shoulder
    rect(mouseX+40, mouseY+110, 10, 10); //
    rect(mouseX-10, mouseY+120, 50, 10); //chin
    rect(mouseX-20, mouseY+110, 10, 10);
    rect(mouseX-30, mouseY+100, 10, 10); //end chin
    rect(mouseX+60, mouseY+40, 10, 60);
    rect(mouseX+20, mouseY+30, 40, 10);
    rect(mouseX+30, mouseY+50, 20, 10);
    rect(mouseX+10, mouseY+20, 10, 10);
    rect(mouseX+20, mouseY+40, 10, 10);
    rect(mouseX+30, mouseY+10, 10, 10);
    rect(mouseX+40, mouseY+20, 10, 10);

    //FILLS
    fill (r, g, b);//dark blue

    rect (mouseX-30, mouseY+30, 10, 70); //helmet
    rect (mouseX-20, mouseY+20, 10, 50);
    rect (mouseX-20, mouseY+100, 10, 10);
    rect (mouseX-10, mouseY+20, 10, 40);
    rect (mouseX, mouseY+20, 10, 40);
    rect (mouseX+10, mouseY+30, 10, 30);
    rect (mouseX+20, mouseY+50, 10, 10);
    rect (mouseX+30, mouseY+60, 20, 10);
    rect (mouseX+50, mouseY+40, 10, 20);

    rect (mouseX+60, mouseY+120, 10, 20);//right arm
    rect (mouseX+70, mouseY+110, 10, 60);
    rect (mouseX+80, mouseY+130, 10, 40);
    rect (mouseX+60, mouseY+150, 10, 20);

    rect (mouseX-60, mouseY+120, 10, 20);//right arm
    rect (mouseX-70, mouseY+110, 10, 60);
    rect (mouseX-80, mouseY+130, 10, 40);
    rect (mouseX-60, mouseY+150, 10, 20);

    rect (mouseX-30, mouseY+160, 70, 10);//trousers
    rect (mouseX-30, mouseY+170, 70, 10);
    rect (mouseX-20, mouseY+180, 40, 10);

    rect (mouseX-50, mouseY+190, 20, 10);//left legging
    rect (mouseX-50, mouseY+200, 30, 30);
    rect (mouseX-70, mouseY+210, 20, 10);
    rect (mouseX-90, mouseY+220, 40, 10);

    rect (mouseX+50, mouseY+190, 10, 10);//right legging
    rect (mouseX+30, mouseY+200, 30, 30);
    rect (mouseX+60, mouseY+210, 20, 10);
    rect (mouseX+60, mouseY+220, 40, 10);

    fill (t, h, n);//light blue

    rect (mouseX+10, mouseY+10, 20, 10);//helmet
    rect (mouseX+20, mouseY+20, 20, 10);
    rect (mouseX+30, mouseY+40, 20, 10);
    rect (mouseX-40, mouseY+50, 10, 30);
    rect (mouseX-30, mouseY+130, 70, 30);//left arm
    rect (mouseX-50, mouseY+130, 10, 10);
    rect (mouseX-50, mouseY+120, 40, 10);
    rect (mouseX-60, mouseY+110, 40, 10);
    rect (mouseX-50, mouseY+100, 20, 10);

    rect (mouseX+50, mouseY+110, 20, 10);//right arm
    rect (mouseX+40, mouseY+120, 20, 10);
    rect (mouseX+50, mouseY+130, 10, 10);

    rect (mouseX-40, mouseY+180, 20, 10);//left legging
    rect (mouseX-30, mouseY+190, 30, 10);
    rect (mouseX-20, mouseY+200, 10, 10);

    rect (mouseX+20, mouseY+180, 30, 10);//right legging
    rect (mouseX+10, mouseY+190, 40, 10);
    rect (mouseX+20, mouseY+200, 10, 10);

    fill (253, 220, 205);//skin tone
    rect (mouseX-10, mouseY+60, 10, 10);
    rect (mouseX-20, mouseY+70, 10, 30);
    rect (mouseX-10, mouseY+90, 10, 30);
    rect (mouseX-10, mouseY+110, 50, 10);
    rect (mouseX+40, mouseY+100, 10, 10);
    rect (mouseX+30, mouseY+70, 10, 30);

    //EYES

    fill(0);
    rect (mouseX+10, mouseY+70, 20, 20);
    rect (mouseX+40, mouseY+70, 10, 20);
    rect (mouseX, mouseY+100, 40, 10);//mouth

    fill(255);
    rect (mouseX, mouseY+60, 30, 10);
    rect (mouseX-10, mouseY+70, 20, 20);
    rect (mouseX, mouseY+90, 30, 10);
    rect (mouseX+50, mouseY+60, 10, 40);
    rect (mouseX+40, mouseY+90, 10, 10);
  }
}

class ManB {


  //CONSTRUCTOR
  ManB() {
  }
  //FUNCTION
  void display() {
    noStroke();
    fill(0);
    rect(mouseX, mouseY, 30, 10); //right topmost helmet
    rect(mouseX-20, mouseY+10, 30, 10); //left topmost helmet
    rect(mouseX-30, mouseY+20, 10, 10); //left top helmet
    rect(mouseX-40, mouseY+30, 10, 20); //left top helmet
    rect(mouseX-50, mouseY+50, 10, 30); //left ear
    rect(mouseX-40, mouseY+80, 10, 20); //left shoulder

    rect(mouseX+40, mouseY+110, 10, 10); //
    rect(mouseX+10, mouseY+120, 30, 10); //chin
    rect(mouseX-20, mouseY+110, 10, 10);
    rect(mouseX-30, mouseY+100, 10, 10); //end chin
    rect(mouseX+60, mouseY+40, 10, 60);
    rect(mouseX+20, mouseY+30, 40, 10);
    rect(mouseX+30, mouseY+50, 20, 10);
    rect(mouseX+10, mouseY+20, 10, 10);
    rect(mouseX+20, mouseY+40, 10, 10);
    rect(mouseX+30, mouseY+10, 10, 10);
    rect(mouseX+40, mouseY+20, 10, 10);
    rect(mouseX+50, mouseY+100, 10, 10);
    rect(mouseX-10, mouseY+120, 10, 10);//mouth

    rect(mouseX-60, mouseY+50, 10, 10);//left arm
    rect(mouseX-70, mouseY+30, 10, 20);
    rect(mouseX-80, mouseY+40, 10, 20);
    rect(mouseX-80, mouseY+20, 10, 10);
    rect(mouseX-100, mouseY+10, 20, 10);
    rect(mouseX-110, mouseY+20, 10, 10);
    rect(mouseX-120, mouseY+30, 10, 20);

    rect(mouseX-110, mouseY+50, 10, 10);
    rect(mouseX-100, mouseY+60, 10, 10);
    rect(mouseX-90, mouseY+70, 10, 10);
    rect(mouseX-80, mouseY+80, 10, 10);
    rect(mouseX-70, mouseY+90, 10, 10);
    rect(mouseX-60, mouseY+100, 10, 10);
    rect(mouseX-50, mouseY+110, 10, 20);

    rect(mouseX-40, mouseY+130, 10, 110);
    rect(mouseX-30, mouseY+240, 10, 50);
    rect(mouseX-20, mouseY+290, 30, 10);
    rect(mouseX+10, mouseY+230, 10, 60);
    rect(mouseX, mouseY+200, 10, 30);
    rect(mouseX+10, mouseY+190, 40, 10);
    rect(mouseX+50, mouseY+200, 10, 30);
    rect(mouseX+60, mouseY+220, 10, 10);
    rect(mouseX+70, mouseY+230, 40, 10);
    rect(mouseX+110, mouseY+210, 10, 20);
    rect(mouseX+100, mouseY+200, 10, 10);
    rect(mouseX+90, mouseY+170, 10, 30);
    rect(mouseX+80, mouseY+160, 10, 10);
    rect(mouseX+50, mouseY+150, 30, 10);
    rect(mouseX+50, mouseY+130, 10, 20);
    rect(mouseX+60, mouseY+120, 30, 10);
    rect(mouseX+90, mouseY+80, 10, 40);
    rect(mouseX+70, mouseY+80, 20, 10);

    //GUN
    rect(mouseX+100, mouseY+120, 40, 10);
    rect(mouseX+100, mouseY+70, 40, 10);
    rect(mouseX+130, mouseY+80, 30, 10);
    rect(mouseX+130, mouseY+110, 30, 10);
    rect(mouseX+140, mouseY+90, 10, 20);
    rect(mouseX+160, mouseY+90, 10, 20);



    //FILLS
    fill (r, g, b);//dark blue

    rect (mouseX-30, mouseY+30, 10, 70); //helmet
    rect (mouseX-20, mouseY+20, 10, 50);
    rect (mouseX-20, mouseY+100, 10, 10);
    rect (mouseX-10, mouseY+20, 10, 40);
    rect (mouseX, mouseY+20, 10, 40);
    rect (mouseX+10, mouseY+30, 10, 30);
    rect (mouseX+20, mouseY+50, 10, 10);
    rect (mouseX+30, mouseY+60, 20, 10);
    rect (mouseX+50, mouseY+40, 10, 20);

    rect(mouseX+100, mouseY+80, 30, 10);//gun
    rect(mouseX+100, mouseY+90, 10, 10);
    rect(mouseX+100, mouseY+100, 40, 10);
    rect(mouseX+150, mouseY+100, 10, 10);
    rect(mouseX+100, mouseY+110, 30, 10);

    rect(mouseX+70, mouseY+170, 20, 60);//leg
    rect(mouseX+60, mouseY+180, 10, 40);
    rect(mouseX+50, mouseY+190, 10, 10);
    rect(mouseX+90, mouseY+200, 10, 30);
    rect(mouseX+100, mouseY+210, 10, 20);

    rect(mouseX-30, mouseY+160, 80, 10);//underpants
    rect(mouseX-30, mouseY+170, 70, 10);
    rect(mouseX-10, mouseY+180, 40, 10);

    rect(mouseX-10, mouseY+210, 10, 10);//left leg
    rect(mouseX-30, mouseY+220, 30, 20);
    rect(mouseX, mouseY+230, 10, 10);
    rect(mouseX-20, mouseY+240, 30, 50);

    rect(mouseX-70, mouseY+60, 20, 30);//left arm
    rect(mouseX-70, mouseY+50, 10, 10);
    rect(mouseX-80, mouseY+60, 10, 20);
    rect(mouseX-90, mouseY+20, 10, 50);
    rect(mouseX-80, mouseY+30, 10, 10);
    rect(mouseX-100, mouseY+20, 10, 40);
    rect(mouseX-110, mouseY+30, 10, 20);

    fill (t, h, n);//light blue

    rect (mouseX+10, mouseY+10, 20, 10);//helmet
    rect (mouseX+20, mouseY+20, 20, 10);
    rect (mouseX+30, mouseY+40, 20, 10);
    rect (mouseX-40, mouseY+50, 10, 30);

    rect (mouseX-30, mouseY+130, 80, 30);//left arm
    rect (mouseX-40, mouseY+120, 30, 10);
    rect (mouseX-40, mouseY+110, 20, 10);
    rect (mouseX-50, mouseY+100, 20, 10);
    rect (mouseX-60, mouseY+90, 20, 10);
    rect (mouseX-50, mouseY+80, 10, 10);

    rect (mouseX-30, mouseY+180, 20, 40);//left leg
    rect (mouseX-10, mouseY+190, 10, 20);
    rect (mouseX, mouseY+190, 10, 10);

    rect (mouseX+70, mouseY+90, 20, 10);//right arm
    rect (mouseX+60, mouseY+100, 30, 10);
    rect (mouseX+50, mouseY+110, 40, 10);
    rect (mouseX+40, mouseY+120, 20, 10);
    rect (mouseX+110, mouseY+90, 30, 10);//gun
    rect (mouseX+150, mouseY+90, 10, 10);

    rect (mouseX+50, mouseY+160, 30, 10);
    rect (mouseX+40, mouseY+170, 30, 10);
    rect (mouseX+30, mouseY+180, 30, 10);

    fill (253, 220, 205);//skin tone
    rect (mouseX-10, mouseY+60, 10, 10);
    rect (mouseX-20, mouseY+70, 10, 30);
    rect (mouseX-10, mouseY+90, 10, 30);
    rect (mouseX-10, mouseY+110, 50, 10);
    rect (mouseX+40, mouseY+100, 10, 10);
    rect (mouseX+30, mouseY+70, 10, 30);
    rect (mouseX, mouseY+100, 10, 10);
    rect(mouseX, mouseY+120, 10, 10); //chin
    rect (mouseX+50, mouseY+90, 10, 10);
    //EmouseYES

    fill(0);
    rect (mouseX+10, mouseY+70, 20, 20);
    rect (mouseX+40, mouseY+70, 10, 20);
    rect (mouseX+10, mouseY+100, 30, 10);//mouth
    rect (mouseX, mouseY+110, 50, 10);//mouth

    fill(255);
    rect (mouseX, mouseY+60, 30, 10);
    rect (mouseX-10, mouseY+70, 20, 20);
    rect (mouseX, mouseY+90, 30, 10);
    rect (mouseX+50, mouseY+60, 10, 30);
    rect (mouseX+40, mouseY+90, 10, 10);
  }
}


