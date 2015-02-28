
import interfascia.*;

GUIController c;
IFButton kite_attack, b2, petals_attack, petals_dash;
IFLabel l;


Player Kite;
Player Petals;
Player Ina;

Player Villain1;
Player Villain2;
Player Villain3;

int x, y, i, Ty, Ky, Py;
int tickCycle;
int KITE_TICK_GRAPH, PETALS_TICK_GRAPH, INA_TICK_GRAPH;
int currentTick, DV;
String playerName;
boolean PROCEED = true;

void setup() {
  size(1000, 600);
  currentTick = 1;
  Kite = new Player("Kite", 5,6);
  Petals = new Player("Petals", 6,4);
  Ina = new Player("Ina",6,7);
  
  Ky = 100 + (Kite.nextTick*20);
  println(Ky);
  
  Villain1 = new Player("Villain1",0,0);
  Villain2 = new Player("Villain2",0,0);
  Villain3 = new Player("Villain3",0,0);
  
  c = new GUIController (this);
  
  kite_attack = new IFButton ("Attack", 100, 100, 40, 17);
  b2 = new IFButton ("Dash", 160, 100, 40, 17);
  petals_attack = new IFButton ("Attack", 100, 200, 40, 17);

  kite_attack.addActionListener(this);
  b2.addActionListener(this);
  petals_attack.addActionListener(this);
  
  c.add (kite_attack);
  c.add (b2);
  c.add (petals_attack);

  PFont font;
  font = loadFont("Papyrus-48.vlw");
  textFont(font, 24);
//  text("test", 15, 30);

}

void draw() {

//  text("Kite:", 15, 30)
  background(0);
  fill(255);
   for(y = 80; y < 280; y = y + 20){
    for(x = 0; x < 240; x = x + 40) {
    rect(600 + x, y, 40, 20);
    }
  }
  Kite.actsNow(); 
  KITE_TICK_GRAPH = Kite.nextTick*75;
  fill(255, 0, 0);
  rect(15, 60, KITE_TICK_GRAPH, 25);
  text("DV ", 15, 120);
  text(Kite.DV, 65, 120);
  Petals.actsNow();
  PETALS_TICK_GRAPH = Petals.nextTick*75;
  fill(255, 0, 0);
  rect(15, 160, PETALS_TICK_GRAPH, 25);
  text("DV ", 15, 220);
  text(Petals.DV, 65, 220);
  text("K", 605, 60);
  text("P", 655, 60);

//  text("Acts In     Ticks", 15, 90);
//  text(Kite.nextTick, 95, 90);  
  
  text("Current Tick", 450, 300);
  text(currentTick, 450, 340);
  ellipse(575, 90 + (tickCycle*20), 10, 10);
  text(mouseX, 700, 375);
  text(mouseY, 740, 375);
  fill(0);
  text("X", 615, Ky);
  
  
  
}
  
class Player {
  String playerName;
  int nextTick;
  int DV;  
  int baseDV;
  
  Player(String name, int tillNext,int baseDV) {
    nextTick = tillNext;
    DV = baseDV;
    baseDV = baseDV;
  } 

  void actsNow() {
    if(nextTick == 0) {
      PROCEED = false;
    }
  }
}
  
void tick() {
      currentTick = currentTick + 1;
      tickCycle = tickCycle + 1;
      if(tickCycle > 9) {
        tickCycle = 1;
      }
      Kite.nextTick = Kite.nextTick - 1;
      Ina.nextTick = Ina.nextTick - 1;
//      Petals.nextTick = Petals.nextTick - 1;
      Villain1.nextTick = Villain1.nextTick - 1;
      Villain2.nextTick = Villain2.nextTick - 1;
      Villain3.nextTick = Villain3.nextTick - 1;
      if((Kite.nextTick == 0) || (Petals.nextTick == 0)){
        PROCEED = false; 
        Kite.DV = 6;
        Petals.DV = 4;
    }
  }

void keyPressed() {
  if(PROCEED == true) {
    tick();
  } else {
    println("Cannot Proceed");
  }
}

void actionPerformed (GUIEvent e) {
  if (e.getSource() == kite_attack) {
    if(!PROCEED) {
      Kite.nextTick = 5;
      Ky = Ky + (20*Kite.nextTick);
      if(Ky < 280) {
        Ky = 90; }
      Kite.DV = Kite.DV - 1;
      PROCEED = true;
  } else if (e.getSource() == b2) {
    background(100, 100, 130);
  } else if (e.getSource() == petals_attack) {
    if(!PROCEED) {
      Petals.nextTick = 5;
      Petals.DV = Petals.DV - 1;
      PROCEED = true;
}
}
  }
}

