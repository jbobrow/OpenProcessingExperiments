
PImage[] images = new PImage[6];
MyButton[] buttons= new MyButton[6];

void setup() {
  size(800, 200);
  for (int i = 0; i< images.length; i++) {
    images [i] = loadImage("photo" + i + ".png");
  }
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new MyButton(i*125+25, images[i]);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].buttonclick();
  }
}

class MyButton {
  int buttonx;
  int buttony;
  int buttonw;
  int buttonh;
  PImage buttonimages;
  boolean on;

  MyButton(int tempx, PImage tempimage) {
    buttonx= tempx;
    buttony= 50;
    buttonw=100;
    buttonh=100;
    buttonimages= tempimage;
  }


  void display() {
    if (on) {
      /*fill(255, 0, 0); 
       rect(buttonx, 50, 100, 100);*/
      image(buttonimages, buttonx, 50, 100, 100);
    }
    else {
      fill(0);
      rect(buttonx, 50, 100, 100);
    }
  }
  void buttonclick() {
    if (mouseX > buttonx && mouseX < buttonx+buttonw && mouseY > buttony && mouseY < buttony+buttonh) {
      on = !on;
    }
  }
}


//new Button(images[i], x, y, w, h);//



