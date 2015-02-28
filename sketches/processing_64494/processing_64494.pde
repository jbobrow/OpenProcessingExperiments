
class Conf
{
  boolean flag;
  boolean intro;
  boolean fpY;
  boolean Ri,Le,Ti;
  boolean senss;
  boolean jeu;
  boolean shiptouche;
  boolean shiptoucheLaser;
  boolean play;

  float sense;

  int game;
  int stage;
  int upgrade;
  int deltaX;
  int deltaY;
  int vie;
  int score;
  int highScore;
  String[] list = new String[1];
  String[] stageName = {"EARTH","SOLAR","MILKY WAY", "BONUS"};
  int fcount;
  int[] konami = new int[10];
  int[] konamicode = {1,1,2,2,3,4,3,4,6,5};

  PImage filtre; 
  PImage earth;
  PImage shipImage;
  PImage mothershipImage;
  PImage[] stageImage = new PImage[4];
  PImage itemImage;
  PFont fontA;


  Conf()
  {
    deltaX=width/10+35;
    deltaY=height/10+50;
    flag=true;
    intro=true;
    fpY=false;
    game=0;
    Ri=false;
    Le=false;
    Ti=false;
    senss=false;
    jeu=false;
    shiptouche=false;
    shiptoucheLaser=false;
    play=false;
    vie=3;
    sense=5;
    fcount=30;
    score=0;
    stage=0;
    filtre = loadImage("filtrejeu.tga");
    earth = loadImage("earth.jpg");
    shipImage = loadImage("ship.gif");
    mothershipImage = loadImage("mothership.jpg");
    stageImage[0] = loadImage("stage_1.jpg");
    stageImage[1] = loadImage("stage_2.jpg");
    stageImage[2] = loadImage("stage_3.jpg");
    itemImage = loadImage("item.jpg");
    fontA = loadFont("CourierNew36.vlw");
  }


}




