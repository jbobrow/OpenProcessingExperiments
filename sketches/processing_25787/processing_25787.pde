
PImage Mc;
PImage Bd;
PFont  myfont;
PFont title;

String[] mcText;
String[] bdText;
float mccount=13;
float bdcount=8;

float xpos=200;
float xpos2=600;
float ypos=300;

float circrad;
float rotspeed;
float circpos;

float circrad2;
float rotspeed2;
float circpos2;


void setup(){
  background(0);
  size(800,600);
  smooth();
  
  
  Mc=loadImage("MC.jpg");
  Bd=loadImage("BD.jpg");

  
  mcText=loadStrings("textdataMC.txt");
  bdText=loadStrings("textdataBD.txt");
  
  title=loadFont("Calibri-Bold-75.vlw");
  
  
  circrad=150;
  circrad2=150;
  circpos=0;
  circpos2=0;
  
  
 
}

void draw(){
  background(#3E3535);
  noStroke();
  fill(255,100);
  
  textFont(title);
  text("McLuhan VS Baudrillard", 30,550);
  
  circ1();
  circ2();
  
  
  
  
  //mcluhan center pic
  fill(0,100);
  rect(155,240,90,120);
  image(Mc,165,250);
 
  rect(555,240,90,120);
  //Boud center pic
  image(Bd,565,250);
  
  
}

