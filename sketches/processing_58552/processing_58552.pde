
import peasy.*;

//-----------------Global Variables GUI------------------------
PeasyCam cam;

//-------ArrayLists-----
ArrayList Aeste;

void setup() {
  ////gui////
  size(1280, 720, P3D);
  smooth();
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  //// initialisierun  aeste
  Aeste = new ArrayList();
  PVector aa = new PVector(0, 0, 0);
  PVector bb = new PVector(10, 10, 20);
  Aeste.add( new branch(aa, bb));
}

void draw() {
  background(100);
 /// add new brach///
  int randomAst=int(random(Aeste.size() ));
  branch Mybranch = (branch) Aeste.get(randomAst);
  PVector StartPunkt = Mybranch.B;
  PVector Versatz = new PVector(random(10), random(10), random(10));
  PVector Endpunkt = PVector.add(StartPunkt, Versatz);
  ///////
  //Test intersection....
  ///////
  Aeste.add( new branch(StartPunkt, Endpunkt));
 /////////
 
///display branches///
  for (int i = 0; i < Aeste.size(); i = i+1) {
    branch b = (branch) Aeste.get(i);
    b.drawBranch();
  }
///////////
}


