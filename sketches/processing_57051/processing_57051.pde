
class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;

  Ball (float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }

  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (x+diameter/2>width) {
      x = width-diameter/2;
      vx*=friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
    //    if (y+diameter/2==height){
    //      diameter*=2;
  }

  void display() {
    fill(255, 204);
    //if (diameter[i]!=diameter){    
    ellipse(x, y, diameter, diameter);
  }

  void drawTitle() {
    pushMatrix();
          textFont (font2, fontSize2);
    text ("tumblr's audience bubbled up", 5, 40);
    textFont (font, fontSize);
    text ("Nielsen Data", width-82, height-5);
       // text ("represented by Annelie Berner", width-82, height-50);

    text ("May 2010", 5, height-20);
    text ("May 2011", 5, height-250);

    fill(0);
    text ("4,199k", width/2-18, height-20);
    text ("tripled to 10,416k", width/2-52, height-250);
    popMatrix();
  }
}      


