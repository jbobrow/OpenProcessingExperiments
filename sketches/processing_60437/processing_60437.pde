
//import processing.video.*;
//import processing.opengl.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;

int ran = 100;  //Vektorenliste die pro Schleife erzeugt werden
float pos = 10;  //Größe der Box

ArrayList Vektorenliste;  // speichert jede Position einer Box in habhängigkeit zum Vorgänger
ArrayList RGBliste;  //speichert jeden Farbwert einer Box in habhängigkeit zum Vorgänger
int r = 0;
int g = 0;
int b = 0;
PVector v;

//MovieMaker mm;

void setup() {
  size(400, 400, P3D);
  background(255);
  stroke(0);
  noStroke();
  smooth();
  //noise(5,5,5);
  cam = new PeasyCam(this, 1000);
  Vektorenliste = new ArrayList();  //warum nicht festlegen wieviele plätze es sein sollen
  RGBliste = new ArrayList();  //warum nicht festlegen wieviele plätze es sein sollen
 // mm = new MovieMaker(this, width, height, "wachstumOPENGL4-05.mov");
}



void draw() {
  background(255);
  rotateY(frameCount * 0.003);
  rotateX(frameCount * 0.003);
  rotateZ(frameCount * 0.003);
  float x = width/2-width/2;
  float y = height/2-height/2;
  translate(x,y);
  
  float summex;
  float summey;
  float summez;
  
  summex=0;
  summey=0;
  summez=0;
  
  for(int i = 0; i < Vektorenliste.size(); i++) {
    PVector v = (PVector) Vektorenliste.get(i);
    translate(v.x,v.y,v.z); 
    summex = summex +(v.x/2);
    summey = summey +(v.y/2);
    summez = summez +(v.z/2); 
    r = int (abs(summex));
    g = int (abs(summey));
    b = int (abs(summez));
    //stroke(r,g,b);  
    fill(r,g,b);                                                        //fill muste hier rein
    box(pos);
  }

   print("summe ");
   print(r);
   print("  ");
   print(g);
   print("  ");
   println(b);

  if(Vektorenliste.size() < 5000) {


    for(int warum = 0;warum<ran;warum++){

      int a = (int)random(6);
      
      switch(a) {
      case 0: 
        v = new PVector(pos,0 ,0);
        break;
      case 1: 
        v = new PVector(-pos,0,0);
        break;
      case 2: 
        v = new PVector(0,pos,0); 
        break;
      case 3: 
        v = new PVector(0,-pos,0); 
        break;
      case 4: 
        v = new PVector(0,0,pos); 
        break;
      default: 
        v = new PVector(0,0,-pos);
        break;      
      } 
      Vektorenliste.add(v);
    }
  }
    //mm.addFrame();
}

void keyPressed(){
  if (key == 's') {
  saveFrame("typo-####.tiff");
  }
 }




