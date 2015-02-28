
int numx = 100;
int numy = 100;

PVector [][] vecs = new PVector [numx][numy];
PVector [][] pts = new PVector [numx][numy];

Fieldpts [][] fieldpts = new Fieldpts[numx][numy];

PVector mouse;
float rads;
float ang;
PVector vecbet;
PFont font;

ArrayList magnets = new ArrayList();
Magnet magnet;

void setup(){
  size(600, 600);
  noFill();
  smooth();
  font = loadFont("Inconsolata-24.vlw");
  textFont(font, 10);
  magnets.add(new Magnet());
  //magnet = new Magnet();
  for (int j=0; j<numy; j++){
    for (int i=0; i<numx; i++){
      pts[i][j] = new PVector((i+.5)*width/numx, (j+.5)*height/numy);
      fieldpts[i][j] = new Fieldpts((i+.5)*width/numx, (j+.5)*height/numy);
    }
  }
}

void draw(){
  background(255);
  
  //magnet.update();
  //magnet.render();
  
  for (int i=0; i<magnets.size(); i++){
    Magnet magi = (Magnet) magnets.get(i);
    if (magi.isLocked() == false){
      magi.update();
    }
    magi.render();
  }
  
  for (int j=0; j<numy; j++){
    for (int i=0; i<numx; i++){
      fieldpts[i][j].update();
      fieldpts[i][j].render();
    }
  }
}

void keyPressed(){
  if (key == CODED){
    for (int i=0; i<magnets.size(); i++){
      Magnet magi = (Magnet) magnets.get(i);
      if (magi.isLocked() == false){
        if (keyCode == 39){
          magi.turn(PI/16);
        }
        if (keyCode == 37){
          magi.turn(-PI/16);
        }
      }
    } 
  }
}

void mouseClicked(){
  int lmag = magnets.size();
  println("clicked " + magnets.size());
  Magnet lockmag = (Magnet) magnets.get(lmag-1);
  lockmag.lock();
}

void mouseReleased(){
  magnets.add(new Magnet());
  println("released " + magnets.size());
}

class Magnet{
  PVector magcent;
  PVector pospt;
  PVector negpt;
  float len = 40;
  float alignang;
  boolean locked;
  
  Magnet(){
    magcent = new PVector(mouseX, mouseY);
    //pospt = new PVector(mouseX, mouseY + len/2);
    //negpt = new PVector(mouseX, mouseY - len/2);
    alignang = 0;
    locked = false;
  }
  
  void update(){
    magcent = new PVector(mouseX, mouseY);
    pospt = new PVector(mouseX + len/2, mouseY);
    negpt = new PVector(mouseX - len/2, mouseY);
  }
  
  void render(){
    pushMatrix();
    rectMode(CENTER);
    translate(magcent.x, magcent.y);
    rotate(alignang);
    rect(0,0, len, len/2);
    fill(200, 0, 0);
    ellipse(-len/2, 0, 5, 5);
    fill(0,0,200);
    ellipse(len/2, 0, 5, 5);
    noFill();
    popMatrix();
  }
  
  void turn(float turnang){
    alignang += turnang;
    if (alignang > TWO_PI){ alignang -= TWO_PI; }
    if (alignang < 0) { alignang += TWO_PI; }
    println(alignang);
  }
  
  void lock(){
    magcent = new PVector(mouseX, mouseY);
    //alignang = alignang;
    locked = true;
    println(locked);
  }
  
  boolean isLocked(){
    return locked;
  }
  
}

class Fieldpts{
  PVector ptpos;
  float centdist;
  PVector pospt;
  PVector negpt;
  float dia;
  float posdist;
  float negdist;
  PVector vectomag;
  float vectomagang;
  float ratio;
  color txtcol;
  PVector closervec;
  float closervecang;
  float rotang;
  float vecsub;
  float alignangadd;
  
  Fieldpts(float iposx, float iposy){
    ptpos = new PVector(iposx, iposy);
    centdist = 0;
    dia = width/(numx+1);
    pospt = new PVector(iposx, iposy+dia/2);
    negpt = new PVector(iposx, iposy-dia/2);
  }
  
  void update(){
    vectomag = new PVector(0,0);
    alignangadd = 0;
    rotang = 0;
    for (int i=0; i<magnets.size(); i++){
      Magnet magvec = (Magnet) magnets.get(i);
      vectomag.add(PVector.sub(ptpos, magvec.magcent));
      alignangadd+= magvec.alignang;
      vectomagang = vectomag.heading2D();
      vectomagang += PI;
      if (vectomagang > alignangadd && vectomagang < alignangadd+PI){
        rotang += map(vectomagang, alignangadd, alignangadd+PI, alignangadd, alignangadd+TWO_PI);
      } else {
        rotang += map(vectomagang, alignangadd, alignangadd-PI, alignangadd, alignangadd-TWO_PI);
      }
    }
    //vectomag = PVector.sub(ptpos, magnet.magcent);
    
    
  }
  
  void render(){
    noFill();
    noStroke();
    pushMatrix();
    translate(ptpos.x, ptpos.y);
    rotate(rotang);
    //ellipse(0,0, dia, dia);
    fill(200, 0, 0);
    ellipse(-dia/2, 0, 1, 1);
    //text(posdist, 0, dia/2);
    fill(0, 0, 200);
    ellipse(dia/2, 0, 1, 1);
    //text(negdist, 0, -dia/2);
    stroke(150);
    line(-dia/2, 0, dia/2, 0);
    //fill(txtcol);
    //text(vectomagang, 0, -15);
    //text(rotang, 0, 0);
    //text(vecsub, 0, 15);
    popMatrix();
    noFill();
  }
}

