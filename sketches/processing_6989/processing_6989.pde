
Vehicle_System vsys;
PFont arial;
String stimmt="+";
float s30=sin(radians(30));
float s60=sin(radians(60));
float s220=sin(radians(30+180));
float s40=sin(radians(40));
float s150=sin(radians(150));
float s140=sin(radians(140));
float c30=cos(radians(30));
float c60=cos(radians(60));
float c220=cos(radians(30+180));
float c40=cos(radians(40));
float c150=cos(radians(150));
float c140=cos(radians(140));
float s28=sin(radians(28));
float c28=cos(radians(28));
float s280=sin(radians(280));
float c280=cos(radians(280));
float s80=sin(radians(80));
float c80=cos(radians(80));



void setup(){
  size(900,600);
  //smooth();
  rectMode(CENTER);
  frameRate(30);
  ellipseMode(CENTER);
  vsys=new Vehicle_System(5);
  arial=loadFont("ArialMT-14.vlw");
  textFont(arial,14); 
}

void draw(){
  vsys.backgr();
  vsys.update();
}



