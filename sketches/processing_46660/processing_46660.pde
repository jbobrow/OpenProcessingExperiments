
//fields
class Button {
  int x, y;
  int size;

  boolean over=false;
  boolean pressed=false;
  PImage btnimg;
  PImage btnimginverse;
  boolean active;



  //constructor

  Button (int xp, int yp, int s, String img, boolean on) {
    x=xp;
    y=yp;
    size=s;
    active=on;

    btnimg = loadImage(img);
    btnimginverse = loadImage(img);
    btnimginverse.filter(INVERT);
  }
  //methods
  void update() { 
    if ((mouseX>x)&&(mouseX<= x+size)&&
      (mouseY>=y) &&(mouseY<= y+size)) {
      over=true;
    }
    else {
      over=false;
    }
  }
  boolean press() { 
    if (over==true) {
      pressed=true;
      return true;
    } 
    else {
      return false;
    }
  }


  void release() {
    pressed = false;
  }


  void display() {
    //if pressed
    if (pressed==true) {
   


      image(btnimginverse, x, y, size, size);
      noTint();
    }//mouseover
    else if (over==true || active == true) {

      image(btnimginverse, x, y, size, size);
    } 
    else {//rest

      image(btnimg, x, y, size, size);
    }
  }
}


