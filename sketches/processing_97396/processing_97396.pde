
Button1 button1;
Button2 button2;
Button3 button3;
Button4 button4;
Button5 button5;
Button6 button6;
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
PImage pic5;
PImage pic6;

void setup() {
  size(950, 200);
  pic1= loadImage("pic1.jpg");
  pic2= loadImage("pic2.jpg");
  pic3= loadImage("pic3.jpg");
  pic4= loadImage("pic4.jpg");
  pic5= loadImage("pic5.jpg");
  pic6= loadImage("pic6.jpg");
  button1 = new Button1();
  button2 = new Button2();
  button3 = new Button3();
  button4 = new Button4();
  button5 = new Button5();
  button6 = new Button6();
}

void draw() {
  background(255);
  button1.display();
  button2.display();
  button3.display();
  button4.display();
  button5.display();
  button6.display();
}

class Button1 {
  PImage pic1;
  boolean button1;
  int x;
  int y;
  int w;
  int h;

  Button1() {
    pic1=loadImage("pic1.jpg");
    button1=false;
    x=50;
    y=50;
    w=100;
    h=100;
  }

  void display() {
    if (button1) {
      image(pic1, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      button1=!button1;
    }
  }
}

class Button2 {
  PImage pic2;
  boolean button2;
  int x;
  int y;
  int w;
  int h;

  Button2() {
    pic2=loadImage("pic2.jpg");
    button2=false;
    x=200;
    y=50;
    w=100;
    h=100;
  }

  void display() {
    if (button2) {
      image(pic2, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      button2=!button2;
    }
  }
}

class Button3 {
  PImage pic3;
  boolean button3;
  int x;
  int y;
  int w;
  int h;

  Button3() {
    pic3=loadImage("pic3.jpg");
    button3=false;
    x=350;
    y=50;
    w=100;
    h=100;
  }

  void display() {
    if (button3) {
      image(pic3, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      button3=!button3;
    }
  }
}

class Button4 {
  PImage pic4;
  boolean button4;
  int x;
  int y;
  int w;
  int h;

  Button4() {
    pic4=loadImage("pic4.jpg");
    button4=false;
    x=500;
    y=50;
    w=100;
    h=100;
  }

  void display() {
    if (button4) {
      image(pic4, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      button4=!button4;
    }
  }
}

class Button5 {
  PImage pic5;
  boolean button5;
  int x;
  int y;
  int w;
  int h;

  Button5() {
    pic5=loadImage("pic5.jpg");
    button5=false;
    x=650;
    y=50;
    w=100;
    h=100;
  }

  void display() {
    if (button5) {
      image(pic5, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      button5=!button5;
    }
  }
}

class Button6 {
  PImage pic6;
  boolean button6;
  int x;
  int y;
  int w;
  int h;

  Button6() {
    pic6=loadImage("pic6.jpg");
    button6=false;
    x=800;
    y=50;
    w=100;
    h=100;
  }

  void display() {
    if (button6) {
      image(pic6, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
      button6=!button6;
    }
  }
}



