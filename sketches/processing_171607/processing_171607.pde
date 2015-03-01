
//Arthur Luo//

//Toy Jam//

//Credit to Heisei and his Circular Motion processing sketch. link: http://www.openprocessing.org/sketch/106191

int constant = 50;
float angle = 0.05;
int scalar = 5;
float speed = 0.3;
int frames = 6;
int panel = 0;
PImage blackmage = new PImage[frames];
PImage earth, water, fire, wind;
PImage magicroom;
PImage Quas, Wex, Exort, Reon;



void setup(){
  background(255,255,255);
  size(800,600);
  frameRate(15);
  for(int i=0; i<blackmage.length; i++){
    blackmage[i]=loadImage(i+".png");
  }
  Quas = loadImage("Quas.png");
  Wex = loadImage("Wex.png");
  Exort = loadImage("Exort.png");
  Reon = loadImage("Rede.png");
  magicroom = loadImage("magicroom.jpg");
  earth = loadImage("earth.png");
  water = loadImage("water.png");
  fire = loadImage("fire.png");
  wind = loadImage("aero.png");
}



void draw(){
  float a_e, b_e;
  float a_f, b_f;
  float a_w, b_w;
  float a_a, b_a;
  image(magicroom,0,0);
  panel = (panel+1) % frames;
  image(blackmage[panel%frames],212,130);
  float x = constant + sin(angle) * scalar;
  float y = constant + cos(angle) * scalar;
  angle = angle + speed;
  
  if (mouseX>=40 && mouseX<=120 && mouseY>=40 && mouseY<100){
    a_e=85;
    b_e=85;
    image(Reon,mouseX,mouseY);
  }
  if (mouseX>=650 && mouseX<=800 && mouseY>=40 && mouseY<=120){
    a_f=85;
    b_f=85;
    image(Exort,mouseX-400,mouseY);
  }
  if (mouseX>=40 && mouseX<=120 && mouseY>=470 && mouseY<=560){
    a_w=85;
    b_w=85;
    image(Quas,mouseX,mouseY-250);  
  }
  if (mouseX>=650 && mouseX<=800 && mouseY>=470 && mouseY<=560){
    a_a=85;
    b_a=85;
    image(Wex,mouseX-400,mouseY-250);  
  }  
  
  image(earth,y,x,a_e,b_e);
  image(fire,y+650,x,a_f,b_f);
  image(water,x,y+430,a_w,b_w);
  image(wind,x+650,y+430,a_a,b_a);  
  }
  
  
  
  
  
  
  



