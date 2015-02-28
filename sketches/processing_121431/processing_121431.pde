
Arc butch1;
Arc captainKoons;
Arc vincentVega;
Arc julesWinfield;
Prologue prologue;
Arc roger;
Arc brett;
Arc marvin;
BonnieSituation bonnieSituation;
Arc jimmy;
Arc winstonWolfe;
Arc raquel;
Arc marsellus1;
Arc ringo;
Arc yolanda;
VincentAndMia vincentAndMia;
Arc butch2;
Arc marsellus2;
Arc lance;
Arc jody;
Arc mia;
TheGoldWatch theGoldWatch;
Arc marsellus3;
Arc butch3;
Arc fabienne;
Arc maynard;
Arc zed;
Arc gimp;

void setup(){
  size(975,650);
  noStroke();
  frameRate(128);
  
  butch1 = new Arc(width+96,70,180,50,255,140,0);
  
  captainKoons = new Arc(width+96,120,180,50,255,99,71);
  
  vincentVega = new Arc(width+1492,120,2612,50,255,255,255);
  
  // ends 1548
  julesWinfield = new Arc(width+1086,170,1800,50,0,0,0);
  
  prologue = new Prologue(width,44);
    
  marvin = new Arc(width+497,220,350,50,0,100,0);
  
  brett = new Arc(width+422,270,200,50,50,205,50);
  
  roger = new Arc(width+422,320,200,50,124,252,0);
  
  bonnieSituation = new BonnieSituation(width+517,94);
  
  jimmy = new Arc(width+847,220,350,50,30,144,255);

  winstonWolfe = new Arc(width+978,270,350,50,0,191,255);
  
  raquel = new Arc(width+1098,320,100,50,135,206,250);
  
  marsellus1 = new Arc(width+1098,370,100,50,255,105,180);
  
  ringo = new Arc(width+1234,220,428,50,186,85,211);
  
  yolanda = new Arc(width+1298,270,300,50,153,50,204);
  
  vincentAndMia = new VincentAndMia(width+1448,94);
    
  butch2 = new Arc(width+1598,270,300,50,255,140,0);
  
  marsellus2 = new Arc(width+1598,320,300,50,255,105,180);
  
  lance = new Arc(width+1898,320,300,50,255,36,0);
  
  jody = new Arc(width+1898,370,300,50,227,66,52);
  
  mia = new Arc(width+2224,320,350,50,255,192,203);
  
  theGoldWatch = new TheGoldWatch(width+2198,295);
  
  marsellus3 = new Arc(width+2498,370,600,50,255,105,180);
  
  butch3 = new Arc(width+2498,420,600,50,255,140,0);
  
  maynard = new Arc(width+2698,470,200,50,105,105,105);
  
  zed = new Arc(width+2698,520,200,50,112,138,144);
  
  gimp = new Arc(width+2698,570,200,50,211,211,211);
  
  // starts at 2574
  // ends at 2898
  fabienne = new Arc(width+2600,320,396,50,255,69,0);
  
}

void draw(){
  background(182,0,0);
  butch1.display();
  captainKoons.display();
  vincentVega.display();
  julesWinfield.display();
  roger.display();
  brett.display();
  marvin.display();
  bonnieSituation.display();
  prologue.display();
  jimmy.display();
  winstonWolfe.display();
  raquel.display();
  marsellus1.display();
  ringo.display();
  yolanda.display();
  vincentAndMia.display();
  butch2.display();
  marsellus2.display();
  lance.display();
  jody.display();
  mia.display();
  theGoldWatch.display();
  marsellus3.display();
  butch3.display();
  fabienne.display();
  maynard.display();
  zed.display();
  gimp.display();

}

class Arc{
  int x;
  int y;
  int r;
  int g;
  int b;
  int radiusX;
  int radiusY;
  
  Arc(int shellX,int shellY,int shellRadiusX,int shellRadiusY,int shellR,int shellG,int shellB){
    x = shellX;
    y = shellY;
    radiusX = shellRadiusX;
    radiusY = shellRadiusY;
    r = shellR;
    g = shellG;
    b = shellB;
  }
  
  void display(){
    fill(r,g,b);
    noStroke();
    smooth();
    rectMode(CENTER);
    rect(x,y,radiusX,radiusY);
    x = x - 1;
  }  
}

class BonnieSituation{
  int x;
  int y;
  
  BonnieSituation(int shellX,int shellY){
    x = shellX;
    y = shellY;
  }
  
  void display(){
    textSize(60);
    fill(255,215,0);
    text("THE BONNIE SITUATION",x,y);
    x = x - 1;
  }
}

class Prologue{
  int x;
  int y;
  
  Prologue(int shellX,int shellY){
    x = shellX;
    y = shellY;
  }
  
  void display(){
    textSize(60);
    fill(255,215,0);
    text("PROLOGUE",x,y);
    x = x - 1;
  }
}

class VincentAndMia{
  int x;
  int y;
  
  VincentAndMia(int shellX,int shellY){
    x = shellX;
    y = shellY;
  }
  
  void display(){
    textSize(60);
    fill(255,215,0);
    text("VINCENT VEGA AND MIA WALLACE",x,y);
    x = x - 1;
  }
}

class TheGoldWatch{
  int x;
  int y;
  
  TheGoldWatch(int shellX,int shellY){
    x = shellX;
    y = shellY;
  }
  
  void display(){
    textSize(60);
    fill(255,215,0);
    text("THE GOLD WATCH",x,y);
    x = x - 1;
  }
}


