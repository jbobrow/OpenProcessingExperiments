
//ASSIGNMENT AC21010.4
//Educational Game
//Group 4
//"Behind The Blocks"

//the font, images and background images used for each level of the game
PFont font;
PImage dog;
PImage arm;
PImage bird;
PImage tree;
PImage igloo;
PImage clown;
PImage hammer;
PImage title;
PImage enterkey;
//the list of variables used for the game
int level = 0;
//the rectangles that are used to cover the images
Rec rec1, rec2, rec3, rec4, rec5;
Particle[] z1 = new Particle[900];
int xPos = 25;
int yPos = 575;
int boxx = 500;
int boxy = 600;
//this is for the opacity of the rectangles used to cover the images
int o1 = 100;
int o2 = 100;
int o3 = 100;
int o4 = 100;
int o5 = 100;
//a standard y position for the letters displayed at the bottom of the screen
int fontY = 560;
//a standard font size provides ease of editing
int fontsize = 38;
boolean a = false;
boolean b = false;
boolean c = false;
boolean d = false;
boolean e = false;
boolean g = false;
boolean h = false;
boolean i = false;
boolean l = false;
boolean m = false;
boolean n = false;
boolean o = false;
boolean r = false;
boolean t = false;
boolean w = false;

void setup() {
  size (1000, 600);
  rectangles();  
  for (int i1=0; i1 < z1.length; i1++) {
    z1[i1] = new Particle(boxx, boxy);
  }
  //to load the images and font into the program
  font = loadFont("TimKid-80.vlw");
  dog = loadImage("dogtitle.png");
  arm = loadImage("armtitle.png");
  bird = loadImage("birdtitle.png");
  tree = loadImage("treetitle.png");
  igloo = loadImage("iglootitle.png");
  clown = loadImage("clowntitle.png");
  hammer = loadImage("hammertitle.png");
  title = loadImage("title.png");
  enterkey = loadImage("enterkey.png");
  textFont(font);
}

void draw() {
  //this is to progress through each level, starting at level 0
  //pressing 2 can return to the main menu
  if (keyPressed == true && key == '2') {
    level = 0;
  }
  //stating the name of each stage in relation to the picture displayed on each level
  if (level == 0)
    startScreen();
  if (level == 1)
    dog();
  if (level == 2)
    arm();
  if (level == 3)
    bird();
  if (level == 4)
    tree();
  if (level == 5)
    igloo();
  if (level == 6)
    clown();
  if (level == 7)
    hammer();
}

class Rec {
  //the class to make the rectangles that cover the images
  int xPos = 20;
  int yPos = 50;
  int w = 0;
  int h = 0;
  public Rec(int xPos, int yPos, int w, int h) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.w = w;
    this.h = h;
  }
  
  void rectangle(int a) {
    noStroke();
    //the rectangles will flash randomly generated colors
    fill(random(255), random(255), random(255), a+140);
    rect(xPos, yPos, w, h);
  }
}

void rectangles() {
  //the position of each rectangle on screen
  //this will produce a tile pattern to allow parts of the image to be visible
  rec1 = new Rec(250, 113, 166, 125);
  rec2 = new Rec(416, 238, 166, 125);
  rec3 = new Rec(582, 363, 166, 125);
  rec4 = new Rec(250, 363, 166, 125);
  rec5 = new Rec(582, 113, 166, 125);
}

void dog() {
  //the first level and image
  //when all correct letters have been pressed
  if (d == true && o == true && g == true) {
    //the level image that is displayed
    image(dog, 0, 0);
    fill(255);
    rect(300, 500, 400, 80);
    fill(221, 18, 123);
    textSize(70);
    text("D O G", 400, fontY);
    fill(255);
    textSize(fontsize);
    //this message will be displayed when the level is complete
    text("Well done! Press ENTER to continue", 200, 150);
    //an image of an enter key will be displayed to clearly show the user what button to press
    image(enterkey, 850, 250);
    //enter needs to be pressed to move on to the next level
    if (key == ENTER) {
      d = false;
      o = false;
      g = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      level = 2;
    }
  }
  else {
    image(dog, 0, 0);
    //this level has three rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(221, 18, 123);
      //this is the hint to be displayed
      text("HINT: A household pet that barks!", 220, 160);
    }
    else {
      image(dog, 0, 0);
      rec1.rectangle(o1);
      rec2.rectangle(o2);
      rec3.rectangle(o3);
    }
    //these are the correct letters to be typed for the level
    if (key == 'd') {
      d = true;
    }
    if (key == 'o') {
      o = true;
    }
    if (key == 'g') {
      g = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (g == true) {
      o3 = o3 - 10;
      fill(0);
      text("G", 560, fontY);
    }
    if (o == true) {
      o2 = o2 - 10;
      fill(0);
      text("O", 485, fontY);
    }
    if (d == true) {
      o1 = o1 - 10;
      fill(0);
      text("D", 410, fontY);
    }
  }
}

void arm() {
  //the second level and image
  //when all correct letters have been pressed
  if (a == true && r == true && m == true) {
    //the level image that is displayed
    image(arm, 0, 0);
    fill(255);
    rect(300, 500, 400, 80);
    fill(0, 147, 221);
    textSize(70);
    text("A R M", 400, fontY);
    fill(255);
    textSize(fontsize);
    //this message will be displayed when the level is complete
    text("Well done! Press ENTER to continue", 200, 150);
    //an image of an enter key will be displayed to clearly show the user what button to press
    image(enterkey, 850, 250);
    //enter needs to be pressed to move on to the next level
    if (key == ENTER) {
      a = false;
      r = false;
      m = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      level = 3;
    }
  }
  else {
    image(arm, 0, 0);
    //this level has three rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(0, 147, 221);
      //this is the hint to be displayed
      text("HINT: A part of the human body!", 240, 160);
    }
    else {
      image(arm, 0, 0);
      rec1.rectangle(o1);
      rec2.rectangle(o2);
      rec3.rectangle(o3);
    }
    //these are the correct letters to be typed for the level
    if (key == 'a') {
      a = true;
    }
    if (key == 'r') {
      r = true;
    }
    if (key == 'm') {
      m = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (a == true){
      o1 = o1 - 10;
      fill(0);
      text("A", 410, fontY);
    }
    if (r == true) {
      o2 = o2 - 10;
      fill(0);
      text("R", 485, fontY);
    }
    if (m == true) {
      o3 = o3 - 10;
      fill(0);
      text("M", 560, fontY);
    }
  }
}

void bird() {
  //the third level and image
  //when all correct letters have been pressed
  if (b == true && i == true && r == true && d == true) {
    //the level image that is displayed
    image(bird, 0, 0);
    fill(255);
    rect(300, 500, 400, 80);
    fill(133, 194, 38);
    textSize(70);
    text("B I R D", 390, fontY);
    fill(255);
    textSize(fontsize);
    //this message will be displayed when the level is complete
    text("Well done! Press ENTER to continue", 200, 150);
    //an image of an enter key will be displayed to clearly show the user what button to press
    image(enterkey, 850, 250);
    //enter needs to be pressed to move on to the next level
    if (key == ENTER) {
      b = false;
      i = false;
      r = false;
      d = false; 
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      level = 4;
    }
  }
  else {
    image(bird, 0, 0);
    //this level has four rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(133, 194, 38);
      //this is the hint to be displayed
      text("HINT: This animal has wings, feathers and a beak! ", 115, 160);
    }
    //these are the correct letters to be typed for the level
    if (key == 'b') {
      b = true;
    }
    if (key == 'i') {
      i = true;
    }
    if (key == 'r') {
      r = true;
    }
    if (key == 'd') {
      d = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (d == true) {
      o4 = o4 - 10;
      fill(0);
      text("D", 597.5, fontY);
    }
    if (r == true) {
      o3 = o3 - 10;
      fill(0);
      text("R", 522.5, fontY);
    }
    if (b == true) {
      o1 = o1 - 10;
      fill(0);
      text("B", 372.5, fontY);
    }
    if (i == true) {
      o2 = o2 - 10;
      fill(0);
      text("I", 447.5, fontY);
    }
  }
}

void tree () {
  //the fourth level and image
  //when all correct letters have been pressed
  if (t == true && r == true && e == true) {
    //the level image that is displayed
    image(tree, 0, 0);
    fill(255);
    rect(300, 500, 400, 80);
    fill(207, 36, 28);
    textSize(70);
    text("T R E E", 390, fontY);
    fill(255);
    textSize(fontsize);
    //this message will be displayed when the level is complete
    text("Well done! Press ENTER to continue", 200, 150);
    //an image of an enter key will be displayed to clearly show the user what button to press
    image(enterkey, 850, 250);
    //enter needs to be pressed to move on to the next level
    if (key == ENTER) {
      t = false;
      r = false;
      e = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      level = 5;
    }
  }
  else {
    image(tree, 0, 0);
    //this level has three rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(207, 36, 28);
      //this is the hint to be displayed
      text("HINT: A piece of nature with branches and leaves", 105, 160);
    }
    //these are the correct letters to be typed for the level
    if (key == 't') {
      t = true;
    }
    if (key == 'r') {
      r = true;
    }
    if (key == 'e') {
      e = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (t == true) {
      o1 = o1 - 10;
      fill(0);
      text("T", 372.5, fontY);
    }
    if (r == true) {
      o2 = o2 - 10;
      fill(0);
      text("R", 447.5, fontY);
    }
    if (e == true) {
      o3 = o3 - 10;
      fill(0);
      text("E", 522.5, fontY);
      text("E", 597.5, fontY);
    }
  }
}

void igloo () {
  //the fifth level and image
  //when all correct letters have been pressed
  if (i == true && g == true && l == true && o == true) {
    //the level image that is displayed
    image(igloo, 0, 0);
    fill(255);
    rect(300, 500, 400, 80);
    fill(186, 179, 213);
    textSize(70);
    text("I G L O O", 350, fontY);
    fill(255);
    textSize(fontsize);
    //this message will be displayed when the level is complete
    text("Well done! Press ENTER to continue", 200, 150);
    //an image of an enter key will be displayed to clearly show the user what button to press
    image(enterkey, 850, 250);
    if (key == ENTER) {
      i = false;
      g = false;
      l = false;
      o = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      level = 6;
    }
  }
  else {
    image(igloo, 0, 0);
    //this level has four rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(186, 179, 213);
      //this is the hint to be displayed
      text("HINT: This is an eskimos house!", 240, 160);
    }
    //these are the correct letters to be typed for the level
    if (key == 'i') {
      i = true;
    }
    if (key == 'g') {
      g = true;
    }
     if (key == 'l') {
      l = true;
    }
    if (key == 'o') {
      o = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (i == true) {
      o1 = o1 - 10;
      fill(0);
      text("I", 335, fontY);
    }
    if (g == true) {
      o2 = o2 - 10;
      fill(0);
      text("G", 410, fontY);
    }
    if (l == true) {
      o3 = o3 - 10;
      fill(0);
      text("L", 485, fontY);
    }
    if (o == true) {
      o4 = o4 - 10;
      fill(0);
      text("O", 560, fontY);
      text("O", 635, fontY);
    }
  }
}

void clown () {
  //the sixth level and image
  //when all correct letters have been pressed
  if (c == true && l == true && o == true && w == true && n == true) {
    //the level image that is displayed
    image(clown, 0, 0);
    fill(255);
    rect(300, 500, 400, 80);
    fill(241, 154, 189);
    textSize(70);
    text("C L O W N", 330, fontY);
    fill(255);
    textSize(fontsize);
    //this message will be displayed when the level is complete
    text("Well done! Press SPACE to continue", 200, 150);
    //an image of an enter key will be displayed to clearly show the user what button to press
    image(enterkey, 850, 250);
    //enter needs to be pressed to move on to the next level
    if (key == ENTER) {
      c = false;
      l = false;
      o = false;
      w = false;
      n = false;
      o1 = 100;
      o2 = 100;
      o3 = 100;
      o4 = 100;
      o5 = 100;
      level = 7;
    }
  }
  else {
    image(clown, 0, 0);
    //this level has five rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(241, 154, 189);
      //this is the hint to be displayed
      text("HINT: A key member of the circus!", 220, 160);
    }
    //these are the correct letters to be typed for the level
    if (key == 'c') {
      c = true;
    }
    if (key == 'l') {
      l = true;
    }
    if (key == 'o') {
      o = true;
    }
    if (key == 'w') {
      w = true;
    }
    if (key == 'n') {
      n = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (c == true) {
      o1 = o1 - 10;
      fill(0);
      text("C", 335, fontY);
    }
    if (l == true) {
      o2 = o2 - 10;
      fill(0);
      text("L", 410, fontY);
    }
    if (o == true) {
      o3 = o3 - 10;
      fill(0);
      text("O", 485, fontY);
    }
    if (w == true) {
      o4 = o4 - 10;
      fill(0);
      text("W", 560, fontY);
    }
    if (n == true) {
      o5 = o5 - 10;
      fill(0);
      text("N", 635, fontY);
    }
  }
}

void hammer() {
  //the seventh level and image
  //when all correct letters have been pressed
  if (h == true && a == true && m == true && e == true && r == true) {
    //the level image that is displayed
    image(hammer, 0, 0);
    //a firework effect is displayed once the game is completed
    firework();
    fill(255);
    rect(150, 200, 700, 200);
    rect(300, 500, 400, 80);
    fill(249, 195, 1);
    textSize(70);
    text("H A M M E R", 320, fontY);
    //the font will flash randomly generated colors
    fill(random(255), random(255), random(255));
    //this message will be displayed when the game is complete
    text("Well Done!", 330, 280);
    fill(0);
    textSize(fontsize);
    text("You have completed Behind The Blocks!", 180, 350);
  }
  else {
    image(hammer, 0, 0);
    //this level has five rectangles in front of the image
    rec1.rectangle(o1);
    rec2.rectangle(o2);
    rec3.rectangle(o3);
    rec4.rectangle(o4);
    rec5.rectangle(o5);
    //a hint will be displayed when key 1 is pressed
    if (key == '1') {
      fill(255);
      rect(100, 113, 800, 70);
      fill(249, 195, 1);
      //this is the hint to be displayed
      text("HINT: You would find this in a toolbox", 190, 160);
    }
    //these are the correct letters to be typed for the level
    if (key == 'h') {
      h = true;
    }
    if (key == 'a') {
      a = true;
    }
    if (key == 'm') {
      m = true;
    }
    if (key == 'e') {
      e = true;
    }
    if (key == 'r') {
      r = true;
    }
    //as each relevant letter is pressed, a rectangle will be removed and the letter displayed
    if (h == true) {
      o1 = o1 - 10;
      fill(0);
      text("H", 297.5, fontY);
    }
    if (a == true) {
      o2 = o2 - 10;
      fill(0);
      text("A", 372.5, fontY);
    }
    if (m == true) {
      o3 = o3 - 10;
      fill(0);
      text("M", 447.5, fontY);
      text("M", 522.5, fontY);
    }
    if (e == true) {
      o4 = o4 - 10;
      fill(0);
      text("E", 597.5, fontY);
    }
    if (r == true) {
      o5 = o5 - 10;
      fill(0);
      text("R", 672.5, fontY);
    }
  }
}

void startScreen() {
  //the main menu, level 0
  o1 = 100;
  o2 = 100;
  o3 = 100;
  o4 = 100;
  o5 = 100;
  a = false;
  b = false;
  c = false;
  d = false;
  e = false;
  g = false;
  h = false;
  i = false;
  l = false;
  m = false;
  n = false;
  o = false;
  r = false;
  t = false;
  w = false;
  int x = 500;
  int y = 530;
  int d = 100;
  //this is the background image for the main screen
  image(title, 0, 0);
  noStroke();
  //this is the button to start the game
  fill(207, 36, 28);
  ellipse(x, y, d, d);
  textSize(fontsize);
  fill(0);
  text("Click the button to begin!", 300, 460);
  fill(0);
  text("Start", 458, 540);
  //when the mouse rolls over the ellipse, the button and text changes colour
  if (dist(mouseX, mouseY, x, y) < d/2) {
    //the ellipse fill changes form red to green
    fill(133, 194, 38);
    ellipse(x, y, d, d);
    //the text changes form black to white
    fill(255);
    text("Start", 458, 540);
  }
  if (dist(mouseX, mouseY, x, y) < d/2 && mousePressed == true) {
    //when mouse is over the button and clicked level one begins
    level = 1;
  }
}

void firework() {
  //the firework that explodes when the game is completed
  if (dist(boxx, boxy, xPos, yPos) < 30) {
    point(boxx, boxy);
    for (int i1=0;i1<z1.length;i1++) {
      z1[i1] = new Particle(500, 500);
    }
  }
  for (int i1=0;i1<z1.length;i1++) {
    z1[i1].render();
  }
}

class Particle {
  float xPos = 0;
  float yPos = 0;
  float a1 = 0;
  float g = 0;
  float m = 0;
  
  int counter = 0;
  
  public Particle(float x, float y) {
    xPos = x;
    yPos = y;
    //the direction of the particles
    a1 = random(360);
    //the distance the particles travel
    //we aimed to produce a large and bold explosion
    m = random(10);
    counter = 0;
  }
  
  public void render() {
    counter++;
    
    if (counter > 90) {
      xPos += m*cos(radians(a1));
      yPos += m*sin(radians(a1));
      yPos += g;
      g += 0.1;
    }
    else {
      yPos -= 5;
    }
    //the explosion will consist of randomly coloured circles exploding from a point
    fill(random(255), random(255), random(255), random(75));
    noStroke();
    ellipse(xPos, yPos, random(6, 40), random(6, 40));
  }
}

//end of code


