
//----------------------
// by lali barriere 2012
//----------------------

// lletres
int[] points = { 
  40, 40, 40, 160, 110, 160, -1, // L
  130, 160, 180, 40, 230, 160, -1, // A
  260, 40, 260, 160, 330, 160, -1, // L
  360, 40, 360, 160 // I
};

// estrella animada
float xx, yy;
Estrelleta e; 

// animacio
int fase = 0;
int tr = 0;
int pAct = -1;
int pNext = -1;
int pLast = -1;
float t =1.0;


void setup() {
  size(400, 200);
  smooth();

  e = new Estrelleta(0, 0);

  frameRate(20);
}

void draw() {
  background(0);

  // inici: linies finetes
  if (fase<2) {
    strokeWeight(0.5);
    tr = constrain(tr+1, 0, 125);
    stroke(255, tr);
    dibuixaLinies(points.length-2);
  }

  // recorregut
  if (fase ==1) {

    stroke(255);    
    dibuixaLinies(pLast);
    dibuixaPunts(pAct);

    // comprova si ha acabat el recorregut
    if (t>=1.0) {
      // ha arribat a l'últim punt
      if (pNext == points.length-2) {
        fase = 2;
      }
      // encara queden punts
      else {
        pLast = pNext;
        if (points[pNext+2] == -1) {
          pAct += 5;
          pNext +=5;
        }
        else
        {
          pAct += 2;
          pNext +=2;
        }
        t = 0.0;
      }
    }
    else {
      xx = lerp(points[pAct], points[pNext], t);
      yy = lerp(points[pAct+1], points[pNext+1], t);
      e.setPos(xx, yy);
      e.dibuixa();
      t += 0.02;
      stroke(255);
      fill(255);
      line(points[pAct], points[pAct+1], xx, yy);
      ellipse(points[pAct], points[pAct+1], 3, 3);
    }
  }

  // linies i punts
  if (fase == 2) {
    stroke(255); 
    fill(255);   
    dibuixaLinies(points.length-2);
    dibuixaPunts(points.length-2);
  }
}



void dibuixaLinies(int k) {
  for (int i=0; i < k; i+=2) {
    if (points[i+2] == -1) {
      i+=3;
    }
    line(points[i], points[i+1], points[i+2], points[i+3]);
  }
}

void dibuixaPunts(int k) {
  for (int i = 0; i<=k; i+=2) {
    if (points[i] == -1) 
      i++;
    ellipse(points[i], points[i+1], 3, 3);
  }
}


void mousePressed() {
  if (fase == 0) {
    fase = 1;
    pAct = 0;
    pNext = 2;
    pLast = 0;
    t = 0.0;
  }
}


class Estrelleta {
  PVector pos;
  float escala;

  Estrelleta(float x, float y) {
    pos = new PVector(x, y);
    escala = 1.0;
  }

  Estrelleta(float x, float y, float e) {
    pos = new PVector(x, y);
    escala = e;
  }

  void setPos(float x, float y){
    pos.x = x;
    pos.y = y;
  }
  
  
  void dibuixa() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(escala*abs(sin(frameCount)));
    noFill();
    strokeWeight(0.25);
    stroke(255, 150);
    pushMatrix();
    for (int i = 0; i<4; i++) {
      strokeWeight(0.25);
      line(0, 0, 15, 0);
      strokeWeight(0.25);
      line(0, 0, 12, 0);
      strokeWeight(0.35);
      line(0, 0, 10, 0);
      strokeWeight(0.35);
      line(0, 0, 8, 0);
      strokeWeight(0.45);
      line(0, 0, 6, 0);
      strokeWeight(0.45);
      line(0, 0, 4, 0);
      line(0, 0, 2, 0);
      fill(255, 255, 0);
      ellipse(0, 0, 1.5, 1.5);
      rotate(PI/2);
    }
    popMatrix();
   popMatrix();
 }

}

