

import controlP5.*;

//--------------------------------------------------//
//                  CONSTANTES                      //
//--------------------------------------------------//

float R   = 15;
float dt  = 2e-2;
float k   = 500;
float M   = 50;
float Cv  = 1e-2;
float g0  = 300;

float abs1 = 0.02;
float abs2 = 0.05;
float abs3 = 0.6;

float setRange    = 50;
double addtimer   = 0;
float default_len = setRange;
boolean gravity   = true;
boolean mouseGVel = true;
float colPart     = 1;
float colRod      = 80;
float cRupt       = 1.25;
float inK         = 1500;

float Width  = 4;
float Height = 4;
float res    = 30;

int Nstart = 0;

// CONTROLES
ControlP5 mycontrol;
ControlWindow myCwin;
Textlabel myLabel;

Slider S1;
Slider S2;
Slider S3;
Slider S4;
Slider S5;
Slider S6;
Slider S7;
Slider S8;
Slider S9;
Slider S10;
Slider S11;
Slider S12;
Slider S13;

Toggle T1;

String myText = " a   = add particle \n\n z   = add rod \n\n d,c = add element \n\n s   = cut rod \n\n r   = restart \n\n g   = grip mode \n\n q   = quick gravity on/off \n\n f,v = see element size/position \n\n space = autoLink";

// MASSES
PARTICLE[] part;
// RESSORTS
ROD[] rod;

// NOEUDS FIXES
PARTICLE[] node;

// POUR NOUVEAU RESSORT
PARTICLE START;
PARTICLE END;
boolean start = false;
boolean end   = false;

//--------------------------------------------------//
//                      SETUP                       //
//--------------------------------------------------//

void setup() {
  size(700, 700, P2D);
  background(0);
  stroke(255);
  frameRate(60);

  // CONTROLES
  mycontrol = new ControlP5(this);
  mycontrol.setAutoDraw(true);
  myCwin = mycontrol.addControlWindow("Controls", 10, 100, 215, 700);
  mycontrol.setControlFont(new ControlFont(createFont("Georgia", 15), 15));

  mycontrol.addToggle("Gravity", gravity, 50, 10, 25, 20);
  mycontrol.addSlider("Range", 0, 100, setRange, 10, 50, 100, 20);
  mycontrol.addSlider("Elasticity", 0, 2000, k, 10, 75, 100, 20);
  mycontrol.addSlider("Col_part", 0, 2, colPart, 10, 100, 100, 20);
  mycontrol.addSlider("Col_rod", 10, 100, colRod, 10, 125, 100, 20);
  mycontrol.addSlider("abs_part", 0, 1, abs1, 10, 150, 100, 20);
  mycontrol.addSlider("abs_rod", 0, 1, abs2, 10, 175, 100, 20);
  mycontrol.addSlider("Width", 2, 20, Width, 10, 200, 100, 20);
  mycontrol.addSlider("Height", 2, 20, Height, 10, 230, 100, 20);
  mycontrol.addSlider("res", 2, 50, res, 10, 260, 100, 20);
  mycontrol.addSlider("Radius", 2, 50, R, 10, 290, 100, 20);
  mycontrol.addSlider("Mass", 10, 500, M, 10, 320, 100, 20);
  mycontrol.addSlider("Cv", 1, 2000, Cv, 10, 350, 100, 20);
  mycontrol.addSlider("innerK", 100, 3000, inK, 10, 420, 100, 20);


  myLabel = mycontrol.addTextlabel("label", myText, 10, 500);

  T1  = (Toggle)mycontrol.controller("Gravity");
  S1  = (Slider)mycontrol.controller("Range");
  S2  = (Slider)mycontrol.controller("Elasticity");
  S3  = (Slider)mycontrol.controller("Col_part");
  S4  = (Slider)mycontrol.controller("abs_part");
  S5  = (Slider)mycontrol.controller("abs_rod");
  S6  = (Slider)mycontrol.controller("Col_rod");
  S7  = (Slider)mycontrol.controller("Width");
  S8  = (Slider)mycontrol.controller("Height");
  S9  = (Slider)mycontrol.controller("res");
  S10 = (Slider)mycontrol.controller("Radius");
  S11 = (Slider)mycontrol.controller("Mass");  
  S12 = (Slider)mycontrol.controller("Cv");  
  S13 = (Slider)mycontrol.controller("innerK");  

  S7.setNumberOfTickMarks(25);
  S8.setNumberOfTickMarks(25);
  S9.setNumberOfTickMarks(25);
  S10.setNumberOfTickMarks(25);  
  S3.setNumberOfTickMarks(3);

  T1.setWindow(myCwin);
  S1.setWindow(myCwin);
  S2.setWindow(myCwin);
  S3.setWindow(myCwin);
  S4.setWindow(myCwin);
  S5.setWindow(myCwin);
  S6.setWindow(myCwin);
  S7.setWindow(myCwin);
  S8.setWindow(myCwin);
  S9.setWindow(myCwin);
  S10.setWindow(myCwin);
  S11.setWindow(myCwin);
  S12.setWindow(myCwin);
  S13.setWindow(myCwin);

  myLabel.setWindow(myCwin);
  
  // PARTICULES
  part = new PARTICLE[0];

  for (int i = 0; i<Nstart; i++) 
  {
    PARTICLE NP = new PARTICLE(random(2, width-2), random(2, height-2), 20, 8);
    part = (PARTICLE[])append(part, NP);
  }

  // RESSORT
  rod = new ROD[0];

  // NOEUDS FIXES
  node = new PARTICLE[5];

  node[0] = new PARTICLE(+10., +10., 10., 10.);
  node[1] = new PARTICLE(+10., height-10., 10., 10.);
  node[2] = new PARTICLE(width-10., height-10., 10., 10.);
  node[3] = new PARTICLE(width-10., 10., 10., 10.);
  node[4] = new PARTICLE(width/2., 10., 10., 10.);

  START = node[0];
  END   = node[0];

  print(part.length);
  println(" particles ");
  print(rod.length);
  println(" rods ");
}


//--------------------------------------------------//
//                     DRAW                         //
//--------------------------------------------------//

void draw() {
  background(0);
  cursor(ARROW);

  // KEYBOARD (HIGH RATE)
  if (keyPressed) 
  { 
    // LIEN DE PROXIMITE
    if (key == ' ') {
      autoLink(setRange);
    }
    // COUPER UN RESSORT (AU MILIEU)
    if (key == 's') {
      cursor(CROSS);
      cutRod();
    }
    // PROJECTION ELEMENT CARRE
    if (key == 'f') {
      fill(255, 255, 0);
      rect(mouseX-Width/2*res, mouseY-Height/2*res, Width*res, Height*res);
    }
    // PROJECTIO ELEMENT CIRCULAIRE
    if (key == 'v') {
      fill(255, 255, 0);
      ellipse(mouseX, mouseY, 2*Width*res, 2*Width*res);
    }
    // AJOUT DE RESSORT A LA MAIN (Z+SOURIS)
    if (key == 'z') {
      boolean startNode=false;
      boolean finishNode=false;
      if (millis()-addtimer>1000) {
        // RESTART TIMER
        if (mousePressed==false && keyPressed==false) {
          addtimer = millis();
          START    = node[0];
          END      = node[0];
          start    = false;
          end      = false;
        } 
        // LIER AUX PARTICULES
        for (int i=0; i<part.length; i++) {
          float dx = part[i].x - mouseX;
          float dy = part[i].y - mouseY;
          float di = sqrt(dx*dx+dy*dy);
          if (di<=part[i].rad && !start) {
            START = part[i];
            start = true;
          }
          if (di<=part[i].rad && start) {
            if (mousePressed) {
              END   = part[i];
              end   = true;
              END.linked = true;
            }
          }
        }
        // LIER AUX NOEUDS FIXES
        for (int i=0; i<node.length; i++) {
          float dx = node[i].x - mouseX;
          float dy = node[i].y - mouseY;
          float di = sqrt(dx*dx+dy*dy);
          if (di<=node[i].rad && !start) {
            START = node[i];
            start = true;
            startNode=true;
          }
          if (di<=node[i].rad && start) {
            if (mousePressed) {
              END   = node[i];
              end   = true;
              finishNode=true;
            }
          }
        }
        // POUR CREER UN LIEN Z+SOURIS
        // DEPART
        if (start)
        {
          stroke(255, 255, 0);
          line(START.x, START.y, mouseX, mouseY);
        }
        // FIN
        if (end) {
          if (!startNode) START.linked=true;
          if (!finishNode) END.linked=true;

          float dij = sqrt((START.x-END.x)*(START.x-END.x)+(START.y-END.y)*(START.y-END.y));
          rod       = (ROD[])append(rod, new ROD(START, END, dij));
          START     = node[0];
          END       = node[0];
          end       = false;
          start     = false;
          addtimer  = millis();
        }
      }
    }
  }

  // PRENDRE LES PARTICUELES A LA SOURIS
  if (mousePressed && !(keyPressed && key == 'z')) dragAndDrop();

  // MISE A JOUR PARTICULES
  for (int i=0; i<part.length; i++) {

    // INTERACTION
    for (int j=0; j<part.length; j++) {

      if (i!=j) {
        float dx = part[i].x - part[j].x;
        float dy = part[i].y - part[j].y;
        float d  = sqrt(dx*dx+dy*dy);

        // INTERACTION ELASTIQUE DE CONTACT
        if (d <= part[i].rad+part[j].rad) {
          boolean linked = false;
          for (int u=0; u<rod.length; u++) {

            if (rod[u].pi==part[i] && rod[u].pj==part[j]) {
              linked=true;
            }

            if (rod[u].pj==part[i] && rod[u].pi==part[j]) {
              linked=true;
            }
          }
          // SI NON CONNECTE
          if (linked==false) {
            float dvx  = part[i].xvel-part[j].xvel;
            float dvy  = part[i].yvel-part[j].yvel;          
            float fx   = -inK*((d-(part[i].rad+part[j].rad)+Cv*dvx))*dx;
            float fy   = -inK*((d-(part[i].rad+part[j].rad)+Cv*dvy))*dy;
            part[i].xvel += fx * dt / part[i].mass * (1-abs3);
            part[i].yvel += fy * dt / part[i].mass * (1-abs3);
          }
        }
      }
    }
    part[i].update(dt);

    if (T1.getState()==true) {
      // ON PEUT AJOUTER UNE PARTICULE "FLOTTANTE"
      // DANS LE CHAMP D'ACCELERATION ACTIF (toggle vs q)
      part[i].gravity = gravity;
    }
  }

  // MISE A JOUR RESSORTS
  for (int i=0; i<rod.length; i++) {

    // RUPTURE
    if (rod[i].broken) {  
      // MISE A JOUR DES LIENS ACTIFS
      for (int h=0; h<part.length; h++) {
        boolean everlinked = false;
        if (rod[i].pi==part[h] || rod[i].pj==part[h]) 
        {
          everlinked     = true;
          part[h].linked = everlinked;
          continue;
        }
      }

      // ON RETIRE LE LIEN ROMPU
      ROD[] sub1 = (ROD[])subset(rod, 0, i);
      if (rod.length>1 && i<rod.length) {
        ROD[] sub2 = (ROD[])subset(rod, i+1);
        rod=(ROD[])concat(sub1, sub2);
      }
      else {
        rod=sub1;
      }
    }

    // MISE A JOUR DES LIENS VIVANTS
    else {
      rod[i].update(dt);
    }
  }

  // ON FORCE LES NOEUDS FIXES A L'ARRET
  for (int i=0; i<node.length; i++) {
    node[i].xvel = 0;
    node[i].yvel = 0;
    node[i].update(dt);
  }
  mycontrol.draw();
}



