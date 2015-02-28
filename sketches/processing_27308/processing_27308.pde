
import fisica.*;
import ddf.minim.*;
import gifAnimation.*;

FWorld world;

ArrayList<Chat> chats;

FBox window1;
FBox window2;
FBox window3;
FBox window4;
FBox window5;

FBox back1;
FBox back2;
FBox back3;
FBox back4;
FBox back5;
FBox back6;
FBox back7;
FBox back8;
FBox back9;
FBox back10;

FBox button1;
FBox button2;
FBox button3;
FBox button4;

PFont fontA;
PImage[] bg;
PImage buttonimage;
PImage[] handimage;
PImage faceimage;
PImage[] bubbleimage;

Minim minim;
AudioSample tutup;
AudioSample woosh;
AudioPlayer musac;


void setup() {
  size(800,600);
  smooth();
  
  chats = new ArrayList<Chat>();
  
  bg = new PImage[10];
  bg[0] = loadImage("bgA.jpg");
  bg[1] = loadImage("bgAx.jpg");
  bg[2] = loadImage("bgB.jpg");
  bg[3] = loadImage("bgBx.jpg");
  bg[4] = loadImage("bgC.jpg");  
  bg[5] = loadImage("bgCx.jpg");
  bg[6] = loadImage("bgD.jpg");
  bg[7] = loadImage("bgDx.jpg");
  bg[8] = loadImage("bgE.jpg");
  bg[9] = loadImage("bgEx.jpg");  
  
  Gif arrow = new Gif(this, "next.gif");
  arrow.play();
  
  handimage = new PImage[2];
  handimage[0] = loadImage("openh.png");
  handimage[1] = loadImage("closeh.png");
  
  faceimage = loadImage("smile.png");
  
  bubbleimage = new PImage[5];
  bubbleimage[0] = loadImage("bubble1.png");
  bubbleimage[1] = loadImage("bubble2.png");
  bubbleimage[2] = loadImage("bubble3.png");
  bubbleimage[3] = loadImage("bubble4.png");
  bubbleimage[4] = loadImage("bubble5.png");
  
  minim = new Minim(this);
  tutup = minim.loadSample("DoorBell 6018_07_2.wav",2048);
  woosh = minim.loadSample("ComedyAccent2.wav",2048);
  musac = minim.loadFile("Pinball Spring.mp3",2048);
  musac.loop();


  Fisica.init(this);

  world = new FWorld();
  world.setEdges(); //borders
  world.setEdgesRestitution(0.0);
  world.setGravity(0,0);
   
window1 = new FBox(250,280);
window1.setPosition(570,190);
window1.setStatic(true);
window1.setGrabbable(false);
window1.setNoFill();
window1.setNoStroke();
world.add(window1);

window2 = new FBox(230,250);
window2.setPosition(350,150);
window2.setStatic(true);
window2.setGrabbable(false);
window2.setNoFill();
window2.setNoStroke();

window3 = new FBox(230,250);
window3.setPosition(630,200);
window3.setStatic(true);
window3.setGrabbable(false);
window3.setNoFill();
window3.setNoStroke();

window4 = new FBox(350,250);
window4.setPosition(220,150);
window4.setStatic(true);
window4.setGrabbable(false);
window4.setNoFill();
window4.setNoStroke();

window5 = new FBox(280,250);
window5.setPosition(250,180);
window5.setStatic(true);
window5.setGrabbable(false);
window5.setNoFill();
window5.setNoStroke();


back1 = new FBox(800,600);
back1.setPosition(400,300);
back1.setStatic(true);
back1.setGrabbable(false);
back1.attachImage(bg[0]);
back1.setNoStroke();
world.add(back1);

back2 = new FBox(800,600);
back2.setPosition(400,300);
back2.setStatic(true);
back2.setGrabbable(false);
back2.attachImage(bg[1]);
back2.setNoStroke();

back3 = new FBox(800,600);
back3.setPosition(400,300);
back3.setStatic(true);
back3.setGrabbable(false);
back3.attachImage(bg[2]);
back3.setNoStroke();

back4 = new FBox(800,600);
back4.setPosition(400,300);
back4.setStatic(true);
back4.setGrabbable(false);
back4.attachImage(bg[3]);
back4.setNoStroke();

back5 = new FBox(800,600);
back5.setPosition(400,300);
back5.setStatic(true);
back5.setGrabbable(false);
back5.attachImage(bg[4]);
back5.setNoStroke();

back6 = new FBox(800,600);
back6.setPosition(400,300);
back6.setStatic(true);
back6.setGrabbable(false);
back6.attachImage(bg[5]);
back6.setNoStroke();

back7 = new FBox(800,600);
back7.setPosition(400,300);
back7.setStatic(true);
back7.setGrabbable(false);
back7.attachImage(bg[6]);
back7.setNoStroke();

back8 = new FBox(800,600);
back8.setPosition(400,300);
back8.setStatic(true);
back8.setGrabbable(false);
back8.attachImage(bg[7]);
back8.setNoStroke();

back9 = new FBox(800,600);
back9.setPosition(400,300);
back9.setStatic(true);
back9.setGrabbable(false);
back9.attachImage(bg[8]);
back9.setNoStroke();

back10 = new FBox(800,600);
back10.setPosition(400,300);
back10.setStatic(true);
back10.setGrabbable(false);
back10.attachImage(bg[9]);
back10.setNoStroke();

button1 = new FBox(147,122);
button1.setPosition(700,300);
button1.setStatic(true);
button1.setGrabbable(false);
button1.attachImage(arrow);
button1.setNoStroke();

button2 = new FBox(147,122);
button2.setPosition(700,300);
button2.setStatic(true);
button2.setGrabbable(false);
button2.attachImage(arrow);
button2.setNoStroke();

button3 = new FBox(147,122);
button3.setPosition(700,300);
button3.setStatic(true);
button3.setGrabbable(false);
button3.attachImage(arrow);
button3.setNoStroke();

button4 = new FBox(147,122);
button4.setPosition(700,300);
button4.setStatic(true);
button4.setGrabbable(false);
button4.attachImage(arrow);
button4.setNoStroke();
 }


void draw() {
  background(255);
  world.step();
  world.draw();
  
   for(Chat c:chats) {
  c.display();
   }
  
  noCursor();
  if (mousePressed == true) {
      image(handimage[1],mouseX,mouseY-50);
  } else {
      image(handimage[0],mouseX,mouseY-50);
}
   cleanup();
}

void cleanup() {
  for(int i=chats.size()-1;i>=0;i--) {
     if(chats.get(i).remove==true) {
       chats.remove(i);
     }
   }
}

void mousePressed() {
  FBody pressed = world.getBody(mouseX, mouseY);
  if (pressed == window1) {
    tutup.trigger();
    world.remove(window1);
   world.remove(back1);
    world.add(button1);
   world.add(back2);
  chats.add(new Chat(100, 0).setImage(bubbleimage[0]));

  }
  if (pressed == button1) {
   world.remove(button1);
   woosh.trigger();
   world.remove(back2);
   world.add(window2);
   world.add(back3);
}
if (pressed == window2) {
   tutup.trigger();
   world.remove(window2);
   world.remove(back3);
   world.add(button2);
   world.add(back4);
   chats.add(new Chat(100, 0).setImage(bubbleimage[2]));
}
if (pressed == button2) {
   world.remove(button2);
   world.remove(back4);
   world.add(window3);
   world.add(back5);
}
if (pressed == window3) {
   tutup.trigger();
   world.remove(window3);
   world.remove(back5);
   world.add(button3);
   world.add(back6);
   chats.add(new Chat(100, 0).setImage(bubbleimage[3]));
}
if (pressed == button3) {
   world.remove(button3);
   world.remove(back6);
   world.add(window4);
   world.add(back7);
}
if (pressed == window4) {
   tutup.trigger();
   world.remove(window4);
   world.remove(back7);
   world.add(button4);
   world.add(back8);
   chats.add(new Chat(100, 0).setImage(bubbleimage[4]));
}
if (pressed == button4) {
   world.remove(button4);
   world.remove(back8);
   world.add(window5);
   world.add(back9);
}
if (pressed == window5) {
   tutup.trigger();
   world.remove(window5);
   world.remove(back9);
   world.add(back10);
   chats.add(new Chat(100, 0).setImage(bubbleimage[1]));
}
}

void mouseMoved() {
  FBody hovered = world.getBody(mouseX, mouseY);
 }





