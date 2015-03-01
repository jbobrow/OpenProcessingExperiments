
// simple economic thingy
// wallet size
// dependencies
int gold = 30;
int grate = 1;
int space = 2;
int usedspace = 0;
int houses = 0;
int usedhouses = 0;
int defense = 0;
int offense = 0;
int vps = 0;

int wood = 0;
int wrate = 0;

int maxgold = 30;
int maxwood = 20;

int enemyDefense = 0;
int enemyOffense = 0;

int counter = 0;

String msg = "Use number keys to build things.";

boolean flag = false;

boolean haveTradingPost = false;
boolean haveScout = false;

ArrayList<Unit> menu = new ArrayList<Unit>();
ArrayList<Unit> have = new ArrayList<Unit>();

void setup() {
  size(440,440);
  smooth();
  textAlign(LEFT, TOP);
  // provide start units
  // make the menu
  Unit u;
  u = new Unit("Soldier", 0, 0, 30, 20);
  u.off = 1;
  menu.add(u);
  u = new Unit("Barracks", 0, 0, 40, 30);
  u.space = 2;
  menu.add(u);
  u = new Unit("Sentry Tower", 0, 0, 20, 30);
  u.def = 3;
  menu.add(u);
  u = new Unit("Storage", 1, 0, 30, 20);
  menu.add(u);
  u = new Unit("Bank", 1, 0, 30, 20);
  menu.add(u);
  u = new Unit("Scout", 0, 0, 30, 0);
  u.space = 0; u.houses = 1;
  menu.add(u);
  u = new Unit("House", 1, 0, 10, 8);
  menu.add(u);
  u = new Unit("Trading Post", 0, 0, 10, 0);
  menu.add(u);
  u = new Unit("Sawmill", 0, 2, 10, 0);
  menu.add(u);
  u = new Unit("Land", 0, 0, 20, 0);
  u.space = 0;
  menu.add(u);
}

void draw() {
  //clear
  background(255);
  fill(0);
  // accumulate gold
  counter ++;
  if(counter > 60) {
    gold += grate;
    wood += wrate;
    for(Unit u : have) {
      gold += u.grate;
      wood += u.wrate;
    }
    counter = 0;
    gold = min(maxgold, gold);
    wood = min(maxwood, wood);
  }
  // show info
  float x = 10.0;
  float y = 10.0;
  float dy = 15.0;
  float dy2 = 30.0;
  float dx = 100.0;
  text("Gold: " + str(gold) + "/" + str(maxgold), x,y);
  text("Wood: " + str(wood) + "/" + str(maxwood), x + dx,y);
  text("Land: " + str(usedspace)+"/"+str(space), x + 2*dx,y);
  text("Houses: " + str(usedhouses)+"/"+str(houses), x + 3*dx,y);
  //text("VPs: " + str(vps), x + 240.0,y);
  y+=dy;
  text("Offense: " + str(offense), x,y);
  text("Defense: " + str(defense), x + dx,y);
  y+=dy;
  // get input
  // draw units
  y += dy2;
  for(int i = have.size() - 1; i >= 0; i--) {
    Unit u = have.get(i);
    text(u.name, x, y); y+=dy;
    // have trading post
    if(u.name == "Trading Post") haveTradingPost = true;
    // have bank/storage
    if(u.name == "Bank") maxgold = 60;
    if(u.name == "Storage") maxwood = 50;
  }
  // extras
  if(houses > 0) {
    text("House  x" + str(houses), x, y); y+=dy;
  }
  // draw menu
  y += dy2;
  int count = 1;
  for(int i = menu.size() - 1; i >= max(0, menu.size() - 4); i--) {
    Unit u = menu.get(i);
    text(str(count) + ": "+u.name, x, y);
    text(str(u.gcost) + " gold", x + 150.0, y);
    text(str(u.wcost) + " wood", x + 230.0, y);
    if(u.houses == 0) text(str(u.space) + " land", x + 310.0, y);
    else text(str(u.houses) + " house", x + 310.0, y);
    y+=dy;
    // build?
    if(keyPressed && !flag) {
      if(int(key) == count + 48) {
        if(wood >= u.wcost) {
          if(gold >= u.gcost) {
            // land?
            /*
            if(u.name == "Land") {
               // deduct cost
              wood -= u.wcost;
              gold -= u.gcost;
              space++;
              msg = "You purchased more Land.";
              flag = true;
            } else {
              if(usedspace <= space - u.space && usedhouses <= houses - u.houses) {
                // deduct cost
                wood -= u.wcost;
                gold -= u.gcost;
                usedspace += u.space;
                offense += u.off;
                defense += u.def;
                vps += u.vp;
                // add to units
                Unit v = u;
                have.add(v);
                menu.remove(u);
                flag = true;
                msg = "You built a " + v.name + ".";
              }
            }
            */
            // switch version
            if(usedspace <= space - u.space) {
              if(usedhouses <= houses - u.houses) {
                // flag
                // deduct costs / etc
                wood -= u.wcost;
                gold -= u.gcost;
                usedspace += u.space;
                usedhouses += u.houses;
                offense += u.off;
                defense += u.def;
                vps += u.vp;
                                 println(u.name);
                // special things
                boolean built = false;
                if(u.name == "Land") {
                    space++;
                    built = true;
                }
                if(u.name == "House") {
                    houses++;
                    built = true;
                }
                if(!built) {
                    Unit v = u;
                    have.add(v);
                    menu.remove(u);
                    built = true;
                }
                // trigger flag
                if(built) flag = true;
              }
            }
          }
        }
      }
    }
    // inc count
    count++;
  }
  // buy and sell
  y += dy2;
  if(haveTradingPost) {
    text("[s]ell 10 wood for 8 gold.", x, y); y += dy;
    text("[b]uy 8 wood for 10 gold.", x, y); y += dy;
    // buy and sell
    if(wood >= 10 && keyPressed && (key == 's' || key == 'S') && !flag) {
      wood -= 10;
      gold += 8;
      flag = true;
    }
    if(gold >= 10 && keyPressed && (key == 'b' || key == 'B') && !flag) {
      wood += 8;
      gold -= 10;
      flag = true;
    }
  }
  // message
  y += dy2;
  text(msg, x, y); y += dy;
  // release flag
  if(!keyPressed) {
    flag = false;
  }
}


// units
class Unit {
  String name = "unit";
  int wcost = 0;
  int gcost = 10;
  int wrate = 0;
  int grate = 0;
  int vpoints = 0;
  int space = 1;
  int houses = 0;
  int vp = 0;
  int off = 0;
  int def = 0;
  ArrayList<String> need = new ArrayList<String>();
  
  Unit(String s, int g, int w, int gc, int wc) {
    name = s;
    grate = g;
    wrate = w;
    gcost = gc;
    wcost = wc;
  }
}

void keyPressed() {
}
