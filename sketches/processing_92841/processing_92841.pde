
//Elli_midterm

Spot[] spots = new Spot [17];

void setup () {
  size(300, 300);
  noStroke();
  smooth();
  frameRate(50);

  spots[0] = new Spot (25, 12, #00F4FA, 5.5); //cyan
  spots[1] = new Spot (30, 18, #FF00C4, 15.2); //bright green
  spots[2] = new Spot (45, 31, #FFE308, 10.9); //yellow
  spots[3] = new Spot (60, 23, #FF0505, 9.8); //red
  spots[4] = new Spot (75, 46, #7606D3, 7.3); //purple
  spots[5] = new Spot (90, 22, #126895, 18.2); // deep blue
  spots[6] = new Spot (115, 13, #2B7E5B, 12.3); //evergreen
  spots[7] = new Spot (130, 49, #E59DCD, 9.4); //pink
  spots[8] = new Spot (145, 35, #D8D7B3, 6.8); //cream
  spots[9] = new Spot (160, 15, #FFEA00, 13.5); //gold
  spots[10] = new Spot (175, 29, #A71407, 17.4); //burgundy
  spots[11] = new Spot (190, 26, #92DBD9, 8.6); //baby blue
  spots[12] = new Spot (215, 11, #7E8B29, 5.9); //nature green
  spots[13] = new Spot (230, 32, #FF936F, 6.2); //peach
  spots[14] = new Spot (245, 21, #6813B6, 9.1); //purple
  spots[15] = new Spot (260, 50, #14ECDB, 4.2); //turquoise  
  spots[16] = new Spot (275, 13, #FFE600, 5.3); //yellow
}

void draw() {
  fill (0,0,0,50);
  rect(0, 0, width, height);

  for (int i=0; i<17; i++) {
    spots[i].update();
    spots[i].render();
  }
}

class Spot {
  int dia, dir;
  color c;
  float speed, x, y;

  Spot(int _x, int _dia, color _c, float _sp) {
    dia=_dia;
    c= color(_c);
    x=_x;
    y=1;
    dir=1;
    speed=_sp;
    int y;
  }

  void update() {
    if (y>=height) {
      y=height-1;
      dir=-1;
    }
    if (y<=1) {
      y=1;
      dir=1;
    }
    y+=(speed*dir);
  }

  void render() {
    fill(c);
    ellipse(x, y, dia, dia);
  }
}
