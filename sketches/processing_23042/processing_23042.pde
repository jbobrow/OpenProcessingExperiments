
Thing thing1;
Thing thing2;
Thing thing3;
Thing thing4;
Thing thing5;
Thing thing6;
Thing thing7;
Thing thing8;
Thing thing14;

int tr = 0;

void setup () {
  size (400, 400);
  background (50,189,250);

  thing1 = new Thing (70, 70, 150, 5,25);
  thing2 = new Thing (140, 140, 130, 3,200);
  thing3 = new Thing (210, 210, 100, 7,75);
  thing4 = new Thing (320, 320, 70, 5,100);
  thing14 = new Thing (370, 370, 70, 7, 125);
  thing5 = new Thing (300, 300, 120,5, 150);
  thing6 = new Thing (50, 200, 120,8,75);
  thing7 = new Thing (250, 200, 120,6,25);
  thing8 = new Thing (320, 200, 120,3,225);

  while (tr < 100) {

    tr++;
  }
}

void draw () {


  thing1.move();
  thing2.move();
  thing3.movexd();
  thing4.move();
  thing5.movexd();
  thing6.movexd();
  thing7.move();
  thing8.movexd();
  thing14.move();
}

//name the class
class Thing {

  //date (variables)

  float xpos;
  float ypos;
  float radius;
  float speed;
  int colorx;

  //constructor
  Thing (float tempX, float tempY, float tempRadius, float tempSpeed, int tempColorx) {
    xpos = tempX;
    ypos = tempY;
    radius = tempRadius;
    speed = tempSpeed;
    colorx = tempColorx;
  }

  //methods and functions



  void move () {
    ypos =ypos+speed;
    if ((ypos > height+240) || (ypos<-240)) {
      speed *= -1;
    }


    fill (255, colorx,random(126)-colorx,98 );

    ellipse (xpos, ypos, radius, radius);
  }

  void movexd () {
    xpos = xpos+speed;
    if ((xpos > width+240) || (xpos < -240)) {
      speed *= -1;
    }

    fill (255, colorx, random(126)-colorx,98);

    ellipse (xpos, ypos, radius, radius);
  }
}

                
