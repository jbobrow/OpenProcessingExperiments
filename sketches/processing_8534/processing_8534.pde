
class Conf
{
  boolean flag;
  boolean game;
  boolean fpY;
  boolean Ri,Le,Ti;
  boolean senss;
  boolean jeu;
  boolean shiptouche;
  boolean shiptoucheLaser;

  float sense;

  int deltaX;
  int deltaY;
  int vie;
  int score;
  int fcount;
  int[] konami = new int[10];
  int[] konamicode = {1,1,2,2,3,4,3,4,6,5};

  PImage filtre; 
  PFont fontA;


  Conf()
  {
    deltaX=width/10+35;
    deltaY=height/10+50;
    flag=true;
    fpY=false;
    game=true;
    Ri=false;
    Le=false;
    Ti=false;
    senss=false;
    jeu=false;
    shiptouche=false;
    shiptoucheLaser=false;
    vie=3;
    sense=5;
    fcount=30;
    score=0;
    filtre = loadImage("filtrejeu.tga");
    fontA = loadFont("CourierNew36.vlw");
  }


}




