
float xmag, ymag = 0;
float newXmag, newYmag = 0; 

List listRec = new ArrayList();


void setup() 
{ 
  size(500, 300, P3D); 
  noStroke(); 
  colorMode(RGB, 255);
  //smooth(); 

  for (int i=0; i<200; i++) {
    listRec.add(new Rec(random(2, 3), random(0.05, 0.1), 40, random(0, 2*PI), random(0, 2*PI) ));
  }
} 

int count = 0;
void draw() 
{ 

  background(0.5);

  translate(width/2, height/2, -30); 

  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0;
  }

  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0;
  }

  rotateX(-ymag); 
  rotateY(-xmag); 
  Rec rec;
  count++;

  for (int i=0; i<listRec.size(); i++) {
    rec = (Rec)listRec.get(i);

    if (count > 2) {
      rec.update();
    }
    rec.draw();
  }
  if (count > 2) {

    count = 0  ;
  }
}

void mouseClicked() {
  listRec.clear();
  for (int i=0; i<100; i++) {
    listRec.add(new Rec(random(2, 3), random(0.05, 0.1), 40, random(0, 2*PI), random(0, 2*PI) ));
  }
}


