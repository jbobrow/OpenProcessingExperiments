
rumskib[] apollo = new rumskib[10];
float tid = 0;

void setup() {
  size(1000, 600);
  frameRate(60);
  apollo[0] = new rumskib(0, 3.7);
  apollo[1] = new rumskib(1, 8.83);
  apollo[2] = new rumskib(2, 9.82);
  apollo[3] = new rumskib(3, 1.624);
  apollo[4] = new rumskib(4, 3.75);
  apollo[5] = new rumskib(5, 26);
  apollo[6] = new rumskib(6, 11.2);
  apollo[7] = new rumskib(7, 10.5);
  apollo[8] = new rumskib(8, 13.3);
  apollo[9] = new rumskib(9, 0.61);
}

void draw() {
  mainbg();
  korting();
  tid += 0.01666666666666666666;
}

void korting() {
  for (int i = 0; i<10; i++) {
    apollo[i].step();
  }
}

void bg(int x, color planet, String navn) {
  pushMatrix();
  translate(x, 0);
  fill(planet);
  noStroke();
  rect(0, 500, 100, 100);
  stroke(0);
  line(99, 0, 99, 600);
  fill(255);
  text(navn, 10, 20);

  popMatrix();
}

void mainbg() {
  background(30);
  bg(0, color(151, 151, 151), "Merkur");
  bg(100, color(229, 146, 37), "Venus");
  bg(200, color(0, 200, 0), "Jorden");
  bg(300, color(212, 212, 212), "Månen");
  bg(400, color(255, 167, 78), "Mars");
  bg(500, color(214, 188, 153), "Jupitor");
  bg(600, color(255, 255, 255), "Saturen");
  bg(700, color(156, 193, 224), "Uranus");
  bg(800, color(103, 167, 222), "Neptun");
  bg(900, color(118, 118, 118), "Pluto");
}
class rumskib {
  float x, y, g, vspeed, ctid;
  boolean fardig = false;

  rumskib(float x1, float g1) {
    vspeed = 0;
    x = x1*100+20;
    y = 100;
    g = ((g1/(1/(0.5)))/60)/60;
  }

  void step() {
    if (y<500) {
      vspeed += g;
      y+=vspeed;
      ctid = tid;
    } 
    else {
      if (!fardig) {
        vspeed = 0;
        fardig = true;
      }
    }


    pushMatrix();
    translate(x, y);
    rect(-10, -20, 20, 20);


    popMatrix();
    text(ctid, x-15, 35);
  }
}

