
PImage theShark;
PImage seaturtle;
PImage fish;



ArrayList<shark> SharkObjs = new ArrayList<shark>();
ArrayList<seaturtle> seaturtleObjs = new ArrayList<seaturtle>();

ArrayList<fish> fishObjs = new ArrayList<fish>();
ArrayList<phytoplankton> phyObjs = new ArrayList<phytoplankton>();
ArrayList<zooplankton> zooObjs = new ArrayList<zooplankton>();



void setup() {
  size(600, 500);
  background(250);
 
 
 
  theShark = loadImage("shark.gif");
  theShark.resize(100, 75);    
  seaturtle = loadImage("seaturtle.jpg");
  seaturtle.resize(80, 70);
   fish = loadImage("fish.jpg");
   fish.resize(50, 50);
  





 noLoop();
  sharkMethod(0);
  turtleMethod(0);
  fishMethod(0);
  phyMethod(0);
  zooMethod(0);
}


void sharkMethod(int b) {
  int  hitCounter = 0;


  if (b == 0) {

    int l = 35;
    ArrayList<shark> temp = new ArrayList<shark>();
    temp = SharkObjs;
    for (int w = 90, c = 0; c < 1 ;  c++) {


      int amount = SharkObjs.size();
      if (amount > 5) {


        w-=(amount) * 100;

        l+=75;
        shark toAdd = new shark(w, l);
        SharkObjs.add(toAdd);
      }
      else if (amount <5) {
        w+=  SharkObjs.size() * 100;
        shark toAdd = new shark(w, l);
        SharkObjs.add(toAdd);
      }
     
      turtleMethod(1);

      redraw();
    }
  }
  else if (b == 1) {
    if (SharkObjs.size() > 1 ) {
      SharkObjs.remove(SharkObjs.size()-1 );
      turtleMethod(0);
    }
  }
}


void turtleMethod(int b) {
  int  hitCounter = 0;
  if ( b == 0) {

    hitCounter++;

    int l = 200;
    for (int w = 50, counter = 0; counter< 1 ; counter++) {
      int x = seaturtleObjs.size();

      if (x>=9) {
        w-=(x) * 80;

        l+=70;
        seaturtle toAdd = new seaturtle(w, l);
        seaturtleObjs.add(toAdd);
      }
      else if (x<9) {
        w+= seaturtleObjs.size() * 80;
        seaturtle toAdd = new seaturtle(w, l);
        seaturtleObjs.add(toAdd);
      }
      fishMethod(1);
      redraw();
    }
  }
  else if ( b == 1) {

    int half = seaturtleObjs.size()/4;
    for (int i = seaturtleObjs.size() -1 ; i > half; i--) {
      seaturtleObjs.remove(i);
    }

    fishMethod(0);
    redraw();
  }
}
void fishMethod(int b) {
  int  hitCounter = 0;
  if (b == 0) {
   
    hitCounter++;

    int l = 300;
    for (int w = 10, counter = 0; counter< 1 ; counter++) {
      int x = fishObjs.size();

      if (x>=16) {
        w-=(x) * 50;

        l+=50;
        fish toAdd = new fish(w, l);
        fishObjs.add(toAdd);
      }
      else if (x<16) {
        w+= fishObjs.size() * 50;
        fish toAdd = new fish(w, l);
        fishObjs.add(toAdd);
      }
      phyMethod(1);
      redraw();
    }
  }
  else if ( b == 1) {

    int quarter = (fishObjs.size()/4);
    for (int i = fishObjs.size() -1 ; i > quarter ; i--) {
      fishObjs.remove(i);
    }

    phyMethod(0);
    redraw();
  }
}

void phyMethod(int b) {
  int  hitCounter = 0;
  if (b == 0) {
    //add members
    hitCounter++;

    int l = 400;
    for (int w = 10, counter = 0; counter< 1 ; counter++) {
      int x = phyObjs.size();

      if (x>=37) {
        w-=(x) * 20;

        l+=20;
        phytoplankton toAdd = new phytoplankton(w, l);
        phyObjs.add(toAdd);
      }
      else if (x<37) {
        w+= phyObjs.size() * 20;
        phytoplankton toAdd = new phytoplankton(w, l);
        phyObjs.add(toAdd);
      }
      zooMethod(1);
      redraw();
    }
  }
  else if ( b == 1) {

    int alot = (phyObjs.size()/4) * 3;
    for (int i = phyObjs.size() -1 ; i > alot ; i--) {
      phyObjs.remove(i);
    }

    zooMethod(0);
    redraw();
  }
}
void zooMethod(int b) {
  int  hitCounter = 0;
  if ( b == 0) {

    hitCounter++;
    int jkay = 0;
    while (jkay<5) {
      int l = 450;
      for (int w = 15, counter = 0; counter< 1 ; counter++) {
        int x = zooObjs.size();

        if (x>=50) {
          w-=(x) * 15;

          l+=20;
          zooplankton toAdd = new zooplankton(w, l);
          zooObjs.add(toAdd);
        }
        else if (x<50) {
          w+= zooObjs.size() * 15;
          zooplankton toAdd = new zooplankton(w, l);
          zooObjs.add(toAdd);
        }

        redraw();
        jkay++;
      }
    }
  }
  else if (b == 1) {

    int alot = zooObjs.size()/2;
    for (int i = zooObjs.size() -1 ; i > alot ; i--) {
      zooObjs.remove(i);
    }

    redraw();
  }
}





void mouseClicked() {
  int MyX = mouseX;
  int MyY = mouseY;

  boolean sharkClicked = false;
  boolean seaturtleClicked = false;
  boolean fishClicked = false;
  boolean phyClicked = false;
  boolean zooClicked = false;

  for ( shark o : SharkObjs) {
    if (clicked(o, MyX, MyY)) {

      sharkClicked = true;
    }
  }
  for ( seaturtle o : seaturtleObjs) {
    if (clicked(o, MyX, MyY)) {

      seaturtleClicked = true;
    }
  }
  for (fish o : fishObjs) {
    if (clicked(o, MyX, MyY)) {

      fishClicked = true;
    }
  }
  for ( phytoplankton o : phyObjs) {
    if (clicked(o, MyX, MyY)) {

      phyClicked = true;
    }
  }
  for ( zooplankton o : zooObjs) {
    if (clicked(o, MyX, MyY)) {

      zooClicked = true;
    }
  }


  if ( sharkClicked && mouseButton ==LEFT ) {
    sharkMethod(0);
  }
  if ( sharkClicked && mouseButton == RIGHT ) {
    sharkMethod(1);
  }
  if ( seaturtleClicked && mouseButton == LEFT ) {
    turtleMethod(0);
  }
  if ( seaturtleClicked && mouseButton == RIGHT ) {
    turtleMethod(1);
  }

  if ( fishClicked && mouseButton == LEFT ) {
    fishMethod(0);
  }
  if ( fishClicked && mouseButton == RIGHT ) {
    fishMethod(1);
  }

  if ( phyClicked && mouseButton == LEFT ) {
    phyMethod(0);
  }
  if ( phyClicked && mouseButton == RIGHT ) {
    phyMethod(1);
  }

  if ( zooClicked && mouseButton == LEFT ) {
    zooMethod(0);
  }
  if ( zooClicked && mouseButton == RIGHT ) {
    zooMethod(1);
  }
}
public boolean clicked(Organism o, int mX, int mY) {
  int newX = o.getWidth() + o.getX();
  int newY = o.getLength() + o.getY();
  if ((mX >= o.getWidth() && mX<= newX) && mY >= o.getLength() && mY <= newY) {

    return true;
  }
  return false;
}
class Organism {
  int widthx;
  int lengthx;
  int locX;
  int locY;
  public int getWidth() {
    return widthx;
  }
  public int getLength() {
    return lengthx;
  }
  public int getX() {
    return locX;
  }
  public int getY() {
    return locY;
  }
}
class shark extends Organism {
  
  int locX = 100;
  int locY = 75;

  public shark(int w, int l) {

    widthx = w;
    lengthx = l;
   
  }

  public int getX() {
    return locX;
  }
  public int getY() {
    return locY;
  }

  void render() {
    image(theShark, widthx, lengthx );
  }
}



class seaturtle extends Organism {

  int locX = 80;
  int locY = 70;
  public seaturtle(int w, int l) {
    widthx = w;
    lengthx = l;
    
  }
  public int getX() {
    return locX;
  }
  public int getY() {
    return locY;
  }
  void render() {

    image(seaturtle, widthx, lengthx );
  }
}


class fish extends Organism {

  int locX = 50;
  int locY = 50;
  public fish(int w, int l) {
    widthx = w;
    lengthx = l;
   
  }

  public int getX() {
    return locX;
  }
  public int getY() {
    return locY;
  }

  void render() {
    image(fish, widthx, lengthx);
  }
}

class phytoplankton extends Organism {

  int locX = 20;
  int locY = 20;

  public phytoplankton(int xCord, int yCord) {
    widthx  = xCord;
    lengthx = yCord;
  }
  public int getX() {
    return locX;
  }
  public int getY() {
    return locY;
  }
  void render() {
    fill(255, 193, 193);
    rect(widthx, lengthx, locX, locY);
  }
}
class zooplankton extends Organism {

  int locX = 15;
  int locY = 15;

  public zooplankton(int xCord, int yCord) {
    widthx  = xCord;
    lengthx = yCord;
  }
  public int getX() {
    return locX;
  }
  public int getY() {
    return locY;
  }
  void render() {
    fill(69, 139, 116);
    rect(widthx, lengthx, locX, locY);
  }
}


void keyPressed() {
  if ( key == 'R' || key == 'r' ) {
    for (int i = SharkObjs.size()-1 ; i>0 ;  i-- ) {
      SharkObjs.remove(i);
    }

    for (int i = seaturtleObjs.size()-1 ; i>0 ;  i--) {
      seaturtleObjs.remove(i);
    }
    for (int i = fishObjs.size()-1 ; i>0 ;  i--) {
      fishObjs.remove(i);
    }
    for (int i = phyObjs.size()-1 ; i>0 ;  i--) {
      phyObjs.remove(i);
    }
    for (int i = zooObjs.size()-1 ; i>0 ;  i--) {
      zooObjs.remove(i);
    }

    setup();
  }
}
void draw() {

  background(255);

  textSize(22);
  fill(0, 0, 0);
  textSize(15);
  text("Press [R] to reset the food web.", 20, 20);
  fill(0, 234, 234);
  text(" Sharks ", 15, 85);
  textSize(20);
  fill(0, 255, 0);
  text(" Sea Turtles ", 15, 200);
  fill(108, 123, 139);
  text(" Fish ", 15, 295);
  fill(255, 187, 255);
  text(" Phytoplankton ", 15, 379);
  fill(47, 79, 47);
  text(" Zooplankton ", 15, 445);
  text(" ");


  for (int i = 0 ; i<zooObjs.size() ;  i++) {
    zooplankton z = (zooplankton) zooObjs.get(i);
    z.render();
  }


  for (shark s : SharkObjs) {
    s.render();
  }

  for (int i = 0 ; i<seaturtleObjs.size() ;  i++) {
    seaturtle t = (seaturtle) seaturtleObjs.get(i);
    t.render();
  }

  for (int i = 0 ; i<fishObjs.size() ;  i++) {
    fish f = (fish) fishObjs.get(i);
    f.render();
  }
  for (int i = 0 ; i<phyObjs.size() ;  i++) {
    phytoplankton p = (phytoplankton) phyObjs.get(i);
    p.render();
  }
}


