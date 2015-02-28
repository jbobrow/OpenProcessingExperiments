
PolygoneInversable poly;
float polyAireCible = 60000;
ArrayList<PolygoneInversable> polygones;
int nombreDePolygones = 10;
int r = 10;
boolean showMenu = true;
boolean editFrame = true;
boolean polyFeedBack = true;
boolean pause = false;

void setup() {
  size(400,400);
  //frame.setResizable(true);
  smooth();
  //
  poly                           = new PolygoneInversable(0,20);
  poly.dessineContour            = true;
  poly.dessineNumero             = false;
  poly.decroiser                 = true;
  poly.dessineDeltaAire          = false;
  poly.decomposable              = true;
  poly.dessineDecomposition      = false;
  poly.estContenant              = true;
  poly.feedbackContenu           = true;
  poly.editable                  = true;
  poly.dessineEditable           = true;
  poly.structure                 = true;
  poly.dessineStructure          = false;
  poly.structurePerimetreMax     = true;
  poly.distPerimetreMax          = 100.0;
  poly.distPerimetreMaxSqr       = poly.distPerimetreMax*poly.distPerimetreMax;
  poly.structurePerimetreMin     = true;
  poly.distPerimetreMin          = 10.0;
  poly.distPerimetreMinSqr       = poly.distPerimetreMin*poly.distPerimetreMin;
  poly.structureSommetSommet     = true;
  poly.distSommetSommet          = 10.0;
  poly.distSommetSommetSqr       = poly.distSommetSommet*poly.distSommetSommet;
  poly.structureSommetSegment    = false;
  poly.distSommetSegment         = 10.0;
  poly.distSommetSegmentSqr      = poly.distSommetSegment*poly.distSommetSegment;
  poly.structureAire             = true;
  poly.aireCible                 = polyAireCible;
  poly.structureAngle            = true;
  poly.structureDiagonale        = false;
  poly.dessineDiagonale          = true;
  //
  reset();
}

void reset() {
  //
  polygones = new ArrayList();
  for(int i=0;i<nombreDePolygones;i++) {
    PolygoneInversable p1        = new PolygoneInversable(0,10-round(nombreDePolygones/20));
    p1.dessineContour            = true;
    p1.dessineNumero             = false;
    p1.decroiser                 = true;
    p1.dessineDeltaAire         = true;
    p1.decomposable              = true;
    p1.dessineDecomposition      = false;
    p1.estContenant              = false;
    p1.editable                  = true;
    p1.dessineEditable           = true;
    p1.structure                 = true;
    p1.dessineStructure          = false;
    p1.structurePerimetreMax     = true;
    p1.distPerimetreMax          = 100.0;
    p1.distPerimetreMaxSqr       = poly.distPerimetreMax*poly.distPerimetreMax;
    p1.structurePerimetreMin     = true;
    p1.distPerimetreMin          = 10.0;
    p1.distPerimetreMinSqr       = poly.distPerimetreMin*poly.distPerimetreMin;
    p1.structureSommetSommet     = true;
    p1.distSommetSommet          = 10.0;
    p1.distSommetSommetSqr       = poly.distSommetSommet*poly.distSommetSommet;
    p1.structureSommetSegment    = false;
    p1.distSommetSegment         = 10.0;
    p1.distSommetSegmentSqr      = poly.distSommetSegment*poly.distSommetSegment;
    p1.structureAire             = true;
    p1.aireCible                 = polyAireCible/nombreDePolygones;
    p1.structureAngle            = true;
    p1.structureDiagonale        = false;
    p1.dessineDiagonale          = true;
    polygones.add(p1);
  }
  //
}

void draw() {
  // polyFeedBack ?
  if(polyFeedBack) {
    poly.feedbackContenu = true;
  } else {
    poly.feedbackContenu = false;
  }
  // edit Frame?
  if(editFrame) {
    poly.editable = true;
    for(PolygoneInversable p : polygones) {
      p.editable = false;
    }
  } else {
    poly.editable = false;
    for(PolygoneInversable p : polygones) {
      p.editable = true;
    }
  }
  // update
  for(int i=0;i<r;i++) {
    for(PolygoneInversable p : polygones) {
      p.update();
      p.edite();
      p.decompose();
    }
    for(int j=0;j<nombreDePolygones-1;j++) {
      PolygoneInversable pj = polygones.get(j);
      for(int k=j+1;k<nombreDePolygones;k++) {
        PolygoneInversable pk = polygones.get(k);
        collision(pj,pk);
      }
    }
    poly.update();
    poly.edite();
    poly.decompose();
    poly.updatePolygoneInverse();
    if(!pause) {
      for(PolygoneInversable p : polygones) {
        collision(p,poly.polygoneInverse);
      }
      poly.feedbackContenu();
      poly.structure();
      poly.updateSommets();
      for(PolygoneInversable p : polygones) {
        p.structure();
        p.updateSommets();
      }
    }
  }
  // dessine
  background(0);
  for(PolygoneInversable p : polygones) {
    p.dessine();
  }
  poly.dessine();
  // texte
  textAlign(LEFT,TOP);
  textSize(10);
  fill(255);
  if(showMenu) {
    text("frame area          = "+round(poly.aire)+"/"+round(poly.aireCible)+", fps:"+round(frameRate)+"(' ':reset,'m':showInfo)",
         10,10);
    if(editFrame) {text("('e') EDIT FRAME",10,30);} else {text("('e') EDIT POLYGONS",10,30);}
    if(polyFeedBack) {text("('f') FEEDBACK",10,50);} else {text("('f') NO FEEDBACK",10,50);}
    if(pause) {text("('p') PAUSE",10,70);} else {text("('p') COLLISION RUNNING",10,70);}
    int i=0;
    for(PolygoneInversable p : polygones) {
      text("polygone "+nf(i,2)+" area = "+round(p.aire)+"/"+round(p.aireCible),
           10,(i*10)+90);
      i++;
    }
  }
}

void keyPressed() {
  if(key==' ') {reset();}
  if(key=='m') {showMenu = !showMenu;}
  if(key=='e') {editFrame = !editFrame;}
  if(key=='f') {polyFeedBack = !polyFeedBack;}
  if(key=='p') {pause = !pause;}
  if(keyCode==RIGHT) {if(nombreDePolygones<=20){nombreDePolygones+=10;reset();}}
  if(keyCode==LEFT) {if(nombreDePolygones>=20){nombreDePolygones-=10;reset();}}
}

