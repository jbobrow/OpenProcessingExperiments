
//NOT WORKING IN JAVASCRIPT BUT WORKS IN JAVA
//Assignment # 8 3-28-2013
//By Cynthia Gutierrez
//Background Image Credit: http://fc00.deviantart.net/fs71/f/2011/167/1/7/178e8ef2006b2c8f63d69115b1cb0d03-d3j3wqo.png
/* @pjs preload="fishy.png";
 @pjs preload="girl_dolphin_lil0000.png";
 */
PImage player;
PImage bg;
Fish myFish1;
Fish myFish2;
Fish myFish3;
Coin myCoin1;
Key myKey1;
Health myHealth1;
Health myHealth2;
Health myHealth3;
Trash myTrash1;
PFont font;
void setup() {
  size(750, 500);
  smooth();
  myFish1 = new Fish("fishy", 1, 700, 40, 20, 0, 60, 0.0, 0.0, 60, 0.05, 5);
  myFish2 = new Fish("fisher", 1, 700, 40, 140, 20, 60, 0.0, 0.4, 60, 0.05, 5);
  myFish3 = new Fish("fishy", 1, 700, 40, 190, 40, 60, 0.0, 0.8, 60, 0.05, 5);
  myCoin1 = new Coin("goldcoin", 1, 300, 30);
  myKey1 = new Key("key", 1, 580, 380);
  myHealth1 = new Health("heart", 3, 50, 30);
  myHealth2 = new Health("heart", 3, 120, 30);
  myHealth3 = new Health("heart", 3, 190, 30);
  myTrash1 = new Trash("can_plastic",1,400,330);
  player = loadImage("girl_dolphin_lil0000.png");
  bg = loadImage("BG.png");
  font = loadFont("Opificio-Bold-48.vlw");
}
void draw() {
  background(13, 178, 210);
  imageMode(CORNER);
  image(bg,0,0);
  textFont(font);
  //  text("Lives",30,40);
  text("x 1", 380, 80);
  myFish1.bounce();
  myFish1.move();
  myFish2.bounce();
  myFish2.move();
  myFish3.bounce();
  myFish3.move();
  myCoin1.exist();
  myKey1.exist();
  myHealth1.exist();
  myHealth2.exist();
  myHealth3.exist();
  myTrash1.exist();

  imageMode(CENTER);
  image(player, mouseX, mouseY);
  println("X = " + mouseX + " , " + "Y = " + mouseY);
}


