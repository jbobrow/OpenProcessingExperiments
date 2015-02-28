
//PICTURES!!!!!!!!!!!!!!!!!!!!!!!!!!
PImage tree;
PImage logo;
PImage eco;
PImage earth;
PImage car;
PImage go;
PImage Dot;
PImage peace;
PImage badge;
PImage Triangle;
PImage peach;
PImage friend;
PImage sun;
PImage good;
PImage apple;
PImage Y;
PImage D;
PImage P;
PImage E;
PImage B;

PFont or;
PFont bad;
PFont nice;

void setup(){
  size(640,480);
  smooth();
  noLoop();
  or = loadFont("Calibri-Bold-48.vlw");
  bad = loadFont("ComicSansMS-Bold-48.vlw");
  nice = loadFont("ArialNarrow-Bold-48.vlw");
  
  tree = loadImage("tree.png");
  logo = loadImage("logo.png");
  eco = loadImage("eco.png");
  earth = loadImage("earth.png");
  car = loadImage("car.png");
  go = loadImage("go.png");
  Dot = loadImage("dot.png");
  peace = loadImage("peace.png");
  badge = loadImage("badge.png");
  Triangle = loadImage("triangle.png");
  peach = loadImage("peach.png");
  friend = loadImage("friend.png");
  sun = loadImage("sun.png");
  good = loadImage("good.png");
  apple = loadImage("apple.png");
  B = loadImage("B.png");
  D = loadImage("D.png");
  P = loadImage("P.png");
  E = loadImage("E.png");
  Y = loadImage("Y.png");
  
}
void draw(){
  background(255);
  noStroke();
  fill(0,72,255);
  rect(0,0,width,230);
  fill(43,133,53);
  rect(0,230,width,250);
   PImage branch[]={tree,logo,eco,earth,car,go,Dot,peace,badge,peach,friend,sun,good,apple,Triangle};
   PImage leaves=branch[int(random(0,branch.length))];
   PImage leaves1=branch[int(random(0,branch.length))];
   PImage leaves2=branch[int(random(0,branch.length))];
   PImage leaves3=branch[int(random(0,branch.length))];
   PImage leaves4=branch[int(random(0,branch.length))];
   PImage leaves5=branch[int(random(0,branch.length))];
   PImage leaves6=branch[int(random(0,branch.length))];
   PImage leaves7=branch[int(random(0,branch.length))];
   PImage leaves8=branch[int(random(0,branch.length))];
   PImage leaves9=branch[int(random(0,branch.length))];
   PImage leaves10=branch[int(random(0,branch.length))];
   PImage leaves11=branch[int(random(0,branch.length))];
   PImage leaves12=branch[int(random(0,branch.length))];
   
   PImage trunk[]={B,D,P,E,Y};
   PImage wood=trunk[int(random(0,trunk.length))];
   PImage wood1=trunk[int(random(0,trunk.length))];
   PImage wood2=trunk[int(random(0,trunk.length))];
   PImage wood3=trunk[int(random(0,trunk.length))];
   PImage wood4=trunk[int(random(0,trunk.length))];
   PImage wood5=trunk[int(random(0,trunk.length))];
   
   image(wood,210,100,width*.3,height*.4);
   image(wood1,220,280,width*.3,height*.4);
   image(wood2,225,150,width*.3,height*.4);
   image(wood3,213,125,width*.3,height*.4);
   image(wood4,215,20,width*.3,height*.4);
   image(wood5,220,225,width*.3,height*.4);
   
   image(leaves,70,20,width*.39,height*.29);
   image(leaves1,170,5,width*.35,height*.25);
   image(leaves2,280,40,width*.38,height*.28);
   image(leaves10,110,-15,width*.33,height*.23);
   image(leaves11,230,-25,width*.31,height*.21);
   image(leaves12,330,-15,width*.37,height*.27);
   image(leaves7,275,0,width*.33,height*.23);
   image(leaves8,280,65,width*.31,height*.21);
   image(leaves9,220,67,width*.3,height*.2);
   image(leaves3,370,27,width*.32,height*.22);
   image(leaves4,200,60,width*.3,height*.2);
   image(leaves5,110,50,width*.37,height*.27);
   image(leaves6,325,52,width*.34,height*.24);
   
   stroke(0);
   fill(160,40,20);
   
   textFont(or);
   text("OR",190,370);
   text("OVER",375,370);
   
   textFont(nice);
   String niceOr[]={"Eco-Friendly","Responsible","Sunstainable","Innovative","Unity"};
   text(niceOr[int(random(0,niceOr.length))],5,320);
   
   String niceVS[]={"Progress?","Survival?","Safety?","Purpose?","Significance?"};
   text(niceVS[int(random(0,niceVS.length))],375,420);
   
   textFont(bad);
   String badOr[]={"Economic?","Greedy?","Profitable?","Exploitative?","Superiority?"};
   text(badOr[int(random(0,badOr.length))],5,420);
   
   String badVS[]={"Profit","Stock Price","Luxury","Praise","Symbols"};
   text(badVS[int(random(0,badVS.length))],375,320);
   
}
void mousePressed(){
  redraw();
}

