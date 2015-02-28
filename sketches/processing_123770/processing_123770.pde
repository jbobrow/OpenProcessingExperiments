
/* @pjs preload="Fever_2.jpg,Pata_drum.png,Pata_pon.png,Patapon_Background.jpg,Patapon_Archer.png,Patapon_Knight.png,Patapon_Horse.png,Patapon_Tuba.png"; 
 */

Patapon[] pata = new Patapon[10];
PImage patabg;
PImage archer;
PImage knight;
PImage tuba;
PImage horse;
PImage atap;
PImage pon;
PImage fev;
boolean p1 = false;
boolean p2 = false;
boolean p3 = false;
boolean p4 = false;

void setup(){
  size(1024,576);
  for (int j = 0; j < pata.length; j++){
    pata[j] = new Patapon();
  }
  fev = loadImage("Fever_2.jpg");
  atap = loadImage("Pata_drum.png");
  pon = loadImage("Pata_pon.png");
  patabg = loadImage("Patapon_Background.jpg");
  archer = loadImage("Patapon_Archer.png");
  knight = loadImage("Patapon_Knight.png");
  horse = loadImage("Patapon_Horse.png");
  tuba = loadImage("Patapon_Tuba.png");
  smooth();
}

void draw(){
  background(patabg);
  println(mouseX+","+mouseY);
  if (keyPressed){
  if (key == 'q'){
    image(atap,130,30);
    p1 = true;
    p2 = false;
    p3 = false;
    p4 = false;
  }else if(key == 'w'){
    image(atap,200,30);
    p2 = true;
    p1 = false;
    p3 = false;
    p4 = false;
  }else if(key == 'e'){
    image(atap,270,30);
    p3 = true;
    p2 = false;
    p1 = false;
    p4 = false;
  }else if (key == 'r'){
    image(pon,340,30);
    p4 = true;
    p3 = false;
    p2 = false;
    p1 = false;
  }else if (key == 'f'){
    p1 = true;
    p2 = true;
    p3 = true;
    p4 = true;
    image(fev,random(20,30),random(20,40));
  }else if (key == 's'){
    image(atap,130,30);
    image(atap,200,30);
    image(atap,270,30);
    image(pon,340,30);
    p1 = true;
    p2 = true;
    p3 = true;
    p4 = true;
  }
  for (int j = 0; j < pata.length; j++){
    pata[j].fever();
  }
  
}
}

 
class Patapon{
  float x1;
  float x2;
  float x3;
  float x4;
  float y;
  PImage archer;
  PImage knight;
  PImage tuba;
  PImage horse;
    
  Patapon(){
    x1 = 530;
    x2 = 800;
    x3 = 260;
    x4 = 50;
    y = 280;
    archer = loadImage("Patapon_Archer.png");
    knight = loadImage("Patapon_Knight.png");
    horse = loadImage("Patapon_Horse.png");
    tuba = loadImage("Patapon_Tuba.png");
  }
void fever(){
  if(p1 == true){
    image(knight,x1,y);
  }
  if(p2 == true){
    image(archer,x2,y);
  }
  if(p3 == true){
    image(horse,x3,y);
  }
  if(p4 == true){
    image(tuba,x4,y-60);
  }
  if(keyPressed){
    if(key == 'f'){
    x1 = random(510,540);
    x2 = random(790,810);
    x3 = random(250,270);
    x4 = random(40,60);
    y = random(260,290);
    }else if(key == 'a'){
    y = 280;
    x1 = 530;
    x2 = 800;
    x3 = 260;
    x4 = 50;
    p1 = false;
    p2 = false;
    p3 = false;
    p4 = false;
    }    
  }
}
}





