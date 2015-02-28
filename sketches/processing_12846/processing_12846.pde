
import interfascia.*;
 
GUIController c;
IFButton kite_attack, kite_dash, kite_aim, petals_attack, petals_dash, petals_aim, ina_attack, ina_dash, ina_aim, 
villain1_attack, villain1_dash, villain1_aim, villain2_attack, villain2_dash, villain2_aim, villain3_attack, villain3_dash, villain3_aim;
IFLabel l;
 
 
Player Kite;
Player Petals;
Player Ina;
 
Player Villain1;
Player Villain2;
Player Villain3;
 
int x, y, i, Ty, Ky, Py;
int tickCycle;
int KITE_TICK_GRAPH, PETALS_TICK_GRAPH, INA_TICK_GRAPH, VILLAIN1_TICK_GRAPH, VILLAIN2_TICK_GRAPH, VILLAIN3_TICK_GRAPH;
int currentTick, DV;
String playerName;
boolean PROCEED = true;
boolean kite_ACTION = false;
 
void setup() {
  size(1000, 600);
  currentTick = 1;
// The Player Characters  
  Kite = new Player("Kite", 5,6);
  Petals = new Player("Petals", 4,4);
  Ina = new Player("Ina",6,7);
 
// The NPC Villains  
  Villain1 = new Player("Villain1",5,5);
  Villain2 = new Player("Villain2",6,7);
  Villain3 = new Player("Villain3",4,4);
   
  c = new GUIController (this);
  
  kite_attack = new IFButton ("Attack", 100, 100, 40, 17);
  kite_dash = new IFButton ("Dash", 160, 100, 40, 17);
  kite_aim = new IFButton ("Aim", 220, 100, 40, 17);
  petals_attack = new IFButton ("Attack", 100, 200, 40, 17);
  petals_dash = new IFButton ("Dash", 160, 200, 40, 17);
  petals_aim = new IFButton ("Aim", 220, 200, 40, 17);
  ina_attack = new IFButton ("Attack", 100, 300, 40, 17);
  ina_dash = new IFButton ("Dash", 160, 300, 40, 17);
  ina_aim = new IFButton ("Aim", 220, 300, 40, 17);
  villain1_attack = new IFButton ("Attack", 600, 100, 40, 17);
  villain1_dash = new IFButton ("Dash", 660, 100, 40, 17);
  villain1_aim = new IFButton ("Aim", 720, 100, 40, 17);
  villain2_attack = new IFButton ("Attack", 600, 200, 40, 17);
  villain2_dash = new IFButton ("Dash", 660, 200, 40, 17);
  villain2_aim = new IFButton ("Aim", 720, 200, 40, 17);
  villain3_attack = new IFButton ("Attack", 600, 300, 40, 17);
  villain3_dash = new IFButton ("Dash", 660, 300, 40, 17);
  villain3_aim = new IFButton ("Aim", 720, 300, 40, 17);
  
  
  kite_attack.addActionListener(this);
  kite_dash.addActionListener(this);
  kite_aim.addActionListener(this);
  petals_attack.addActionListener(this);
  petals_dash.addActionListener(this);
  petals_aim.addActionListener(this);
  ina_attack.addActionListener(this);
  ina_dash.addActionListener(this);
  ina_aim.addActionListener(this);
  villain1_attack.addActionListener(this);
  villain1_dash.addActionListener(this);
  villain1_aim.addActionListener(this);
  villain2_attack.addActionListener(this);
  villain2_dash.addActionListener(this);
  villain2_aim.addActionListener(this);
  villain3_attack.addActionListener(this);
  villain3_dash.addActionListener(this);
  villain3_aim.addActionListener(this);
   
   
   
  c.add (kite_attack);
  c.add (kite_dash);
  c.add (kite_aim);
  c.add (petals_attack);
  c.add (petals_dash);
  c.add (petals_aim);
  c.add (ina_attack);
  c.add (ina_dash);
  c.add (ina_aim);
  c.add (villain1_aim);
  c.add (villain1_attack);
  c.add (villain1_dash);
  c.add (villain2_aim);
  c.add (villain2_attack);
  c.add (villain2_dash);
  c.add (villain3_aim);
  c.add (villain3_attack);
  c.add (villain3_dash);
 
  PFont font;
  font = loadFont("Purisa-Bold-48.vlw");
  textFont(font, 24);
}
 
void draw() {
 
//  text("Kite:", 15, 30)
// This following commented out code is an alterntive visualization
// for the ticks and the passage of time using a grid system.
  background(0);
  fill(255);
//   for(y = 80; y < 280; y = y + 20){
//    for(x = 0; x < 240; x = x + 40) {
//    rect(600 + x, y, 40, 20);
//    }
//  }

// Changes the cursor once an action can be perform
  if(!PROCEED) {
    cursor(HAND); 
  } else {
    cursor(CROSS); 
  }


// This text controls the visulizations for all of the characters
// action bars as well as their associated texts.

  Kite.actsNow();
  fill(255);
  if(Kite.nextTick == 0){
    text("Kite Acts Now!", 15, 150);
  }
  KITE_TICK_GRAPH = 360-(Kite.nextTick*60);
  fill(255, 0, 0);
  rect(15, 60, KITE_TICK_GRAPH, 25);
  triangle(370, 40, 380, 40, 375, 50);
  text("DV ", 15, 120);
  text(Kite.DV, 65, 120);
  Petals.actsNow();
  fill(255);
  if(Petals.nextTick == 0){
    text("Petals Acts Now!", 15, 250);
  }
  PETALS_TICK_GRAPH = 360-(Petals.nextTick*60);
  fill(255, 0, 0);
  rect(15, 160, PETALS_TICK_GRAPH, 25);
  triangle(370, 140, 380, 140, 375, 150);
  text("DV ", 15, 220);
  text(Petals.DV, 65, 220);
  Ina.actsNow();
  fill(255);
  if(Ina.nextTick == 0){
    text("Ina Acts Now!", 15, 350);
  }
  INA_TICK_GRAPH = 360-(Ina.nextTick*60);
  fill(255, 0, 0);
  rect(15, 260, INA_TICK_GRAPH, 25);
  triangle(370, 240, 380, 240, 375, 250);
  text("DV", 15, 320);
  text(Ina.DV, 65, 320);
  Villain1.actsNow();
  fill(255);
  if(Villain1.nextTick == 0) {
    text("Villain 1 Acts Now!",515, 150);
  }
  VILLAIN1_TICK_GRAPH = 360-(Villain1.nextTick*60);
  fill(255, 0, 0);
  rect(500, 60, VILLAIN1_TICK_GRAPH, 25);
  triangle(855, 40, 865, 40, 860, 50);
  text("DV", 515, 120);
  text(Villain1.DV, 565, 120);
  Villain2.actsNow();
  fill(255);
  if(Villain2.nextTick == 0) {
    text("Villain 2 Acts Now!",515, 250);
  }
  VILLAIN2_TICK_GRAPH = 360-(Villain2.nextTick*60);
  fill(255, 0, 0);
  rect(500, 160, VILLAIN2_TICK_GRAPH, 25);
  triangle(855, 140, 865, 140, 860, 150);
  text("DV", 515, 220);
  text(Villain2.DV, 565, 220);
  Villain3.actsNow();
  fill(255);
  if(Villain3.nextTick == 0) {
    text("Villain 3 Acts Now!",515, 350);
  }
  VILLAIN3_TICK_GRAPH = 360-(Villain3.nextTick*60);
  fill(255, 0, 0);
  rect(500, 260, VILLAIN3_TICK_GRAPH, 25);
  triangle(855, 240, 865, 240, 860, 250);
  text("DV", 515, 320);
  text(Villain3.DV, 565, 320);

//These letters and the ellipse are part of the unused grid system
//  text("K", 605, 60);
//  text("P", 655, 60);
//  text("I", 705, 60);
//  ellipse(575, 90 + (tickCycle*20), 10, 10);
//  fill(0);
//  text("X", 615, Ky);
   
  text("Current Tick: ", 400, 450);
  text(currentTick, 600, 450);
}
   
class Player {
  String str = playerName;
  int nextTick;
  int DV; 
  int normalDV;
   
  Player(String name, int tillNext,int baseDV) {
    nextTick = tillNext;
    DV = baseDV;
    normalDV = baseDV;
  }
 
  void actsNow() {
    if(nextTick == 0) {
      PROCEED = false;
    }
  }
}
   
void tick() {
      currentTick = currentTick + 1;
      Kite.nextTick = Kite.nextTick - 1;
      Ina.nextTick = Ina.nextTick - 1;
      Petals.nextTick = Petals.nextTick - 1;
      Villain1.nextTick = Villain1.nextTick - 1;
      Villain2.nextTick = Villain2.nextTick - 1;
      Villain3.nextTick = Villain3.nextTick - 1;
      if(Kite.nextTick == 0){
        PROCEED = false;
        Kite.DV = Kite.normalDV;
      }
      else if(Petals.nextTick == 0) {
        PROCEED = false;
        Petals.DV = Petals.normalDV;
      }
      else if(Ina.nextTick == 0) {
        PROCEED = false;
        Ina.DV = Ina.normalDV;  
      }
      else if(Villain1.nextTick == 0) {
        PROCEED = false;
        Villain1.DV = Villain1.normalDV;
      }
      else if(Villain2.nextTick == 0) {
        PROCEED = false;
        Villain2.DV = Villain2.normalDV;
      }
      else if(Villain3.nextTick == 0) {
        PROCEED = false;
        Villain3.DV = Villain3.normalDV;
      }
}
 
void keyPressed() {
  if(PROCEED == true) {
    tick();
  }
}
 
void actionPerformed (GUIEvent e) {
  if (e.getSource() == kite_attack) {
    if(!PROCEED) {
      Kite.nextTick = 5;
      if(Ky < 280) {
        Ky = 90; }
      Kite.DV = Kite.DV - 1;
      PROCEED = true;
} else if (e.getSource() == kite_dash) {
    if(!PROCEED) {
      Kite.nextTick = 3;
      Kite.DV = Kite.DV - 2;
      PROCEED = true;
    }
  }
} else if (e.getSource() == petals_attack) {
  if(!PROCEED) {
    Petals.nextTick = 5;
    Petals.DV = Petals.DV - 1;
    PROCEED = true;
    }
  }
 else if (e.getSource() == petals_dash) {
  if(!PROCEED) {
    Petals.nextTick = 3;
    Petals.DV = Petals.DV - 2;
    PROCEED = true;
  }
}
  else if (e.getSource() == ina_attack) {
    if(!PROCEED) {
      Ina.nextTick = 5;
      Ina.DV = Ina.DV - 1;
      PROCEED = true;
    }
  }
  else if (e.getSource() == ina_dash) {
    if(!PROCEED) {
      Ina.nextTick = 3;
      Ina.DV = Ina.DV - 2;
      PROCEED = true;
    }
  }
  else if (e.getSource() == ina_aim) {
    if(!PROCEED) {
      Ina.nextTick = 3;
      Ina.DV = Ina.DV -2;
      PROCEED = true;
    }
  }
  else if (e.getSource() == villain1_attack) {
    if(!PROCEED) {
      Villain1.nextTick = 5;
      Villain1.DV = Villain1.DV - 1;
      PROCEED = true; 
    }
  }
  else if (e.getSource() == villain1_dash) {
    if(!PROCEED) {
      Villain1.nextTick = 3;
      Villain1.DV = Villain1.DV -2;
      PROCEED = true;
    }
  }
  else if (e.getSource() == villain1_aim) {
    if(!PROCEED) {
      Villain1.nextTick = 3;
      Villain1.DV = Villain1.DV -1;
      PROCEED = true;
    }
  }
   else if (e.getSource() == villain2_attack) {
    if(!PROCEED) {
      Villain2.nextTick = 5;
      Villain2.DV = Villain2.DV - 1;
      PROCEED = true; 
    }
  }
  else if (e.getSource() == villain2_dash) {
    if(!PROCEED) {
      Villain2.nextTick = 3;
      Villain2.DV = Villain2.DV -2;
      PROCEED = true;
    }
  }
  else if (e.getSource() == villain2_aim) {
    if(!PROCEED) {
      Villain2.nextTick = 3;
      Villain2.DV = Villain2.DV -1;
      PROCEED = true;
    }
  }
   else if (e.getSource() == villain3_attack) {
    if(!PROCEED) {
      Villain3.nextTick = 5;
      Villain3.DV = Villain3.DV - 1;
      PROCEED = true; 
    }
  }
  else if (e.getSource() == villain3_dash) {
    if(!PROCEED) {
      Villain3.nextTick = 3;
      Villain3.DV = Villain3.DV -2;
      PROCEED = true;
    }
  }
  else if (e.getSource() == villain3_aim) {
    if(!PROCEED) {
      Villain3.nextTick = 3;
      Villain3.DV = Villain3.DV -1;
      PROCEED = true;
    }
  }
}


