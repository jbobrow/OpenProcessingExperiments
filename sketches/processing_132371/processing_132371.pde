
PImage oreo;
PImage melk;
PImage koekje;

float x,y;

int richting;
Cirkel mijnCirkel;
Cirkel mijnCirkel2;
Cirkel mijnCirkel3;

void setup() {
  size(400, 400);
  richting = 7;
  oreo = loadImage("Oreo.jpg");
  melk = loadImage("glas melk.png");
  mouseX = 200;

  
    mijnCirkel = new Cirkel(60, 80, 5, 5, 1);
  mijnCirkel2 = new Cirkel(140,20,20,20,2);
  mijnCirkel3 = new Cirkel(320,10,50,50,4);
  

}

void draw() {
  image(oreo,0,0);
   mijnCirkel.updateCirkel();
  mijnCirkel.testCirkel();
  mijnCirkel.tekenCirkel();
  mijnCirkel2.updateCirkel();
  mijnCirkel2.testCirkel();
  mijnCirkel2.tekenCirkel();
  mijnCirkel3.updateCirkel();
  mijnCirkel3.testCirkel();
  mijnCirkel3.tekenCirkel();
  image(melk,mouseX-40,275);
 

if (y > height) {
  y = 0;
}
if (y == 0) {
  x = random(20,380);
}
y = y + richting;
}

