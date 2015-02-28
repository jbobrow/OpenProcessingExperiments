
// Georgina Yeboah
//PS2-5
//My bear is setup using classes. the button function however 
//is not working for some reason but This is too only show
//how to organize funtions with class so I hope you get the idea

Bear myBear;
//--------------------------------------------------------------
Grass myGrass;
int x = 0;
int y = 200;
int width_1 = 300;
int height_1 = 300;
//---------------------------------------------------------------
Button myButton; 
int btn_x = 260;
int btn_y= 10;
int btn_w= 40;
int btn_h= 250;
boolean btn_state = true;

void setup () {
  size (300, 300);
  smooth ();
  myBear = new Bear();
  myGrass = new Grass();
  myButton = new Button();
}

void draw () {
  myButton.operate();
  myButton.display();
  myGrass.display();
  myBear.display();
}
//---------------------------------------------------------------

class Bear { 
 
  void display() {
    // bear's left ear
  fill (116, 63, 6);
  ellipse ( 75, 75, 75, 75);
  fill (255, 255, 196);
  ellipse (75, 75, 30, 30);


  // bear's right ear
  fill (116, 63, 6);
  ellipse (205, 75, 75, 75);
  fill (255, 255, 196);
  ellipse (205, 75, 30, 30);


  //bear's arms
  fill (116, 63, 6);
  ellipse (75, 200, 45, 45);
  fill (255, 255, 196);
  ellipse (75, 200, 20, 20);
  fill (116, 63, 6);
  ellipse (205, 200, 45, 45);
  fill (255, 255, 196);
  ellipse (205, 200, 20, 20);

  // bear's feet
  fill (116, 63, 6);
  ellipse (95, 280, 40, 30);
  ellipse (183, 280, 40, 30);


  //bears body
  fill (116, 63, 6); 
  ellipse (140, 220, 140, 130);
  fill (255, 255, 196);
  ellipse (140, 220, 110, 100);


  //bear's head
  fill (116, 63, 6);
  ellipse (140, 120, 150, 150);

  // bear's eyes
  fill (5, 3, 0);
  ellipse (100, 110, 25, 25);
  ellipse (180, 110, 25, 25);

  // bear's shine
  fill (255, 251, 247);
  ellipse (106, 110, 10, 10);
  ellipse (186, 110, 10, 10);

  //bears face
  fill (255, 255, 196);
  ellipse (140, 160, 55, 45);
  fill (5, 3, 0);
  ellipse (140, 160, 20, 10);
  fill (255, 255, 196);
}
    
}
//----------------------------------------------------------------
class Grass {
  color g;
  int x;
  int y;
  int width_1;
  int height_1;

  Grass() {
    g = color(51, 222, 40);
    x = 0;
    y = 200;
    width_1 = 300;
    height_1 = 300;
  }

  void display() {
    fill (g);
    rect (x, y, width_1, height_1);
  }
}
//---------------------------------------------------------------
class Button {
  color w;
  int btn_x;
  int btn_y;
  int btn_W;
  int btn_h;
  boolean btn_state;

  Button() {
    w = color(255);
    btn_x = 260;
    btn_y = 10;
    btn_w = 40;
    btn_h = 250;
    btn_state = true;
  }
  void operate() {
    if (btn_state == true) {
      background (146, 247, 250);
    }
    else {
      loadFont ("Aharoni-Bold-48.vlw");
      text ("TOO CUTE", 125, 30);
      fill (247, 45, 221);
    }
  }
  void mousePressed() {
    if (mouseX > btn_x && mouseX < btn_x + btn_w &&
      mouseY > btn_y && mouseY < btn_y + btn_h) {
      if (btn_state == false) {
        btn_state = true;
      }
      else {
        btn_state = false;
      }
    }
  }
  //------------------------------------------------------------- 
  void display () {
    float s = 100;
    while (s > 20) {
      float c = map(s, 450, 10, 100, 0);
      colorMode(RGB);
      s -= 20;
      fill (mouseX, mouseY, 50, 50);
      ellipse(mouseX, mouseY, 35, 35);
      smooth ();
      noStroke ();
    }
    rect(btn_x, btn_y, btn_w, btn_h);
    fill (w);
  }
}




//----------------------------------------------------------------


