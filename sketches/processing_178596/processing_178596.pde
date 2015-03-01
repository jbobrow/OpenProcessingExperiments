
//First of all, sorry if I have some misspellings, english is not my first language
//Assignment: Final project - Pieces of my life
/*
I tried to make an interactive photo album showing some of my own 
 photographies, each one of them has a deep meaning for me. I divided 
 them in four groups: Landscapes, Animals, Food and Other and they change
 using a letter from the keyboard and the cursor position in the X axis
 */

//Instructions
/*
My sketch uses a set of photographies, keyboard interaction and mouse interaction.
 You can use it just following the next steps:
 1.  Select the type of images you are interested in (l/L for landscapes, a/A for 
 animals, f/F for food or o/O for other).
 2.  The program will take your current mouse position in X axis and it will show 
 a related image, for changing or adding another image, just press the same letter 
 you previously selected and change your cursor position (e.g. if you want to see 
 animals, just press the A key, and each time you press the key (but if you previously
 changed the position of your cursor in the X axis, you will see a new image in the 
 program).
 3.  If you want to clear the screen, just press the Backspace or Delete key.
 4.  If you want to save a snapshot, just press the s/S key.
 Note: you can mix the different type photos just pressing different "permited" letters
 while moving the cursor.
 Enjoy!
 */

//Images creation
PImage ls1;
PImage ls2;
PImage ls3;
PImage ls4;
PImage ls5;
PImage a1;
PImage a2;
PImage a3;
PImage a4;
PImage a5;
PImage f1;
PImage f2;
PImage f3;
PImage f4;
PImage f5;
PImage o1;
PImage o2;
PImage o3;
PImage o4;
PImage o5;

//Variable for the cursor position in X axis
int begin=-1;

//setup  block
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(29, 86, 46);  //Establishing Background
  fill(29, 14, 97);

  //Writing the instructions
  textFont(createFont("Arial", 24, true), 24);    
  textAlign(CENTER);
  text("Pieces of my life", 300, 75);
  textFont(createFont("Arial", 16, true), 16);    
  textAlign(LEFT);
  text("I just wanna show you some of my photographies, every one has a deep meaning for me.", 110, 110);
  text("s/S: save a snapshot", 110, 135);
  text("l/L: shows some landscapes", 110, 160);
  text("a/A: shows some animals", 110, 185);
  text("f/F: shows some food", 110, 210);
  text("o/O: shows other unrelated pictures", 110, 235);
  text("DELETE/BACKSPACE: clear the sketch", 110, 260);
  text("Press Enter and move the mouse from left to right!", 110, 285);

  //Loading the images
  ls1 = loadImage("P1030527.jpg");
  ls2=loadImage("P1030158.JPG");
  ls3=loadImage("P1030488.JPG");
  ls4=loadImage("112_4949.JPG");
  ls5=loadImage("P1030640.JPG");
  a1=loadImage("P1050665.jpg");
  a2=loadImage("P1050080.JPG");
  a3=loadImage("P1030607.JPG");
  a4=loadImage("IMG_2384.JPG");
  a5=loadImage("IMG_1181.JPG");
  f1=loadImage("IMG_0324.JPG");
  f2=loadImage("IMG_1490.JPG");
  f3=loadImage("P1050523.JPG");
  f4=loadImage("P1060102.JPG");
  f5=loadImage("P1040576.JPG");
  o1=loadImage("IMG_0875.JPG");
  o2=loadImage("IMG_0696.JPG");
  o3=loadImage("IMG_1615.JPG");
  o4=loadImage("P1060200.JPG");
  o5=loadImage("P1050715.JPG");
}

void draw() {
  if (begin<mouseX) {
    pushMatrix();
    popMatrix();
  }
}

void keyPressed() {
  if (key==DELETE || key==BACKSPACE) {  //Clear the sketch
    background(29, 86, 46);
    begin=-1;
    textFont(createFont("Arial", 24, true), 24);    
    textAlign(CENTER);
    text("My own life", 300, 75);
    textFont(createFont("Arial", 16, true), 16);    
    textAlign(LEFT);
    text("I just wanna show you some of my photographies, every one has a deep meaning for me.", 110, 110);
    text("s/S: save a snapshot", 110, 135);
    text("l/L: shows some landscapes", 110, 160);
    text("a/A: shows some animals", 110, 185);
    text("f/F: shows some food", 110, 210);
    text("o/O: shows other unrelated pictures", 110, 235);
    text("DELETE/BACKSPACE: clear the sketch", 110, 260);
    text("Press Enter and move the mouse from left to right!", 110, 285);
  }
  if (key=='s' || key=='S') saveFrame("screenshot.png");  //Saving a snapshot
  if (key=='l' || key=='L') {  //Showing landscapes
    if (mouseX<160) {
      image(ls1, 0, 0, 400, 300);
    } else if (mouseX<320) {
      image(ls2, 0, 300, 400, 300);
    } else if (mouseX<480) {
      image(ls3, 400, 0, 400, 300);
    } else if (mouseX<640) {
      image(ls4, 400, 300, 400, 300);
    } else {
      image(ls5, 200, 150, 400, 300);
    }
  }
  if (key=='a' || key=='A') {  //Showing animals
    if (mouseX<160) {
      image(a1, 0, 0, 800, 600);
    } else if (mouseX<320) {
      image(a2, 0, 0, 800, 600);
    } else if (mouseX<480) {
      image(a3, 0, 0, 800, 600);
    } else if (mouseX<640) {
      image(a4, 0, 0, 800, 600);
    } else {
      image(a5, 0, 0, 800, 600);
    }
  }
  if (key=='f' || key=='F') {  //Showing food
    if (mouseX<160) {
      image(f1, 0, 0, 800, 120);
    } else if (mouseX<320) {
      image(f2, 0, 120, 800, 120);
    } else if (mouseX<480) {
      image(f3, 0, 240, 800, 120);
    } else if (mouseX<640) {
      image(f4, 0, 360, 800, 120);
    } else {
      image(f5, 0, 480, 800, 120);
    }
  }
  if (key=='o' || key=='O') {  //Showing other non-related photos
    if (mouseX<160) {
      image(o1, 0, 0, 160, 600);
    } else if (mouseX<320) {
      image(o2, 160, 0, 160, 600);
    } else if (mouseX<480) {
      image(o3, 320, 0, 160, 600);
    } else if (mouseX<640) {
      image(o4, 480, 0, 160, 600);
    } else {
      image(o5, 640, 0, 160, 600);
    }
  }
}


