
//NYAN CAT
//BY EVAN BINDER
/*Animated cat with pop tart body and rainbow*/

//GLOBAL VARIABLES

int i = 0;//var to prevent overflow

boolean repeat = false;//var for loop

//CLASS DECLARATION

NyanA catNyanA;

NyanB catNyanB;


void setup() {
  background(0, 135, 189);
  size(1000, 550);
  frameRate(7);


  catNyanA = new NyanA();//INITIALIZATION


  catNyanB = new NyanB();//INITIALIZATION
}


void draw() {
  if ( i <= 500) { //limit for loop
    if (repeat == false) { //first object draw
      background(0, 135, 189);
      catNyanA.display();//OBJECT FUNCTION
      repeat = true;
    }
    else { //second object draw
      background(0, 135, 189);
      catNyanB.display();//OBJECT FUNCTION
      repeat = false;
      i++;//counter for loop
      println("What is I? i=" + i);
    }
  }
}






//++++++++++++++++++++++ OBJECTS+++++++++++++

class NyanA {

  int x_value; //variable for x pos
  int y_value; //variable for y pos
  //CONSTRUCTOR
  NyanA() {

    x_value = 700;
    y_value = 140;
  }
  //FUNCTION
  void display() {



    //++++++++++++++++BEGIN CONSTRUCT+++++++++++++++

    noStroke();

    //RAINBOW

    //first block
    fill(255, 0, 0);//red
    rect(x_value-80, y_value, 70, 30);
    fill(255, 127, 0);//orange
    rect(x_value-80, y_value+30, 70, 30);
    fill(255, 255, 0);//yelow
    rect(x_value-80, y_value+60, 70, 30);
    fill(0, 220, 0);//green
    rect(x_value-80, y_value+90, 70, 30);
    fill(173, 216, 230);//blue
    rect(x_value-80, y_value+120, 70, 30);
    fill(0, 0, 255);//indigo
    rect(x_value-80, y_value+150, 70, 30);

    //second block
    fill(255, 0, 0);
    rect(x_value-150, y_value-10, 70, 30);
    fill(255, 127, 0);
    rect(x_value-150, y_value+20, 70, 30);
    fill(255, 255, 0);
    rect(x_value-150, y_value+50, 70, 30);
    fill(0, 220, 0);
    rect(x_value-150, y_value+80, 70, 30);
    fill(173, 216, 230);
    rect(x_value-150, y_value+110, 70, 30);
    fill(0, 0, 255);
    rect(x_value-150, y_value+140, 70, 30);

    //third block
    fill(255, 0, 0);
    rect(x_value-220, y_value-20, 70, 30);
    fill(255, 127, 0);
    rect(x_value-220, y_value+10, 70, 30);
    fill(255, 255, 0);
    rect(x_value-220, y_value+40, 70, 30);
    fill(0, 220, 0);
    rect(x_value-220, y_value+70, 70, 30);
    fill(173, 216, 230);
    rect(x_value-220, y_value+100, 70, 30);
    fill(0, 0, 255);
    rect(x_value-220, y_value+130, 70, 30);

    //fourth block
    fill(255, 0, 0);
    rect(x_value-290, y_value-10, 70, 30);
    fill(255, 127, 0);
    rect(x_value-290, y_value+20, 70, 30);
    fill(255, 255, 0);
    rect(x_value-290, y_value+50, 70, 30);
    fill(0, 220, 0);
    rect(x_value-290, y_value+80, 70, 30);
    fill(173, 216, 230);
    rect(x_value-290, y_value+110, 70, 30);
    fill(0, 0, 255);
    rect(x_value-290, y_value+140, 70, 30);

    //fifth block
    fill(255, 0, 0);//red
    rect(x_value-360, y_value, 70, 30);
    fill(255, 127, 0);//orange
    rect(x_value-360, y_value+30, 70, 30);
    fill(255, 255, 0);//yelow
    rect(x_value-360, y_value+60, 70, 30);
    fill(0, 220, 0);//green
    rect(x_value-360, y_value+90, 70, 30);
    fill(173, 216, 230);//blue
    rect(x_value-360, y_value+120, 70, 30);
    fill(0, 0, 255);//indigo
    rect(x_value-360, y_value+150, 70, 30);


    //sixth block
    fill(255, 0, 0);
    rect(x_value-430, y_value+10, 70, 30);
    fill(255, 127, 0);
    rect(x_value-430, y_value+40, 70, 30);
    fill(255, 255, 0);
    rect(x_value-430, y_value+70, 70, 30);
    fill(0, 220, 0);
    rect(x_value-430, y_value+100, 70, 30);
    fill(173, 216, 230);
    rect(x_value-430, y_value+130, 70, 30);
    fill(0, 0, 255);
    rect(x_value-430, y_value+160, 70, 30);

    //seventh block
    fill(255, 0, 0);
    rect(x_value-500, y_value, 70, 30);
    fill(255, 127, 0);
    rect(x_value-500, y_value+30, 70, 30);
    fill(255, 255, 0);
    rect(x_value-500, y_value+60, 70, 30);
    fill(0, 220, 0);
    rect(x_value-500, y_value+90, 70, 30);
    fill(173, 216, 230);
    rect(x_value-500, y_value+120, 70, 30);
    fill(0, 0, 255);
    rect(x_value-500, y_value+150, 70, 30);


    //eighth block
    fill(255, 0, 0);
    rect(x_value-570, y_value-10, 70, 30);
    fill(255, 127, 0);
    rect(x_value-570, y_value+20, 70, 30);
    fill(255, 255, 0);
    rect(x_value-570, y_value+50, 70, 30);
    fill(0, 220, 0);
    rect(x_value-570, y_value+80, 70, 30);
    fill(173, 216, 230);
    rect(x_value-570, y_value+110, 70, 30);
    fill(0, 0, 255);
    rect(x_value-570, y_value+140, 70, 30);

    //ninth block
    fill(255, 0, 0);//red
    rect(x_value-640, y_value, 70, 30);
    fill(255, 127, 0);//orange
    rect(x_value-640, y_value+30, 70, 30);
    fill(255, 255, 0);//yelow
    rect(x_value-640, y_value+60, 70, 30);
    fill(0, 220, 0);//green
    rect(x_value-640, y_value+90, 70, 30);
    fill(173, 216, 230);//blue
    rect(x_value-640, y_value+120, 70, 30);
    fill(0, 0, 255);//indigo
    rect(x_value-640, y_value+150, 70, 30);

    //tenth block
    fill(255, 0, 0);
    rect(x_value-710, y_value+10, 70, 30);
    fill(255, 127, 0);
    rect(x_value-710, y_value+40, 70, 30);
    fill(255, 255, 0);
    rect(x_value-710, y_value+70, 70, 30);
    fill(0, 220, 0);
    rect(x_value-710, y_value+100, 70, 30);
    fill(173, 216, 230);
    rect(x_value-710, y_value+130, 70, 30);
    fill(0, 0, 255);
    rect(x_value-710, y_value+160, 70, 30);




    //BODY OUTLINE
    fill(0);
    rect(x_value, y_value, 170, 10);//back
    rect(x_value+190, y_value+50, 10, 10);//back left side right ear single cube
    rect(x_value+200, y_value+40, 20, 10);//top right ear
    rect(x_value+220, y_value+50, 10, 40);//right side right ear
    rect(x_value+230, y_value+90, 10, 50);//right side cheek
    rect(x_value+220, y_value+140, 10, 10);//bottom right side single cube
    rect(x_value+210, y_value+150, 10, 10);//further bottom right side single cube
    rect(x_value+110, y_value+160, 100, 10);//chin
    rect(x_value+100, y_value+150, 10, 10);//left side chin single cube
    rect(x_value+90, y_value+140, 10, 10);//left side chin higher single cube
    rect(x_value+80, y_value+90, 10, 50);//left side cheek
    rect(x_value+90, y_value+50, 10, 40);//left ear left side
    rect(x_value+100, y_value+40, 20, 10);//left top ear
    rect(x_value+120, y_value+50, 10, 10);//left ear right side single cube
    rect(x_value+130, y_value+60, 10, 10);//left ear right side single cube
    rect(x_value+140, y_value+70, 40, 10);//top of head

    //HEAD OUTLINE
    rect(x_value-10, y_value+10, 10, 10);//back left single cube
    rect(x_value+170, y_value+10, 10, 10);//back right single cube
    rect(x_value+180, y_value+20, 10, 50);//right side back neck
    rect(x_value, y_value+160, 110, 10);//bottom of body
    rect(x_value-10, y_value+150, 10, 10);//bottom left of body single cube
    rect(x_value-20, y_value+20, 10, 130);//backside

    //+++++++++++END OF MAIN BODY OUTLINE+++++++++++++

    //+++++++++++BEGIN POP-TART+++++++++++++

    //BREAD
    fill(255, 228, 181);
    rect(x_value-10, y_value+20, 10, 130);//left side
    rect(x_value, y_value+10, 10, 30);//left top corner
    rect(x_value+10, y_value+10, 10, 20);//left top corner
    rect(x_value+20, y_value+10, 130, 10);//top of pop-tart
    rect(x_value+150, y_value+10, 10, 20);//right top corner
    rect(x_value+160, y_value+10, 10, 30);//right-most top corner
    rect(x_value+170, y_value+20, 10, 50);//right top corner
    rect(x_value+160, y_value+10, 10, 30);//right top corner
    rect(x_value, y_value+130, 10, 30);//left-most bottom corner
    rect(x_value+10, y_value+140, 10, 20);//left bottom corner
    rect(x_value+20, y_value+150, 80, 10);//bottom
    //END OF BREAD

    //ICING
    fill(255, 182, 193);
    rect(x_value, y_value+40, 10, 20);//left top icing
    rect(x_value, y_value+70, 10, 60);//left bottom icing
    rect(x_value+10, y_value+30, 10, 110);//2nd column icing
    rect(x_value+20, y_value+20, 10, 20);//1st part column 3 icing
    rect(x_value+20, y_value+50, 10, 30);//2nd part column 3 icing
    rect(x_value+20, y_value+90, 10, 40);//3rd part column 3 icing
    rect(x_value+20, y_value+140, 10, 10);//4th part column 3 icing
    rect(x_value+30, y_value+20, 10, 130);//column 4 icing
    rect(x_value+40, y_value+20, 10, 130);//column 5 icing
    rect(x_value+50, y_value+20, 10, 50);//1st part column 6 icing
    rect(x_value+50, y_value+80, 10, 30);//2nd part column 6 icing
    rect(x_value+50, y_value+120, 10, 30);//3rd part column 6 icing
    rect(x_value+60, y_value+20, 10, 130);//column 7 icing
    rect(x_value+70, y_value+20, 10, 120);//column 8 icing
    rect(x_value+80, y_value+20, 10, 10);//1st part column 9 icing
    rect(x_value+80, y_value+40, 10, 50);//2nd part column 9 icing
    rect(x_value+80, y_value+140, 10, 10);//3rd part column 9 icing
    rect(x_value+90, y_value+20, 10, 30);//column 10 icing
    rect(x_value+100, y_value+20, 20, 20);//columns 11 & 12 icing
    rect(x_value+120, y_value+20, 10, 30);//column 13 icing
    rect(x_value+130, y_value+20, 10, 20);//1st part column 14 icing
    rect(x_value+130, y_value+50, 10, 10);//2nd part column 14 icing
    rect(x_value+140, y_value+20, 10, 50);//column 15 icing
    rect(x_value+150, y_value+30, 10, 40);//column 16 icing
    rect(x_value+160, y_value+40, 10, 30);//column 17 icing

    //SPRINKLES(from left to right)

    fill(255, 20, 147);

    rect(x_value, y_value+60, 10, 10);
    rect(x_value+20, y_value+40, 10, 10);
    rect(x_value+20, y_value+80, 10, 10);
    rect(x_value+20, y_value+130, 10, 10);
    rect(x_value+50, y_value+70, 10, 10);
    rect(x_value+50, y_value+110, 10, 10);
    rect(x_value+70, y_value+140, 10, 10);
    rect(x_value+80, y_value+30, 10, 10);
    rect(x_value+130, y_value+40, 10, 10);

    //+++++++++++END POP-TART++++++++++++++++

    //+++++++++++BEGIN HEAD FILL+++++++++++++

    fill(105, 105, 105);

    rect(x_value+100, y_value+50, 20, 10);//top left ear
    rect(x_value+100, y_value+60, 30, 10);//middle left ear
    rect(x_value+100, y_value+70, 40, 10);//bottom left ear
    rect(x_value+100, y_value+80, 120, 10);//brow
    rect(x_value+90, y_value+90, 140, 10);//brow 2
    rect(x_value+200, y_value+50, 20, 10);//top right ear
    rect(x_value+190, y_value+60, 30, 10);//middle right ear
    rect(x_value+180, y_value+70, 40, 10);//bottom right ear
    rect(x_value+90, y_value+100, 30, 20);//left cheek
    rect(x_value+90, y_value+120, 10, 20);
    rect(x_value+100, y_value+140, 20, 10);
    rect(x_value+120, y_value+130, 10, 20);
    rect(x_value+110, y_value+150, 100, 10);//chin
    rect(x_value+120, y_value+120, 90, 10);//upper mouth

    rect(x_value+210, y_value+100, 20, 20);//right cheek
    rect(x_value+200, y_value+130, 10, 20);
    rect(x_value+210, y_value+140, 10, 10);
    rect(x_value+140, y_value+130, 20, 10);//above mouth left
    rect(x_value+170, y_value+130, 20, 10);//above mouth right

    //MOUTH

    fill(0);
    rect(x_value+130, y_value+130, 10, 10);
    rect(x_value+190, y_value+130, 10, 10);
    rect(x_value+160, y_value+130, 10, 10);
    rect(x_value+130, y_value+140, 70, 10);

    //BLUSH

    fill(255, 105, 180);
    rect(x_value+100, y_value+120, 20, 20);//left side
    rect(x_value+210, y_value+120, 20, 20);//right side

    //++++++++++EYES & MISC+++++++++++++

    fill(105, 105, 105);
    rect(x_value+140, y_value+100, 50, 10);
    rect(x_value+140, y_value+110, 30, 10);
    rect(x_value+180, y_value+110, 10, 10);

    //NOSE

    fill(0);
    rect(x_value+170, y_value+110, 10, 10);

    //LEFT EYE

    fill(0);
    rect(x_value+120, y_value+110, 10, 10);//iris
    rect(x_value+130, y_value+100, 10, 20);
    fill(255);
    rect(x_value+120, y_value+100, 10, 10);//pupil

    //RIGHT EYE

    fill(0);
    rect(x_value+190, y_value+110, 10, 10);//iris
    rect(x_value+200, y_value+100, 10, 20);
    fill(255);
    rect(x_value+190, y_value+100, 10, 10);//pupil

    //++++++++++++BEGIN EXTREMITIES+++++++++++++++

    //HIND LEGS

    fill(0);//leftmost leg outline
    rect(x_value-30, y_value+160, 30, 10);
    rect(x_value-30, y_value+170, 10, 30);
    rect(x_value-20, y_value+190, 20, 10);
    rect(x_value, y_value+170, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value-20, y_value+170, 20, 20);

    fill(0);//right most leg outline
    rect(x_value+20, y_value+160, 10, 20);
    rect(x_value+30, y_value+180, 20, 10);
    rect(x_value+50, y_value+160, 10, 30);
    //rect(x_value, y_value+150, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value+30, y_value+170, 20, 10);



    //FRONT LEGS
    fill(0);//right most leg outline
    rect(x_value+110, y_value+160, 10, 20);
    rect(x_value+120, y_value+180, 20, 10);
    rect(x_value+140, y_value+160, 10, 30);
    //rect(x_value, y_value+150, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value+120, y_value+170, 20, 10);

    fill(0);//right most leg outline
    rect(x_value+160, y_value+160, 10, 20);
    rect(x_value+170, y_value+180, 20, 10);
    rect(x_value+190, y_value+160, 10, 30);
    //rect(x_value, y_value+150, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value+170, y_value+170, 20, 10);


    //TAIL

    fill(0);//border for tail
    rect(x_value-40, y_value+80, 30, 10);
    rect(x_value-50, y_value+70, 10, 20);
    rect(x_value-70, y_value+60, 20, 10);
    rect(x_value-80, y_value+70, 10, 20);
    rect(x_value-70, y_value+90, 10, 10);
    rect(x_value-60, y_value+100, 20, 10);
    rect(x_value-40, y_value+110, 20, 10);

    fill(105, 105, 105);//filling for tail
    rect(x_value-70, y_value+70, 20, 20);
    rect(x_value-60, y_value+90, 40, 10);
    rect(x_value-40, y_value+100, 20, 10);
  }
}


class NyanB {

  int x_value; //variable for x pos
  int y_value; //variable for y pos

  int z_value; //variable for z pos
  //CONSTRUCTOR
  NyanB() {

    x_value = 700;
    y_value = 130;

    z_value = 140;
  }
  //FUNCTION
  void display() {



    //++++++++++++++++BEGIN CONSTRUCT+++++++++++++++

    noStroke();

    //RAINBOW

    //first block
    fill(255, 0, 0);//red
    rect(x_value-80, z_value+10, 70, 30);
    fill(255, 127, 0);//orange
    rect(x_value-80, z_value+40, 70, 30);
    fill(255, 255, 0);//yelow
    rect(x_value-80, z_value+70, 70, 30);
    fill(0, 220, 0);//green
    rect(x_value-80, z_value+100, 70, 30);
    fill(173, 216, 230);//blue
    rect(x_value-80, z_value+130, 70, 30);
    fill(0, 0, 255);//indigo
    rect(x_value-80, z_value+160, 70, 30);

    //second block
    fill(255, 0, 0);
    rect(x_value-150, z_value+20, 70, 30);
    fill(255, 127, 0);
    rect(x_value-150, z_value+50, 70, 30);
    fill(255, 255, 0);
    rect(x_value-150, z_value+80, 70, 30);
    fill(0, 220, 0);
    rect(x_value-150, z_value+110, 70, 30);
    fill(173, 216, 230);
    rect(x_value-150, z_value+140, 70, 30);
    fill(0, 0, 255);
    rect(x_value-150, z_value+170, 70, 30);

    //third block
    fill(255, 0, 0);
    rect(x_value-220, z_value+30, 70, 30);
    fill(255, 127, 0);
    rect(x_value-220, z_value+60, 70, 30);
    fill(255, 255, 0);
    rect(x_value-220, z_value+90, 70, 30);
    fill(0, 220, 0);
    rect(x_value-220, z_value+120, 70, 30);
    fill(173, 216, 230);
    rect(x_value-220, z_value+150, 70, 30);
    fill(0, 0, 255);
    rect(x_value-220, z_value+180, 70, 30);

    //fourth block
    fill(255, 0, 0);
    rect(x_value-290, z_value+20, 70, 30);
    fill(255, 127, 0);
    rect(x_value-290, z_value+50, 70, 30);
    fill(255, 255, 0);
    rect(x_value-290, z_value+80, 70, 30);
    fill(0, 220, 0);
    rect(x_value-290, z_value+110, 70, 30);
    fill(173, 216, 230);
    rect(x_value-290, z_value+140, 70, 30);
    fill(0, 0, 255);
    rect(x_value-290, z_value+170, 70, 30);

    //fifth block
    fill(255, 0, 0);//red
    rect(x_value-360, z_value+10, 70, 30);
    fill(255, 127, 0);//orange
    rect(x_value-360, z_value+40, 70, 30);
    fill(255, 255, 0);//yelow
    rect(x_value-360, z_value+70, 70, 30);
    fill(0, 220, 0);//green
    rect(x_value-360, z_value+100, 70, 30);
    fill(173, 216, 230);//blue
    rect(x_value-360, z_value+130, 70, 30);
    fill(0, 0, 255);//indigo
    rect(x_value-360, z_value+160, 70, 30);


    //sixth block
    fill(255, 0, 0);
    rect(x_value-430, z_value+20, 70, 30);
    fill(255, 127, 0);
    rect(x_value-430, z_value+50, 70, 30);
    fill(255, 255, 0);
    rect(x_value-430, z_value+80, 70, 30);
    fill(0, 220, 0);
    rect(x_value-430, z_value+110, 70, 30);
    fill(173, 216, 230);
    rect(x_value-430, z_value+140, 70, 30);
    fill(0, 0, 255);
    rect(x_value-430, z_value+170, 70, 30);

    //seventh block
    fill(255, 0, 0);
    rect(x_value-500, z_value+30, 70, 30);
    fill(255, 127, 0);
    rect(x_value-500, z_value+60, 70, 30);
    fill(255, 255, 0);
    rect(x_value-500, z_value+90, 70, 30);
    fill(0, 220, 0);
    rect(x_value-500, z_value+120, 70, 30);
    fill(173, 216, 230);
    rect(x_value-500, z_value+150, 70, 30);
    fill(0, 0, 255);
    rect(x_value-500, z_value+180, 70, 30);


    //eighth block
    fill(255, 0, 0);
    rect(x_value-570, z_value+20, 70, 30);
    fill(255, 127, 0);
    rect(x_value-570, z_value+50, 70, 30);
    fill(255, 255, 0);
    rect(x_value-570, z_value+80, 70, 30);
    fill(0, 220, 0);
    rect(x_value-570, z_value+110, 70, 30);
    fill(173, 216, 230);
    rect(x_value-570, z_value+140, 70, 30);
    fill(0, 0, 255);
    rect(x_value-570, z_value+170, 70, 30);

    //ninth block
    fill(255, 0, 0);//red
    rect(x_value-640, z_value+10, 70, 30);
    fill(255, 127, 0);//orange
    rect(x_value-640, z_value+40, 70, 30);
    fill(255, 255, 0);//yelow
    rect(x_value-640, z_value+70, 70, 30);
    fill(0, 220, 0);//green
    rect(x_value-640, z_value+100, 70, 30);
    fill(173, 216, 230);//blue
    rect(x_value-640, z_value+130, 70, 30);
    fill(0, 0, 255);//indigo
    rect(x_value-640, z_value+160, 70, 30);

    //tenth block
    fill(255, 0, 0);
    rect(x_value-710, z_value+20, 70, 30);
    fill(255, 127, 0);
    rect(x_value-710, z_value+50, 70, 30);
    fill(255, 255, 0);
    rect(x_value-710, z_value+80, 70, 30);
    fill(0, 220, 0);
    rect(x_value-710, z_value+110, 70, 30);
    fill(173, 216, 230);
    rect(x_value-710, z_value+140, 70, 30);
    fill(0, 0, 255);
    rect(x_value-710, z_value+170, 70, 30);




    //BODY OUTLINE
    fill(0);
    rect(x_value, y_value, 170, 10);//back
    rect(x_value+190, y_value+50, 10, 10);//back left side right ear single cube
    rect(x_value+200, y_value+40, 20, 10);//top right ear
    rect(x_value+220, y_value+50, 10, 40);//right side right ear
    rect(x_value+230, y_value+90, 10, 50);//right side cheek
    rect(x_value+220, y_value+140, 10, 10);//bottom right side single cube
    rect(x_value+210, y_value+150, 10, 10);//further bottom right side single cube
    rect(x_value+110, y_value+160, 100, 10);//chin
    rect(x_value+100, y_value+150, 10, 10);//left side chin single cube
    rect(x_value+90, y_value+140, 10, 10);//left side chin higher single cube
    rect(x_value+80, y_value+90, 10, 50);//left side cheek
    rect(x_value+90, y_value+50, 10, 40);//left ear left side
    rect(x_value+100, y_value+40, 20, 10);//left top ear
    rect(x_value+120, y_value+50, 10, 10);//left ear right side single cube
    rect(x_value+130, y_value+60, 10, 10);//left ear right side single cube
    rect(x_value+140, y_value+70, 40, 10);//top of head

    //HEAD OUTLINE
    rect(x_value-10, y_value+10, 10, 10);//back left single cube
    rect(x_value+170, y_value+10, 10, 10);//back right single cube
    rect(x_value+180, y_value+20, 10, 50);//right side back neck
    rect(x_value, y_value+160, 110, 10);//bottom of body
    rect(x_value-10, y_value+150, 10, 10);//bottom left of body single cube
    rect(x_value-20, y_value+20, 10, 130);//backside

    //+++++++++++END OF MAIN BODY OUTLINE+++++++++++++

    //+++++++++++BEGIN POP-TART+++++++++++++

    //BREAD
    fill(255, 228, 181);
    rect(x_value-10, y_value+20, 10, 130);//left side
    rect(x_value, y_value+10, 10, 30);//left top corner
    rect(x_value+10, y_value+10, 10, 20);//left top corner
    rect(x_value+20, y_value+10, 130, 10);//top of pop-tart
    rect(x_value+150, y_value+10, 10, 20);//right top corner
    rect(x_value+160, y_value+10, 10, 30);//right-most top corner
    rect(x_value+170, y_value+20, 10, 50);//right top corner
    rect(x_value+160, y_value+10, 10, 30);//right top corner
    rect(x_value, y_value+130, 10, 30);//left-most bottom corner
    rect(x_value+10, y_value+140, 10, 20);//left bottom corner
    rect(x_value+20, y_value+150, 80, 10);//bottom
    //END OF BREAD

    //ICING
    fill(255, 182, 193);
    rect(x_value, y_value+40, 10, 20);//left top icing
    rect(x_value, y_value+70, 10, 60);//left bottom icing
    rect(x_value+10, y_value+30, 10, 110);//2nd column icing
    rect(x_value+20, y_value+20, 10, 20);//1st part column 3 icing
    rect(x_value+20, y_value+50, 10, 30);//2nd part column 3 icing
    rect(x_value+20, y_value+90, 10, 40);//3rd part column 3 icing
    rect(x_value+20, y_value+140, 10, 10);//4th part column 3 icing
    rect(x_value+30, y_value+20, 10, 130);//column 4 icing
    rect(x_value+40, y_value+20, 10, 130);//column 5 icing
    rect(x_value+50, y_value+20, 10, 50);//1st part column 6 icing
    rect(x_value+50, y_value+80, 10, 30);//2nd part column 6 icing
    rect(x_value+50, y_value+120, 10, 30);//3rd part column 6 icing
    rect(x_value+60, y_value+20, 10, 130);//column 7 icing
    rect(x_value+70, y_value+20, 10, 120);//column 8 icing
    rect(x_value+80, y_value+20, 10, 10);//1st part column 9 icing
    rect(x_value+80, y_value+40, 10, 50);//2nd part column 9 icing
    rect(x_value+80, y_value+140, 10, 10);//3rd part column 9 icing
    rect(x_value+90, y_value+20, 10, 30);//column 10 icing
    rect(x_value+100, y_value+20, 20, 20);//columns 11 & 12 icing
    rect(x_value+120, y_value+20, 10, 30);//column 13 icing
    rect(x_value+130, y_value+20, 10, 20);//1st part column 14 icing
    rect(x_value+130, y_value+50, 10, 10);//2nd part column 14 icing
    rect(x_value+140, y_value+20, 10, 50);//column 15 icing
    rect(x_value+150, y_value+30, 10, 40);//column 16 icing
    rect(x_value+160, y_value+40, 10, 30);//column 17 icing

    //SPRINKLES(from left to right)

    fill(255, 20, 147);

    rect(x_value, y_value+60, 10, 10);
    rect(x_value+20, y_value+40, 10, 10);
    rect(x_value+20, y_value+80, 10, 10);
    rect(x_value+20, y_value+130, 10, 10);
    rect(x_value+50, y_value+70, 10, 10);
    rect(x_value+50, y_value+110, 10, 10);
    rect(x_value+70, y_value+140, 10, 10);
    rect(x_value+80, y_value+30, 10, 10);
    rect(x_value+130, y_value+40, 10, 10);

    //+++++++++++END POP-TART++++++++++++++++

    //+++++++++++BEGIN HEAD FILL+++++++++++++

    fill(105, 105, 105);

    rect(x_value+100, y_value+50, 20, 10);//top left ear
    rect(x_value+100, y_value+60, 30, 10);//middle left ear
    rect(x_value+100, y_value+70, 40, 10);//bottom left ear
    rect(x_value+100, y_value+80, 120, 10);//brow
    rect(x_value+90, y_value+90, 140, 10);//brow 2
    rect(x_value+200, y_value+50, 20, 10);//top right ear
    rect(x_value+190, y_value+60, 30, 10);//middle right ear
    rect(x_value+180, y_value+70, 40, 10);//bottom right ear
    rect(x_value+90, y_value+100, 30, 20);//left cheek
    rect(x_value+90, y_value+120, 10, 20);
    rect(x_value+100, y_value+140, 20, 10);
    rect(x_value+120, y_value+130, 10, 20);
    rect(x_value+110, y_value+150, 100, 10);//chin
    rect(x_value+120, y_value+120, 90, 10);//upper mouth

    rect(x_value+210, y_value+100, 20, 20);//right cheek
    rect(x_value+200, y_value+130, 10, 20);
    rect(x_value+210, y_value+140, 10, 10);
    rect(x_value+140, y_value+130, 20, 10);//above mouth left
    rect(x_value+170, y_value+130, 20, 10);//above mouth right

    //MOUTH

    fill(0);
    rect(x_value+130, y_value+130, 10, 10);
    rect(x_value+190, y_value+130, 10, 10);
    rect(x_value+160, y_value+130, 10, 10);
    rect(x_value+130, y_value+140, 70, 10);

    //BLUSH

    fill(255, 105, 180);
    rect(x_value+100, y_value+120, 20, 20);//left side
    rect(x_value+210, y_value+120, 20, 20);//right side

    //++++++++++EYES & MISC+++++++++++++

    fill(105, 105, 105);
    rect(x_value+140, y_value+100, 50, 10);
    rect(x_value+140, y_value+110, 30, 10);
    rect(x_value+180, y_value+110, 10, 10);

    //NOSE

    fill(0);
    rect(x_value+170, y_value+110, 10, 10);

    //LEFT EYE

    fill(0);
    rect(x_value+120, y_value+110, 10, 10);//iris
    rect(x_value+130, y_value+100, 10, 20);
    fill(255);
    rect(x_value+120, y_value+100, 10, 10);//pupil

    //RIGHT EYE

    fill(0);
    rect(x_value+190, y_value+110, 10, 10);//iris
    rect(x_value+200, y_value+100, 10, 20);
    fill(255);
    rect(x_value+190, y_value+100, 10, 10);//pupil

    //++++++++++++BEGIN EXTREMITIES+++++++++++++++

    //HIND LEGS

    fill(0);//leftmost leg outline

    rect(x_value-30, y_value+150, 10, 30);
    rect(x_value-20, y_value+180, 20, 10);
    rect(x_value, y_value+170, 10, 10);
    fill(105, 105, 105);//filling
    rect(x_value-20, y_value+150, 10, 30);
    rect(x_value-10, y_value+160, 10, 20);

    fill(0);//right most leg outline
    rect(x_value+30, y_value+160, 10, 20);
    rect(x_value+40, y_value+180, 20, 10);
    rect(x_value+60, y_value+160, 10, 30);
    //rect(x_value, y_value+150, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value+40, y_value+170, 20, 10);



    //FRONT LEGS
    fill(0);//right most leg outline
    rect(x_value+120, y_value+160, 10, 20);
    rect(x_value+130, y_value+180, 20, 10);
    rect(x_value+150, y_value+160, 10, 30);
    //rect(x_value+10, y_value+150, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value+130, y_value+170, 20, 10);

    fill(0);//right most leg outline
    rect(x_value+170, y_value+160, 10, 20);
    rect(x_value+180, y_value+180, 20, 10);
    rect(x_value+200, y_value+160, 10, 30);
    //rect(x_value, y_value+150, 10, 20);
    fill(105, 105, 105);//filling
    rect(x_value+180, y_value+170, 20, 10);


    //TAIL

    fill(0);//border for tail
    rect(x_value-30, y_value+80, 10, 10);
    rect(x_value-60, y_value+90, 40, 10);
    rect(x_value-80, y_value+100, 20, 10);
    rect(x_value-80, y_value+110, 10, 10);
    rect(x_value-70, y_value+120, 40, 10);
    rect(x_value-40, y_value+110, 10, 10);
    rect(x_value-30, y_value+110, 10, 10);

    fill(105, 105, 105);//filling for tail
    rect(x_value-70, y_value+110, 30, 10);
    rect(x_value-60, y_value+100, 40, 10);
  }
}


