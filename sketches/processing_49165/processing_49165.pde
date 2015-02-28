
//array named myBouncingArray for 100 BouncingButtons

BouncingButton[] myBouncingArray = new BouncingButton[2];

void setup () {

  size (900, 600);
  smooth();
  ellipseMode(CORNER);


  for (int i =0; i<myBouncingArray.length; i++) {

    myBouncingArray[i]= new BouncingButton(100, 100, random (100, 170), random (100, 170));
  }
}

void draw () {
  background (191);
  for (int i =0; i<myBouncingArray.length; i++) {
    myBouncingArray[i].drawBouncingButton();
    myBouncingArray[i].collisionBouncingButton();
    myBouncingArray[i].movingBouncingButton();
   
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
    boolean clicked;



  BouncingButton (float xPos, float yPos, float xSize, float ySize) {

    x=xPos;
    y=yPos;
    sizeX=xSize;
    sizeY=ySize;
    color c;
  

    speedX= random (-2, 2);
    speedY= random (-2, 2);
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

    if (clicked) {

      fill (0);
      rect (x, y, sizeX, sizeY);
    }
    else { 
      fill (255);
    }
    ellipse (x, y, sizeX, sizeY);
    
  }

  void checkMousePress() {
    if ((mouseX > x ) && (mouseX< x + sizeX)&& (mouseY > y) && (mouseY < y + sizeY)) {

      clicked = !clicked;
    }
  }
}







