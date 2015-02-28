
//Extra Toevoegingen:
    //-Score
    //-Game Over
    //-Snelheid van vallende objecten neemt toe
    //-Bewegende wolken
    //-Bewegend vliegtuig

//variabelen
float W1;
float W2;
float W3;
float P1;
int score;
int levens;
PFont my_font;


Cirkel eersteCirkel;
Cirkel tweedeCirkel;
Cirkel derdeCirkel;
Cirkel vierdeCirkel;
Cirkel vijfdeCirkel;
Cirkel zesdeCirkel;
Cirkel zevendeCirkel;
Cirkel achtsteCirkel;

void setup() {
  size(600,600);
  eersteCirkel = new Cirkel(140,131,20,20,3);//meatball
  tweedeCirkel = new Cirkel(170,146,20,20,3);//meatball
  derdeCirkel = new Cirkel(257,242,20,20,3);//meatball
  vierdeCirkel = new Cirkel(289,277,20,20,3);//meatball
  vijfdeCirkel = new Cirkel(487,202,20,20,3);//meatball
  zesdeCirkel = new Cirkel(360,197,20,20,3);//meatball
  zevendeCirkel = new Cirkel(249,274,20,20,3);//meatball
  achtsteCirkel = new Cirkel(546,157,20,20,3); //meatball 
  
  my_font=loadFont("AngryBirds-Regular-48.vlw");
  textFont(my_font,17);
  
  W1 = 0;
  W2 = -4;
  W3 = 0;
  P1 = 0;
  score =0;
  levens =25;
}

void draw() {

  noStroke();
  achtergrond();
 
  eersteCirkel.updateCirkel();
  eersteCirkel.testCirkel();
  eersteCirkel.tekenCirkel();
  eersteCirkel.vangCirkel();
  eersteCirkel.misCirkel();
  
  tweedeCirkel.updateCirkel();
  tweedeCirkel.testCirkel();
  tweedeCirkel.tekenCirkel();
  tweedeCirkel.vangCirkel();
  tweedeCirkel.misCirkel();
  
  derdeCirkel.updateCirkel();
  derdeCirkel.testCirkel();
  derdeCirkel.tekenCirkel();
  derdeCirkel.vangCirkel();
  derdeCirkel.misCirkel();
  
  vierdeCirkel.updateCirkel();
  vierdeCirkel.testCirkel();
  vierdeCirkel.tekenCirkel();
  vierdeCirkel.vangCirkel();
  vierdeCirkel.misCirkel();
  
  vijfdeCirkel.updateCirkel();
  vijfdeCirkel.testCirkel();
  vijfdeCirkel.tekenCirkel();
  vijfdeCirkel.vangCirkel();
  vijfdeCirkel.misCirkel();
  
  zesdeCirkel.updateCirkel();
  zesdeCirkel.testCirkel();
  zesdeCirkel.tekenCirkel();
  zesdeCirkel.vangCirkel();
  zesdeCirkel.misCirkel();
  
  zevendeCirkel.updateCirkel();
  zevendeCirkel.testCirkel();
  zevendeCirkel.tekenCirkel();
  zevendeCirkel.vangCirkel();
  zevendeCirkel.misCirkel();
  
  achtsteCirkel.updateCirkel();
  achtsteCirkel.testCirkel();
  achtsteCirkel.tekenCirkel();
  achtsteCirkel.vangCirkel();
  achtsteCirkel.misCirkel();
  
  donkerewolk();
  ondergrond();
  monster();
  fill(255,250,250);
  text("Catch as many meatballs as you can!",8,31);
  fill(255,250,250);
  text("Score:" +score,470,31);
  text("Lives left:" +levens,470,49);
  
}



class Cirkel{
  float x;
  float y;
  int breedte;
  int hoogte;
  float snelheid;

Cirkel(int tempX, int tempY, int tempBreedte, int tempHoogte, float tempSnelheid){
  x = tempX;
  y = tempY;
  breedte = tempBreedte;
  hoogte = tempHoogte;
  snelheid = tempSnelheid;
}

void updateCirkel(){
  y = y + snelheid;//Beweging van meatball
}

void testCirkel(){
  if(y > height){
    x = random(width);//positie van meatballs nadat ze de grond raken
    y = 0;
  }

}

void vangCirkel(){
  if(y > 460 && x > mouseX -16 && x < mouseX + 16){//gedeelte waarin de meatballs gevangen worden
    y = 0;//Meatballs gaan terug naar de top
    score = score + 10;}//Score wordt opgeteld
    else if(y > 580){
    y = 0;
    levens = levens -1;//Als ze de grond raken, gaat er een leven af.
    }

//Snelheid opvoeren bij 500 punten erbij tot aan 3000 
  if(score == 500){
    snelheid += 0.05;
  }
  if(score == 1000){
    snelheid += 0.05;
  }
  if(score == 1500){
    snelheid += 0.05;
  }
  if(score == 2000){
    snelheid += 0.05;
  }  
  if(score == 2500){
    snelheid += 0.05;
  }  
  if(score == 3000){
    snelheid += 0.05;
  }  
  
}

void misCirkel(){
    if (levens <= 0){
    y = 600;//Als de levens op zijn, verdwijnen de meatballs naar de onderkant van het venster.
    fill(4,4,4);
    text("GAME OVER",273,height/2);
    text("Score:" +score, 276, 320);
  }
}

//Meatballs
void tekenCirkel(){
  noStroke();
  fill(132,91,38);
  ellipse(x, y +0, breedte,breedte);
}
}

void achtergrond(){
  background(160,206,241);
  fill(255);
  ellipse(W1 +38, 282,71,37);//WOLK1
  ellipse(W1 +77, 278,54,35);//WOLK1
  ellipse(W1 +57, 266,49,46);//WOLK1
  ellipse(W1 +77, 288,76,37);//WOLK1

  fill(226,0,0);
  ellipse(P1 +171, 283,28,81);//VLIEGTUIG-VLEUGEL  
  fill(226,0,0);
  ellipse(P1 +135, 283,11,35);//VLIEGTUIG-VLEUGEL-ACHTER
  fill(255,0,0);
  ellipse(P1 +128, 274,20,36);//VLIEGTUIG-VLEUGEL-ACHTER2   
  fill(255,0,0);
  ellipse(P1 +171, 280,104,34);//VLIEGTUIG-BASIS
  fill(101,211,218);
  ellipse(P1 +181, 266,41,14);//VLIEGTUIG-RAAMPJE
  fill(217,217,217);
  ellipse(P1 +218, 280,14,12);//VLIEGTUIG-NEUS
  
  stroke(0);
  line(P1 +108,273,P1 +118,272);//VLIEGTUIG-BANNER
  line(P1 +108,284,P1 +120,286);//VLIEGTUIG-BANNER
  noStroke();
  fill(255);
  rect(P1 +29,280,160,22);//VLIEGTUIG-BANNER
  fill(0);
  text("By Sybren Janssen",P1 -46,285);//VLIEGTUIG-BANNER
  
  noStroke();
  fill(255);
  ellipse(W2 +300, 402,105,24);//WOLK2
  ellipse(W2 +363, 398,100,24);//WOLK2
  ellipse(W2 +298, 386,76,46);//WOLK2
  ellipse(W2 +364, 374,91,68);//WOLK2
  ellipse(W2 +365, 385,180,42);//WOLK2

  ellipse(W3 +439, 211,81,38);//WOLK3
  ellipse(W3 +501, 221,83,27);//WOLK3
  ellipse(W3 +497, 201,76,46);//WOLK3
  ellipse(W3 +441, 193,91,68);//WOLK3
  ellipse(W3 +496, 196,60,59);//WOLK3
  
  fill(123,122,122);
  ellipse(119,65,360,97);//DONKERE WOLK
  ellipse(307,55,186,118);//DONKERE WOLK
  ellipse(370,57,389,54);//DONKERE WOLK
  ellipse(573,63,227,102);//DONKERE WOLK
    W1 = W1 + 0.8;
    W2 = W2 + 0.4;
    W3 = W3 + 0.2;
    P1 = P1 + 2.0;

//Beweging van de wolken    
    if(W1> 590){
      W1= -W1;}
    if(W2> 415){
      W2= -W2;}
    if(W3> 510){
      W3= -W3;}
    if(P1>2000){
      P1= -P1;}
}

void donkerewolk(){
  fill(102,102,102);
  ellipse(50,27,317,77);//DONKERE WOLK
  ellipse(252,22,225,118);//DONKERE WOLK
  ellipse(409,24,165,89);//DONKERE WOLK
  ellipse(560,22,395,102);//DONKERE WOLK
  

}
void ondergrond(){
  fill(80,208,89);
  rect(300,578,600,45);
}

void monster(){
  ellipseMode(CENTER);
  rectMode(CENTER);
 //OREN
 fill(3,164,45);
 ellipse(mouseX -30,500,25,25);//OREN-RAND
 ellipse(mouseX +30,500,25,25);//OREN-RAND
 fill(52,105,33);
 ellipse(mouseX -30,500,20,20);//OREN-VULLING
 ellipse(mouseX +30,500,20,20);//OREN-VULLING
 
 //POTEN
 fill(3,164,45);
 rect(mouseX -10,565,15,25);//LINKER
 rect(mouseX +10,565,15,25);//RECHTER
 
 //HOOFD
 fill(1,183,48);
 ellipse(mouseX,530,100,75);
 
  //OGEN
 fill(255);
 ellipse(mouseX -12,515,17,15);
 ellipse(mouseX +12,515,17,15);
  fill(0);
 ellipse(mouseX -12,513,10,10);//PUPIL
 ellipse(mouseX +12,513,10,10);//PUPIL
 
 //NEUS
 fill(10,146,45);
 ellipse(mouseX,530,30,15);
 fill(34,34,34);
 ellipse(mouseX -5,530,5,5);//NEUSGAT
 ellipse(mouseX +5,530,5,5);//NEUSGAT
 
 //MOND
 fill(0);
 ellipse(mouseX,550,27,17);
 fill(249,0,41);
 ellipse(mouseX,556,14,6);//TONG
 
}






