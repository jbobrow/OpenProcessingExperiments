
colorpallet[] c = new colorpallet[2];
drawtool dt = new drawtool();
hslider ahs = new hslider(15, 200, 70, 15, 3);
int mode = 0;
aswitch s = new aswitch(10, 10, 75, 40, 2);
String b = "stroke", a = "fill";
void setup() {
  size(600, 600);
  colorMode(HSB);
  c [0] = new colorpallet(15, 80, 70);
  c [1] = new colorpallet(15, 80, 70);
}



void draw() {
background(200);
fill(255);
noStroke();
rect(-1, -1, 95, height+1);
rect(-1, -1, width+1, 70);
stroke(100);
strokeWeight(ahs.slvar);
c[s.wbp].everything();
s.drawaswitch();
ahs.draw();
ahs.drawellipse();
fill(255);
textSize(11);
text(a, 20, 30);
text(b, 50, 30);
fill(c[0].output);
stroke(c[1].output);
dt.diplaydrawtool();
}




class colorpallet {
  float x, y, s, ex, ey, aas, b;
  color output;
  hslider as;
  hslider as2;
  colorpallet(float xv, float yv, float aasv) {
    x=xv;
    y=yv;
    aas=aasv;
    as = new hslider(x, y-15, aas, 255, 0);
    as2 = new hslider(x, (y+15)+aas, aas, 255, 49);
    ex=x+s;
    ey=y+s;
  }
  void everything() {
    strokeWeight(1);
    if(checkwithinparameters(x, y, aas, aas, mouseX, mouseY) && mousePressed) {
    s = (mouseX-x)*(255/aas);
    b = (mouseY-y)*(255/aas);
    ex=mouseX;
    ey=mouseY;
    }
    as.draw();
    as.drawellipse();
    as2.draw();
    as2.drawellipse();
    pallet(x, y, aas, 255, as.slvar);
    output = color(as.slvar, s, b, as2.slvar);
          ellipse(ex, ey, 15, 15);
  }
}



boolean checkwithinparameters(float x, float y, float xs, float ys, float tx, float ty) {
  if(tx < x+xs && tx > x && ty < y+ys && ty > y) {
    return true;
  }
  else {
    return false;
  }
}



void pallet(float x, float y, float s, float m, float h) {
  for(int ax = 0; ax < s+1; ax++) {
    for(int ay = 0; ay < s+1; ay++) {
      stroke(h, ax*(m/s), ay*(m/s));
      point(x+ax, y+ay);
    }
  }
}



class hslider{
  float slvar, x, y, xs, ex, max;
  hslider(float xv, float yv, float xsv, float maxvar, float stv) {
    xs = xsv;
    y=yv;
    x=xv;
    ex=x+stv;
    max=maxvar;
  }
  void draw() {
    line(x, y, x+xs, y);
    ellipse(ex, y, 15, 15);
    slvar = (ex-x)*(max/xs);
  }
  void drawellipse() {
    if(mousePressed && mouseY > y-15/2 && mouseY < y+15/2 && mouseX < x+xs && mouseX > x) {
      ex=mouseX;
    }
  }
}



class button {
  float x, y, w, h;
  boolean out;
  button(float xv, float yv, float wv, float hv) {
    x=xv;
    w=wv;
    y=yv;
    h=hv;
  }
  void drawbutton() {
    rect(x, y, w, h);
    out = checkwithinparameters(x, y, w, h, mouseX, mouseY) && mousePressed;
  }
}




class aswitch {
  float x, y, w, h;
  int numbuttons, wbp;
  button[] b;
  aswitch(float xv, float yv, float wv, float hv, int numbuttonsv) {
    x=xv;
    y=yv;
    w=wv;
    h=hv;
    numbuttons=numbuttonsv;
    b = new button[numbuttons];
    for(int i = 0; i < numbuttons; i++) {
      b[i] = new button(x+(i*(w/2)), y, w/numbuttons, h);
    }
  }
  void drawaswitch() {
    fill(c[0].output);
stroke(c[1].output);
    for(int i = 0; i < numbuttons; i++) {
      if(b[i].out == true) {
        wbp = i;
      }
    }
  for(int i = 0; i < numbuttons; i++) {
    b[i].drawbutton();
  }
  }
}



class Quad {
float x, y, w, h, s;
color cone, ctwo;
Quad(float xv, float yv, float wv, float hv, color conev, color ctwov, float sv) {
  x=xv;
  y=yv;
  w=wv;
  h=hv;
  s=sv;
  cone=conev;
  ctwo=ctwov;
}
}



class drawtool {
  ArrayList<Quad>list = new ArrayList<Quad>();
  drawtool() {
  }
  void diplaydrawtool() {
    if(mousePressed && checkwithinparameters(105, 80, width-95, height-70, mouseX, mouseY)) {
      list.add(new Quad(pmouseX, pmouseY, mouseX, mouseY, 0, c[1].output, ahs.slvar));
    }
    for(int i = 0; i < list.size(); i++) {
      strokeWeight(list.get(i).s);
      stroke(list.get(i).ctwo);
      line(list.get(i).x, list.get(i).y, list.get(i).w, list.get(i).h);
    }
  }
}
