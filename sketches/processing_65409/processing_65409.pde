
static final int NUM_DRONES = 1500;
static final int NUM_FIX = 700;
static final int NUM_SWARM = 15;
static final float INNER_RANGE = 70;     //Innenradius des Rotationskreises
static final float OUTER_RANGE = 700;     //Außenradius des Rotationskreises



Swarm[] swarms = new Swarm[NUM_SWARM];                            //Hier wird die Schwarm Anzahl definiert & die class Schwarm aufgerufen
AFixsterne[] myFixsterne= new AFixsterne[NUM_FIX];               //Hier wird die Fixstern Anzahl definiert & die class Fixsterne aufgerufen


float t;
int count;
int auswahl= 50, auswahl2 = 50;
float CircleSize= 0;
int Kreisstart= 40;
int time=1;
int mouseCount;                                              //Zählt wie oft die Maus geklickt wurde


void setup() {
  size(640, 480);
  stroke(0xcc);

  for (int i= 0; i<myFixsterne.length; i++) {              //Hier im Setup werden einmalig die Fixsterne erzeugt
    myFixsterne[i]= new AFixsterne();
    myFixsterne[i].id= i;
  }

  for (int i=0; i<swarms.length;i++) {
    swarms[i] = new Swarm(int(width/2 + width*sin (radians(360/swarms.length*i))), int(1.3*height + height*cos (radians(360/swarms.length*i))), i);         // Hier wird die Position des jeweiligen Zirkels berechnet
  }
  t = millis() * 1e-3;
}

void draw() {

  time= time+1;
  float dt = -t;
  t = millis() * 1e-3;
  dt += t;
  background(0x11);
  

  

  for (int i=0; i<swarms.length;i++) {
    noFill();
    stroke(255);
    swarms[i].update(dt);
    swarms[i].render();
  }
  

//  for (int i=0; i<myFixsterne.length; i++) {
//    myFixsterne[i].jump();
//    myFixsterne[i].render();
//  }
  
  
  
   noStroke ();                                                      //Hier wird der Hauptplanet gerändert
         fill (35, 50);
         ellipse(width/2, height*1.05, width/1, width/1.5);  
         fill (40, 50);
         ellipse(width/2, height*1.05, width/1.5, width/2); 
         fill (50, 50);
         ellipse(width/2, height*1.05, width/2, width/2.5); 
         fill (60, 50);
         ellipse(width/2, height*1.05, width/2.5, width/3); 
         fill (70, 50);
         ellipse(width/2, height*1.05, width/3, width/3.5);  
         fill (80, 50);
         ellipse(width/2, height*1.05, width/3.5, width/4); 
         fill (90, 50);
         ellipse(width/2, height*1.05, width/4, width/4.5); 
         fill (100, 50);
         ellipse(width/2, height*1.05, width/4.5, width/5);
        
         fill (255);
         ellipse(width/2, height*1.05, width/9, width/9); 
         stroke (255);
  
  
}



void mousePressed() {                                        //Neue Void Funktion zum Mausklick zählen
mouseCount++;                                                //Wenn die Maus gedrückt wir, zählt er hoch
if (mouseCount>NUM_SWARM) {                                  //Aber nicht höher als die Anzahl der Schwärme
  mouseCount= 0;                                             //Danach springt er wieder auf 0
  }
}


