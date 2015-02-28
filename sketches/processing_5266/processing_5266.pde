
/*Trenton Szewczyk
Exercise Three
DMA 28

Sorry for the lack of interactions on the part of the robot(s). It's a little rushed since there was 
another time consuming project in my other studio class. 

You can, however click the post-apocalyptic toast bot and drag him around
which mysteriously corresponds with satan bot's movements...*/



boolean vector = false;
boolean over = false;
boolean clicked = false;
float x, y, offx, offy;
float din = 60;
PImage shapebg, imbg, lleg, rleg, toast, tguts, imeye;
PShape sbod, tooth, atooth, seye, spupil;
PFont font;

void setup() {
  size(320, 480);
  //shape set of variables
  shapebg = loadImage("satanbg.jpg");
  sbod = loadShape("body.svg");
  tooth = loadShape("tooth.svg");
  atooth = loadShape("active tooth.svg");
  seye = loadShape("eye.svg");
  spupil = loadShape("pupil.svg");
  
  //image set of variables
  imbg = loadImage("mmax.jpg");
  lleg = loadImage("lleg.png");
  rleg = loadImage("rleg.png");
  toast = loadImage("toast.png");
  tguts = loadImage("toastguts.png");
  imeye = loadImage("imeye.png");
  
  //floats
  x = width/6;
  y = height/1.7;
  
  //font
  font = loadFont("font.vlw");
}

void draw() {
    if (clicked && over) {
    x = mouseX - offx;
    y = mouseY - offy;
  }
  if (vector == true) {
    image(shapebg, 0, 0, 340, 480);
    image (toast, x+60, y+45, din, din);
    shape(sbod, x, y, 200, 200 );
    shape (seye, x+80, y+70, 60, 40);
//  Worry about getting     eye to move after everything is drawn
//    float pupmovx = constrain (x+75, 55, 205);
//    float pupmovy = constrain (y
    shape (spupil,x+80, y+60, 70, 70);
    shape (tooth, x+60, y+125, 17, 17);
    shape (tooth, x+75, y+127, 17, 17);
    shape (tooth, x+90, y+129, 17, 17);
    shape (tooth, x+105, y+131, 17, 17);
    fill (0);
    textFont (font);
    textSize (20);
    text ("Ahses to ashes,", 0, 35);
    text("bread to toast...", 170, 80);
  } else {
    image (imbg, 0, 0, 320, 480);
    image (toast, x+10, y-30, din, din);
    image (lleg, x-40, y+100);
    image (rleg, x+50, y+110);
    image (tguts, x-30, y, 120, 120);
    fill (0);
    textFont (font);
    textSize (17);
    text ("It's a nice morning for the", 0, 20);
    text("toastocalypse.", 185, 40);
//    textSize(40);
    fill (255, 0, 0);
    text("Mad Max: Breakfast Tiem Adventures", 10, 240);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (vector == true) {
      vector = false; 
    } else {
      vector = true; 
    }
    //vector = !vector;  // This line is the same as the five above
  }
}

void mousePressed() {
  if (mouseX > x && mouseX < x+din && mouseY > y && mouseY < y+din) {
    over = true;
    offx = mouseX - x;
    offy = mouseY - y;
  } else {
    over = false;
  }
  clicked = true;
}
void mouseReleased () {
  clicked = false;
}


