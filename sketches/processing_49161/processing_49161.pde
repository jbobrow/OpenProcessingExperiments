
//array named myBouncingArray for 100 BouncingButtons
boolean clicked;



BouncingButton[] myBouncingArray = new BouncingButton[30];

void setup () {

  size (900, 600);
  smooth();


  for (int i =0; i<myBouncingArray.length; i++) {

    myBouncingArray[i]= new BouncingButton (100, 100, random (10, 70), random (10, 70));
  }
}

void draw () {
  background (191);
  for (int i =0; i<myBouncingArray.length; i++) {
    myBouncingArray[i].collisionBouncingButton();
    myBouncingArray[i].movingBouncingButton();
    myBouncingArray[i].drawBouncingButton();
  }
}

void mousePressed () {

  for (int i=0; i<myBouncingArray.length; i++) {

    myBouncingArray[i].checkMousePress ();
  }
}




class BouncingButton {

  float x;
  float y;
  float speedX;
  float speedY;

  float sizeX;
  float sizeY;




  BouncingButton (float xPos, float yPos, float xSize, float ySize) {

    x=xPos;
    y=yPos;
    sizeX=xSize;
    sizeY=ySize;
    color c;

    speedX= random (-10, 10);
    speedY= random (-10, 10);
  }

  //DONE
  void movingBouncingButton () {

    x += speedX;
    y += speedY;
  }
  //DONE
  void collisionBouncingButton () {

    if ( (x < (0) ) || (x > width - sizeX ) ) {

      speedX = -speedX;
    }

    if ( (y < (0) ) || (y > height - sizeY ) ) {

      speedY = -speedY;
    }
  }

  void drawBouncingButton () {
rect (x, y, sizeX, sizeY);
    if (clicked) {

      fill (0);
    }
    else { 
      fill (255);
    }
    
  }

  void checkMousePress() {
    if ((mouseX > x ) && (mouseX< x + sizeX)&& (mouseY > y) && (mouseY < y + sizeY)) {

      clicked = !clicked;
    }
  }
}







