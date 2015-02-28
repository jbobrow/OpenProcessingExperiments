
import fisica.*;
import ddf.minim.*;
import gifAnimation.*;

FWorld world;

ArrayList<Chat> chats;

FBox boy;
FBox torch;
FBox battery1;
FBox battery2;
FBox medkit;
FBox cat;
FBox rice;
FBox water;
FBox fruit;
FBox bread;
FBox jacket;
FBox radio;

FBox back1;
FBox back2;
FBox back3;
FBox back4;

FBox button1;
FBox button2;
FBox button3;
FBox button4;

//int scorePlayer;
//String score;

PFont fontA;
PImage[] bg;
PImage[] handimage;
PImage[] bubbleimage;
PImage boyimage[];
PImage torchimage;
PImage batteryimage;
PImage medkitimage;
PImage riceimage;
PImage waterimage;
PImage breadimage;
PImage fruitimage;
PImage radioimage;
PImage jacketimage;

Minim minim;
AudioPlayer musac;
AudioSample ok;


void setup() {
  size(800,600);
  smooth();
  
  chats = new ArrayList<Chat>();
   
  bg = new PImage[4];
  bg[0] = loadImage("bgAx.jpg");
  bg[1] = loadImage("bgBx.jpg");
  bg[2] = loadImage("bgC.jpg");
  bg[3] = loadImage("bgD.jpg");
 
  Gif arrow = new Gif(this, "next.gif");
  arrow.play();
  
  handimage = new PImage[2];
  handimage[0] = loadImage("openh.png");
  handimage[1] = loadImage("closeh.png");
  
  boyimage = new PImage[2];
  boyimage[0] = loadImage("boy.png");
  boyimage[1] = loadImage("boyJ.png");
  
  torchimage = loadImage("light.png");
  medkitimage = loadImage("med.png");
  batteryimage = loadImage("batt.png");
  riceimage = loadImage("rice.png");
  waterimage = loadImage("water.png");
  breadimage = loadImage("bread.png");
  fruitimage = loadImage("fruit.png");
  radioimage = loadImage("radio.png");
  jacketimage = loadImage("jacket.png");
  
  bubbleimage = new PImage[5];
  bubbleimage[0] = loadImage("bubble1.png");
  bubbleimage[1] = loadImage("bubble2.png");
  bubbleimage[2] = loadImage("bubble3.png");
  bubbleimage[3] = loadImage("bubble4.png");
  bubbleimage[4] = loadImage("bubble5.png");
  
  
  minim = new Minim(this);
  ok = minim.loadSample("BodyfallHuman 6040_03_3.wav",2048);
  musac = minim.loadFile("Show Your Moves.mp3",2048);
  musac.loop();


  Fisica.init(this);

  world = new FWorld();
  world.setEdges(); //borders
  world.setEdgesRestitution(0.0);
  world.setGravity(0,0);

boy = new FBox(101,118);
boy.setPosition(100,435);
boy.setGrabbable(false);
boy.setStatic(true);
boy.setNoFill();
boy.setNoStroke();
boy.attachImage(boyimage[0]);
world.add(boy);  
   
torch = new FBox(27,104);
torch.setPosition(165,270);
torch.setSensor(true);
torch.setNoFill();
torch.attachImage(torchimage);
torch.setNoStroke();
world.add(torch);

battery1 = new FBox(42,40);
battery1.setPosition(210,300);
battery1.setSensor(true);
battery1.setNoFill();
battery1.attachImage(batteryimage);
battery1.setNoStroke();
world.add(battery1);

medkit = new FBox(104,84);
medkit.setPosition(220,405);
medkit.setSensor(true);
medkit.setNoFill();
medkit.attachImage(medkitimage);
medkit.setNoStroke();
world.add(medkit);

rice = new FBox(72,79);
rice.setPosition(420,510);
rice.setSensor(true);
rice.setNoFill();
rice.attachImage(riceimage);
rice.setNoStroke();

water = new FBox(32,79);
water.setPosition(700,510);
water.setSensor(true);
water.setNoFill();
water.attachImage(waterimage);
water.setNoStroke();

fruit = new FBox(119,95);
fruit.setPosition(550,270);
fruit.setSensor(true);
fruit.setNoFill();
fruit.attachImage(fruitimage);
fruit.setNoStroke();

bread = new FBox(118,159);
bread.setPosition(570,120);
bread.setSensor(true);
bread.setNoFill();
bread.attachImage(breadimage);
bread.setNoStroke();

battery2 = new FBox(42,40);
battery2.setPosition(650,400);
battery2.setSensor(true);
battery2.setNoFill();
battery2.attachImage(batteryimage);
battery2.setNoStroke();

radio = new FBox(147,91);
radio.setPosition(450,370);
radio.setSensor(true);
radio.setNoFill();
radio.attachImage(radioimage);
radio.setNoStroke();

jacket = new FBox(118,154);
jacket.setPosition(528,190);
jacket.setSensor(true);
jacket.setNoFill();
jacket.attachImage(jacketimage);
jacket.setNoStroke();

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

void mouseMoved() {
  FBody hovered = world.getBody(mouseX, mouseY);
 }

void contactStarted(FContact a) {
 if ((a.getBody1() == boy && a.getBody2() == torch) ||
(a.getBody2() == boy && a.getBody1() == torch)) {
 world.remove(torch);
 ok.trigger();
}
 if ((a.getBody1() == boy && a.getBody2() == battery1) ||
(a.getBody2() == boy && a.getBody1() == battery1)) {
 world.remove(battery1);
 ok.trigger(); 
 world.remove(medkit);
 world.remove(torch); 
 world.remove(back1);
 world.add(rice);
 world.add(water);
 world.add(fruit); 
 world.add(bread);
 chats.add(new Chat(50, 50).setImage(bubbleimage[1]));
 world.add(back2);
 }
 if ((a.getBody1() == boy && a.getBody2() == medkit) ||
(a.getBody2() == boy && a.getBody1() == medkit)) {
  world.remove(medkit);
  ok.trigger();
}
 if ((a.getBody1() == boy && a.getBody2() == rice) ||
(a.getBody2() == boy && a.getBody1() == rice)) {
  world.remove(rice);
  ok.trigger();
}
 if ((a.getBody1() == boy && a.getBody2() == water) ||
(a.getBody2() == boy && a.getBody1() == water)) {
  world.remove(water);
  ok.trigger();
}
 if ((a.getBody1() == boy && a.getBody2() == fruit) ||
(a.getBody2() == boy && a.getBody1() == fruit)) {
  world.remove(fruit);
  ok.trigger();
  world.remove(rice);
  world.remove(water);
  world.remove(bread);
  world.remove(back2);
  world.add(radio);
  world.add(battery2);
  chats.add(new Chat(50, 50).setImage(bubbleimage[2]));
  world.add(back3);
}
 if ((a.getBody1() == boy && a.getBody2() == bread) ||
(a.getBody2() == boy && a.getBody1() == bread)) {
  world.remove(bread);
  ok.trigger();
}
 if ((a.getBody1() == boy && a.getBody2() == radio) ||
(a.getBody2() == boy && a.getBody1() == radio)) {
  world.remove(radio);
  ok.trigger();
  world.remove(battery2);
  world.remove(back3);
  world.add(jacket);
  chats.add(new Chat(50, 50).setImage(bubbleimage[3]));
  world.add(back4);
}
 if ((a.getBody1() == boy && a.getBody2() == battery2) ||
(a.getBody2() == boy && a.getBody1() == battery2)) {
  world.remove(battery2);
  ok.trigger();
}
 if ((a.getBody1() == boy && a.getBody2() == jacket) ||
(a.getBody2() == boy && a.getBody1() == jacket)) {
  world.remove(jacket);
  ok.trigger();
  boy.attachImage(boyimage[1]);
}
}



