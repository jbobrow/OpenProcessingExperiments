
int WIDTH = 1200;
int HEIGHT = 600;
boolean pause, pPause;
int drawMode = 2;
float nPrecisionEcorce = 8;
float planeSize = 500;
float boxSize = 200.0;

Particle pTronc;
ArrayList<PVector> treePoints;
ArrayList<ArrayList<PVector>> ecorcePoints;
ArrayList<Float> treeDiams;

// Camera variables
float camRay, camTheta, camPhi;
float camTheta0, camPhi0, mouseX0, mouseY0;;

void setup() {
  size(WIDTH, HEIGHT, P3D);
 
  pause = false;
  pPause = pause;
  frameRate(60);
  
  camRay = 600;
  camTheta = PI/4.0;
  camPhi = 0;
  camTheta0 = camTheta;
  camPhi0 = camPhi;
  mouseX0 = 0; 
  mouseY0 = 0;
  camera(camRay*cos(camPhi)*sin(camTheta), -camRay*cos(camTheta), camRay*sin(camPhi)*sin(camTheta) , 0, -height/10.0, 0, 0, 1, 0);
 
 //Particle(PVector pos, float theta, float phi, float diametre)
  pTronc = new Particle(new PVector(0, 0, 0), 4*PI/4.0, 1*PI/4.0, 30);
  treePoints = new ArrayList<PVector>();
  ecorcePoints = new ArrayList<ArrayList<PVector>>();
  treeDiams = new ArrayList<Float>();
  
  background(0);
  drawPlane(planeSize);
  stroke(255);
}

void draw() {
  if (pause) {
    // Reset screen
    background(0);
    setLights();
   
    // Camera
    //camPhi = camPhi0 + mouseX / ((float)Width) * TWO_PI;
    //camTheta = camTheta0 - mouseY / ((float)Height) * TWO_PI;
    //camera(camRay*cos(camPhi), -height/2.0, camRay*sin(camPhi) , 0, -height/10.0, 0, 0, 1, 0);
    //camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
   
    // Objet
    drawPlane(planeSize);
    drawTree(drawMode);
    //drawCube(boxSize);
  }
  else {
    //background(0);
    setLights();
    pTronc.update();
    pTronc.draw(drawMode);
  }
}

void keyPressed() {
  if (key == 'p') {
    pause = ! pause;
  }
  if (keyCode == ENTER) {
    saveFrame("Arbre-decrementDiam" + pTronc.decrementDiam + "-rapportDiam" + pTronc.rapportDiam + "-####.png");
  }
  if (key == 'e') {
    exportTree(ecorcePoints);
  }
}

// Move camera with mouse
void mousePressed() {
  pPause = pause;
  pause = true;
  //println(pause);
  camPhi0 = camPhi;
  camTheta0 = camTheta;
  mouseX0 = mouseX; 
  mouseY0 = mouseY;
}
void mouseDragged() {
  //if (mousePressed) {
    camPhi = camPhi0 + (mouseX-mouseX0) / ((float) width) * TWO_PI;
    camTheta = camTheta0 + (mouseY-mouseY0)*(PI / (1*((float)height)) );
    if (camTheta < PI/8.0) {camTheta = PI/8.0;}
    if (camTheta > PI/2.0+PI/8.0) {camTheta = PI/2.0+PI/8.0;}
    camera(camRay*cos(camPhi)*sin(camTheta), -camRay*cos(camTheta), camRay*sin(camPhi)*sin(camTheta) , 0, -height/10.0, 0, 0, 1, 0);
  //}
}
void mouseReleased() {
  pause = pPause;
  camPhi0 = camPhi;
  camTheta0 = camTheta;
}

void setLights() {
  // Lights
  spotLight(255, 255, 255, width/2, 0, 400, 0, 0, -1, PI/4, 2);
  directionalLight(100, 100, 100, 0.5, 0.5, 0.5);
  //ambientLight(50, 50, 50);
  //if (mousePressed) {
    lights();
  //}
}
void drawPlane(float planeSize) {
  // Plan
  fill(200);
  beginShape(QUADS);
  vertex(-planeSize, 0, -planeSize);
  vertex(-planeSize, 0,  planeSize);
  vertex( planeSize, 0,  planeSize);
  vertex( planeSize, 0, -planeSize);
  endShape();
}
void drawCube(float boxSize) {
  // Cube
  stroke(255);
  strokeWeight(10);
  //noStroke();
  noFill();
  pushMatrix();
  translate(0, -boxSize/2.0, 0);
  box(boxSize);
  popMatrix();
}

void drawTree(int drawMode) {
  switch (drawMode) {
    case 0:
      for (int i = 0; i < treePoints.size(); i++) {
        PVector treePt = (PVector) treePoints.get(i);
        strokeWeight(treeDiams.get(i));
        point(treePt.x, treePt.y, treePt.z);
      }
      break;
    case 1:
    strokeWeight(0.5);
    stroke(255,255,255);
    //noFill();
    fill(255, 0, 0);
      for (int i = 0; i < ecorcePoints.size(); i++) {
        ArrayList<PVector> ecorceI = (ArrayList) ecorcePoints.get(i);
        beginShape();
        for (int j = 0; j < nPrecisionEcorce; j++) {
          PVector pt = (PVector) ecorceI.get(j);
          vertex(pt.x, pt.y, pt.z);
        }
        endShape(CLOSE);
      }
      break;
    case 2:
      noStroke(); fill(200, 150, 150);
      for (int i = 0; i < ecorcePoints.size(); i++) {
        ArrayList<PVector> ecorceI = (ArrayList) ecorcePoints.get(i);
       
        for (int j = 0; j < nPrecisionEcorce; j++) {
          PVector ptA = (PVector) ecorceI.get(j);
          PVector ptB = (PVector) ecorceI.get((j+1) % ((int)nPrecisionEcorce));
          PVector ptC = (PVector) ecorceI.get(((j+1) % ((int)nPrecisionEcorce)) + (int)nPrecisionEcorce);
          PVector ptD = (PVector) ecorceI.get(j+(int)nPrecisionEcorce);
          beginShape();
          vertex(ptA.x, ptA.y, ptA.z);
          vertex(ptB.x, ptB.y, ptB.z);
          vertex(ptC.x, ptC.y, ptC.z);
          vertex(ptD.x, ptD.y, ptD.z);
          endShape(CLOSE);
        }
      }
      break;
    case 3:
      noStroke(); fill(200, 150, 150);
      for (int i = 0; i < ecorcePoints.size() - 1; i++) {
        ArrayList<PVector> ecorceI = (ArrayList) ecorcePoints.get(i);
        ArrayList<PVector> ecorceJ = (ArrayList) ecorcePoints.get(i+1);
       
        for (int j = 0; j < nPrecisionEcorce; j++) {
          PVector ptA = (PVector) ecorceI.get(j);
          PVector ptB = (PVector) ecorceI.get((j+1) % ((int)nPrecisionEcorce));
          PVector ptC = (PVector) ecorceJ.get((j+1) % ((int)nPrecisionEcorce));
          PVector ptD = (PVector) ecorceJ.get(j);
          beginShape();
          vertex(ptA.x, ptA.y, ptA.z);
          vertex(ptB.x, ptB.y, ptB.z);
          vertex(ptC.x, ptC.y, ptC.z);
          vertex(ptD.x, ptD.y, ptD.z);
          endShape(CLOSE);
        }
      }
      break;
    default:
      break;
  }
}


class Particle{
 
  PVector pos;
  float theta, phi;
  float diametre;
  boolean parent;
  ArrayList<Particle> enfants;
  float deathAlea;
  int death;
  float decrementDiam = 0;
  float rapportDiam = 80/100.0;
  ArrayList<PVector> previousEcorcePoints;
  
  // decrement 4,rapport = 0, deathAlea = diam * 2
  // decrement 0,rapport = 0.8, deathAlea = diam * 3
  // decrement 0,rapport = 0.8, deathAlea = pow(diametre, 1.4) / 0.50
 
 
  Particle(PVector pos, float theta, float phi, float diametre){
    this.pos = pos;
    this.theta = theta;
    this.phi = phi;
    this.diametre = diametre;
    this.enfants = new ArrayList<Particle>();
    this.parent = false;
    this.previousEcorcePoints = new ArrayList<PVector>();
    
    this.deathAlea = deathAleaFunc(this.diametre);
    this.death = frameCount + ((int)random(this.deathAlea)) + 1;
  }
 
  float deathAleaFunc(float diametre) {
    //return diametre * 5;
    return pow(diametre, 1.4) / 0.5;
  }
 
  void draw(int drawMode){
    // Dessine les enfants
    if (this.parent) {
      for (int i = 0; i < this.enfants.size(); i++) {
        ( (Particle) this.enfants.get(i) ).draw(drawMode);
      }
    }
    if (this.death-frameCount > 0) {
      // et lui-même (qui est son enfant si il est parent, berk)
      if (drawMode == 0) {
        strokeWeight(this.diametre);
        point(this.pos.x, this.pos.y, this.pos.z);
        treePoints.add(this.pos);
        treeDiams.add(this.diametre);
      }
      else if (drawMode == 1) {
        ArrayList<PVector> ecorceI = new ArrayList<PVector>();
        PVector uTheta = new PVector(cos(this.theta)*cos(this.phi), -sin(this.theta), cos(this.theta)*sin(this.phi));
        PVector uPhi = new PVector(-sin(this.phi), 0, cos(this.phi));
        float rayEcorce = this.diametre / 2.0;
        noFill();
        beginShape();
        float angle; 
        PVector pointI;
        for (int i = 0; i < nPrecisionEcorce; i++) {
          angle = i * TWO_PI / nPrecisionEcorce;
          pointI = PVector.add(PVector.mult(uTheta, rayEcorce*cos(angle)), PVector.mult(uPhi, rayEcorce*sin(angle)));
          pointI.add(this.pos);
          ecorceI.add(pointI);
          vertex(pointI.x, pointI.y, pointI.z);
        }
        endShape(CLOSE);
        ecorcePoints.add(ecorceI);
      }
      else if (drawMode == 2) {
        ArrayList<PVector> ecorceI = new ArrayList<PVector>();
        // PVector uTheta = new PVector(cos(this.theta)*cos(this.phi), sin(this.theta), cos(this.theta)*sin(this.phi));
        // PVector uPhi = new PVector(sin(this.phi), 0, cos(this.phi));
        PVector uTheta = new PVector(cos(this.theta)*cos(this.phi), -sin(this.theta), cos(this.theta)*sin(this.phi));
        PVector uPhi = new PVector(-sin(this.phi), 0, cos(this.phi));
        float rayEcorce = this.diametre / 2.0;
        float angle; 
        PVector pointI;
        for (int i = 0; i < nPrecisionEcorce; i++) {
          angle = i * TWO_PI / nPrecisionEcorce;
          pointI = PVector.add(PVector.mult(uTheta, rayEcorce*cos(angle)), PVector.mult(uPhi, rayEcorce*sin(angle)));
          pointI.add(this.pos);
          ecorceI.add(pointI);
        }
        if (previousEcorcePoints.size() > 0) {
          noStroke(); fill(200, 150, 150);
          for (int j = 0; j < nPrecisionEcorce; j++) {
            PVector ptA = (PVector) ecorceI.get(j);
            PVector ptB = (PVector) ecorceI.get((j+1) % ((int)nPrecisionEcorce));
            PVector ptC = (PVector) previousEcorcePoints.get((j+1) % ((int)nPrecisionEcorce));
            PVector ptD = (PVector) previousEcorcePoints.get(j);
            beginShape();
            vertex(ptA.x, ptA.y, ptA.z);
            vertex(ptB.x, ptB.y, ptB.z);
            vertex(ptC.x, ptC.y, ptC.z);
            vertex(ptD.x, ptD.y, ptD.z);
            endShape(CLOSE);
          }
          ArrayList<PVector> bothEcorcePoints = new ArrayList<PVector>(ecorceI);
          ArrayList<PVector> previousEcorcePoints2 = new ArrayList<PVector>(previousEcorcePoints);
          bothEcorcePoints.addAll(previousEcorcePoints2);
          ecorcePoints.add(bothEcorcePoints);
        }
        previousEcorcePoints = new ArrayList(ecorceI);
      }
      else if (drawMode == 3) {
        ArrayList<PVector> ecorceI = new ArrayList<PVector>();
        PVector uTheta = new PVector(cos(this.theta)*cos(this.phi), -sin(this.theta), cos(this.theta)*sin(this.phi));
        PVector uPhi = new PVector(-sin(this.phi), 0, cos(this.phi));
        float rayEcorce = this.diametre / 2.0;
        float angle; 
        PVector pointI;
        for (int i = 0; i < nPrecisionEcorce; i++) {
          angle = i * TWO_PI / nPrecisionEcorce;
          pointI = PVector.add(PVector.mult(uTheta, rayEcorce*cos(angle)), PVector.mult(uPhi, rayEcorce*sin(angle)));
          pointI.add(this.pos);
          ecorceI.add(pointI);
        }
        if (previousEcorcePoints.size() > 0) {
          noStroke(); fill(200, 150, 150);
          for (int j = 0; j < nPrecisionEcorce; j++) {
            PVector ptA = (PVector) ecorceI.get(j);
            PVector ptB = (PVector) ecorceI.get((j+1) % ((int)nPrecisionEcorce));
            PVector ptC = (PVector) previousEcorcePoints.get((j+1) % ((int)nPrecisionEcorce));
            PVector ptD = (PVector) previousEcorcePoints.get(j);
            beginShape();
            vertex(ptA.x, ptA.y, ptA.z);
            vertex(ptB.x, ptB.y, ptB.z);
            vertex(ptC.x, ptC.y, ptC.z);
            vertex(ptD.x, ptD.y, ptD.z);
            endShape(CLOSE);
          }
        }
        previousEcorcePoints = new ArrayList(ecorceI);
        ecorcePoints.add(ecorceI);
      }
    }
  }
  
  float dThetaAlea = TWO_PI / 100.0;
  float dPhiAlea = TWO_PI / 100.0;
  void update(){
    // Dessine les enfants
    if (this.parent) {
      for (int i = 0; i < this.enfants.size(); i++) {
        ( (Particle) this.enfants.get(i) ).update();
      }
    }
    if ((this.death-frameCount <= 0) && (this.diametre >= 1 + this.decrementDiam)) {               //DIVISION
      this.parent = true;
     
      // ENFANTS
      int nEnfants = 1;
      float dTheta = PI;
      float dPhi = TWO_PI;
      PVector enfantPos;
      float enfantTheta, enfantPhi, enfantDiam;
      Particle enfant;
      for (int i = 0; i < nEnfants; i++) {
        enfantPos = this.pos;
        enfantTheta = this.theta + (random(dTheta) - dTheta/2.0);
        enfantPhi = this.phi + (random(dPhi) - dPhi/2.0);
        enfantDiam = this.diametre * this.rapportDiam - this.decrementDiam;
        enfant = new Particle(enfantPos, enfantTheta, enfantPhi, enfantDiam);
        this.enfants.add(enfant);
      }
     
      //MISE A JOUR COMME SON PROPRE ENFANT
      this.diametre = this.diametre * this.rapportDiam - this.decrementDiam;
      this.deathAlea = deathAleaFunc(this.diametre);
      this.death = frameCount + ((int)random(this.deathAlea));
    }
    if (this.diametre >= 1 + this.decrementDiam) {
      // Modele mouvement
      this.theta = this.theta + random(dThetaAlea) - dThetaAlea/2.0;
      this.phi = this.phi + random(dPhiAlea) - dPhiAlea/2.0;
      //this.pos = PVector.add( this.pos, new PVector(sin(this.theta)*cos(this.phi), -cos(this.theta), sin(this.theta)*sin(this.phi)));
      this.pos = PVector.add( this.pos, PVector.mult(new PVector(sin(this.theta)*cos(this.phi), cos(this.theta), sin(this.theta)*sin(this.phi)), 1)); // TESTER 10 !!    
    }
  }
}

void exportTree(ArrayList<ArrayList<PVector>> ecorcePoints) {
  if (drawMode == 2) {
    String filename = getIncrementalFilename("arbre-####.obj");
    PrintWriter out = createWriter(filename);
    out.println("# " + filename + "\n");
    
    // Draw plane
    // out.println("v \t" + -planeSize + "\t" + 0 + "\t" + -planeSize);
    // out.println("v \t" + -planeSize + "\t" + 0 + "\t" +  planeSize);
    // out.println("v \t" +  planeSize + "\t" + 0 + "\t" +  planeSize);
    // out.println("v \t" +  planeSize + "\t" + 0 + "\t" + -planeSize);
    // out.println("f \t" +  1 + "\t" + 2 + "\t" + 3 + "\t" + 4);
    
    // Export points and vertices
    int nLeft = 4;  // nLeft, PB: use commas instead of points
    int nRight = 5; // nDecimals
    ArrayList<PVector> ecorceI;
    PVector pt;
    int ptAi, ptBi, ptCi, ptDi;
    float scaleF = 1/10.0;
    for (int i = 0; i < ecorcePoints.size(); i++) {
      ecorceI = (ArrayList) ecorcePoints.get(i);
      for (int j = 0; j < ecorceI.size(); j++) {
        pt = (PVector) ecorceI.get(j);
        out.println("v \t" + scaleF*pt.x + "\t" + -scaleF*pt.y + "\t" + scaleF*pt.z);
        //out.println("v " + nfs(pt.x,nLeft, nRight)  + "\t" + nfs(pt.y,nLeft, nRight) + "\t" + nfs(pt.z,nLeft, nRight));
      }
      for (int j = 0; j < nPrecisionEcorce; j++) {
        ptAi = j;
        ptBi = (j+1) % ((int)nPrecisionEcorce);
        ptCi = ((j+1) % ((int)nPrecisionEcorce)) + (int)nPrecisionEcorce;
        ptDi = j + (int)nPrecisionEcorce;
        ptAi -= (2*nPrecisionEcorce + 0);
        ptBi -= (2*nPrecisionEcorce + 0);
        ptCi -= (2*nPrecisionEcorce + 0);
        ptDi -= (2*nPrecisionEcorce + 0);
        out.println("f \t" + ptAi + "\t" + ptBi + "\t" + ptCi + "\t" + ptDi);
      }
      out.println();
    }
    
    out.flush();   
    out.close();
    println("File exported to " + filename);
  }
  else {
    println("Wrong draw mode, cannot export");
  }
}


// From http://wiki.processing.org/index.php/Incrementing_numerical_filenames
public String getIncrementalFilename(String what) {
  String s="", prefix, suffix, padstr, numstr;
  int index=0, first, last, count;
  File f;
  boolean ok;
 
  first = what.indexOf('#');
  last=what.lastIndexOf('#');
  count = last - first + 1;
 
  if( (first != -1) && (last-first > 0) ) {
    prefix = what.substring(0, first);
    suffix = what.substring(last+1);
 
    // Comment out if you want to use absolute paths
    // or if you're not using this inside PApplet
    if(sketchPath!=null) prefix = savePath(prefix);
 
    index = 0;
    ok = false;
 
    do {
      padstr = "";
      numstr = "" + index;
      for(int i = 0; i < count-numstr.length(); i++) padstr += "0";       
      s = prefix + padstr + numstr + suffix;
      
      f = new File(s);
      //f = new File(dataPath(s));
      ok = !f.exists();
      
      index++;
 
      // Provide a panic button. If index > 10000 chances are it's an invalid filename.
      if(index>100) ok = true;
    } 
    while(!ok);
 
    // Panic button - comment out if you know what you're doing
    if(index>100) {
      println("getIncrementalFilename thinks there is a problem - Is there more than 10000 files already in the sequence or is the filename invalid?");
      return prefix+"ERR"+suffix;
    }
  }
  return s;
}

