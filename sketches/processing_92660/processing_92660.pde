
/*Nafis Sabir 
Professor Calli Higgins
Midterm 1st Draft*/
PFont myfont;

int dateY = 60;//date y location
int dateX = 20;//date x location
void setup() {
  size(660, 600);

  myfont = loadFont("Dialog-70.vlw");//temporary font for date
  textFont(myfont, 70);
}

void draw() {
  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  String today = String.valueOf(d);//string to display current day
  String thisyear = String.valueOf(y);//string to display current year

  if (m <= 12) {//if month is january to december
    randomSeed(d);
    background (random(0, 255), random (0, 255), random (0, 255));//background changes color depending on the date
    text(today, dateX, dateY*2.2);//show today's date for all months
    text(thisyear, dateX + 100, dateY*2.2);//show the current year for all months

    if (m == 1) {//if month is january
      fill(#66A3D2);//text color
      text("January", dateX, dateY);//write january
      for (int a=20; a < 20+(d*20); a=a+20) {//future place for image code
        //  image();
      }
    }

    if (m == 2) {//if month is february
      fill(#66A3D2);//text color
      text("Feburary", dateX, dateY);//write february
      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 3) {//if month is march
      fill(#00CC00);//color for text
      text("March", dateX, dateY);//write march
      for (int a=20; a < 20+(d*20); a=a+20) {
        //image();
      }
    }

    if (m == 4) {//if month is april
      fill(#00CC00);//color for text
      text("April", dateX, dateY);//write april
      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 5) {//if month is may
      fill(#00CC00);//color for text
      text("May", dateX, dateY);//write may
      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 6) {//if month is june
      fill(#F7FE00);//color for text
      text("June", dateX, dateY);//write june
      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 7) {//if month is july
      fill(#F7FE00);//color for text
      text("July", dateX, dateY);//write july
      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 8) {//if month is august
      fill(#F7FE00);//color for text
      text("August", dateX, dateY);//write august
      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 9) {//if month is september
      fill(#FF6A00);//color for text
      text("September", dateX, dateY);//write september

      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 10) {//if month is october
      fill(#FF6A00);//color for text
      text("October", dateX, dateY);//write october

      for (int a=20; a < 20+(d*20); a=a+20) {
        // image();
      }
    }

    if (m == 11) {//if month is november
      fill(#FF6A00);//color for text
      text("November", dateX, dateY);//write november
      for (int a=20; a < 20+(d*20); a=a+20) {
        //image();
      }
    }


    if (m == 12) {//if month is december
      //background(255);
      fill(#66A3D2);//color for text
      text("December", dateX, dateY);//write december
      for (int a=20; a < 20+(d*20); a=a+20) {
        //image();
      }
    }
  }
}



