
/*      _           /^\
    .'  \          / :.\   
   /     \         | :: \ 
  /   /.  \       / ::: | 
 |    |::. \     / :::'/  
 |   / \::. |   / :::'/
 `--`   \'  `~~~ ':'/`
         /         (    
        /   0 _ 0   \   
      \/     \_/     \/  
    -== '.'   |   '.' ==-   
      /\    '-^-'    /\    
        \   _   _   /             
       .-`-((\o/))-`-.   
  _   /     //^\\     \   _    
."o".(    , .:::. ,    )."o".  
|o  o\\    \:::::/    //o  o| 
 \    \\   |:::::|   //    /   
  \    \\__/:::::\__//    /   
   \ .:.\  `':::'`  /.:. /      
    \':: |_       _| ::'/  
     `---` `"""""` `---`

http://www.chris.com/ASCII/

*/
float dx=0.5, dy=0.5;
aswitch as = new aswitch(10, 10, 100, 50, 2);
hslider hs = new hslider(10, 75, 100,252,5);
void setup() {
  size(700, 700, P3D);
  colorMode(RGB);
  noStroke();
}
void draw() {
  background(255);
  stroke(0);
  as.drawaswitch();
  hs.draw();
  hs.drawellipse();
  noStroke();
  if(mousePressed && !checkwithinparameters(0, 0, 125, 100, mouseX, mouseY)) {
    dx+=radians(mouseY-pmouseY);
    dy+=radians(mouseX-pmouseX);
  }
  lights();
  if(as.wbp == 1) {
  rgbox(int(hs.slvar+3));
  }
  else {
    rgbox2(int(hs.slvar+3));
  }
}
void rgbox(float r) {
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(dx);
  rotateY(dy);
    translate(-255/2, -255/2, -255/2);
  for(int x = 0; x<255/r; x++) {
    for(int y = 0; y<255/r; y++) {
      for(int z = 0; z<255/r; z++) {
        pushMatrix();
        translate(x*r, y*r, z*r);
        fill(x*r, y*r, z*r, 80);
        box(r/1.7);
        popMatrix();
      }
    }
  }
  popMatrix();
}



void rgbox2(float r) {
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(dx);
  rotateY(dy);
    translate(-255/2, -255/2, -255/2);
  for(int x = 0; x<255/r; x++) {
    for(int y = 0; y<255/r; y++) {
      for(int z = 0; z<255/r; z++) {
        pushMatrix();
        translate(x*r, y*r, z*r);
        fill(x*r, y*r, z*r);
        box(r);
        popMatrix();
      }
    }
  }
  popMatrix();
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

boolean checkwithinparameters(float x, float y, float xs, float ys, float tx, float ty) {
  if(tx < x+xs && tx > x && ty < y+ys && ty > y) {
    return true;
  }
  else {
    return false;
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



