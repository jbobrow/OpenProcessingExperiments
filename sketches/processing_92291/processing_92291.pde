

boolean colorchange;
Bulb Ian, mike, kit, bob, ben,thomas;
int x= 50;
int y= 75;
int c;
float s;


void setup() {
  size (800, 200);
  smooth();
  // randomSeed(0);
  Ian= new Bulb();
  mike = new Bulb();
  kit= new Bulb();
  bob = new Bulb();
  ben = new Bulb();
  thomas = new Bulb();
}

void draw() {

  if (colorchange) {
    background (#edda05);
  }
  else {
    background (0);
  }

  //  for (int i = 35; i < width ; i += 40) {
  //      int c= int(random(0, 120));
  //      float s = random (.40, 2.0);
  //  }

  Ian.display(x, y, c, 1);
  mike.display(150, y+5, c, 1);
  kit.display(240,y+20,c,2);
  bob.display(450,y+10,c,2);
  ben.display(600, y+2,c,3);
  thomas.display(500, y, c, 1);
}

void mousePressed() {
  colorchange =!colorchange;
}


class Bulb {
  //data
  int x= 50;
  int y= 75;
  color col;

  Bulb(){
    col = color(random(255),random(255),random(255));
    
  }

  //functions
  void display(int x, int y, int c, float s) {
    
    
    pushMatrix();
    //---------------big bulb
    stroke(col, 6);
    strokeWeight(.25);
    fill(col, 90);
    ellipse(x, y, x, y);
    //-----------------wire opening
    strokeWeight(.25);
    stroke(col);
    noFill();
    ellipse(x, 42, x/5, y/5);
    //-----------wire
    stroke(160);
    strokeWeight(2);
    line(x, 40, x, 0);
    popMatrix();
  }
}



