

//arrays of pictures
PImage [] pics = new PImage[6];
PImage [] pics1 = new PImage[6];

//Place my arrays using my class
Button [] buttons = new Button [6];
Button [] buttons1 = new Button [6];

void setup() {
  
  for (int i = 0; i < pics.length; i = i +1) {
    pics[i] = loadImage("photo" + i + ".jpg");
  }
  
   for (int i = 0; i < pics1.length; i = i +1) {
    pics1[i] = loadImage("photos" + i + ".jpg");
  }

  //window size
  size (900, 300);
  
  //set up my arrays  
  for (int i = 0; i < buttons.length; i = i +1) {
    buttons[i] = new Button(pics[i], i*125+25, 25, 100, 100);
  }
  for (int i = 0; i < buttons1.length; i = i +1) {
    buttons1[i] = new Button(pics1[i], i*125+25, 150, 100, 100);
  }
}

void draw() {
  background (255);


  for (int i = 0; i < buttons.length; i = i +1) {
    buttons[i].display();
  }
  for (int i = 0; i < buttons1.length; i = i +1) {
    buttons1[i].display();
  }
}


void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].click();
  }
  for (int i = 0; i < buttons1.length; i++) {
    buttons1[i].click();
  }
}

class Button {
  // Data Variables 
  PImage picture;
  int x;
  int y;
  int w;
  int h;
  boolean on;

  //Initianalize data variables
  Button(PImage tempPicture, int tempX, int tempY, int tempW, int tempH) {

    picture = tempPicture;
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  }

  //create functions to use in this class 
  void display() {
    if (on) {
      image(picture, x, y, w, h);
    }
    else {
      fill(0);
      rect(x, y, w, h);
    }
  }

  void click() {

    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      on =!on;
      println(on);
    }
  }
}




