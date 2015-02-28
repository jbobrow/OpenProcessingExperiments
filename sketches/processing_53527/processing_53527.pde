
PImage idea6;
PImage i6alp;
float a = 50;
int Length = 100;
ArrayList<Snow> snows;
ArrayList<Bom> boms;

void setup() {
  idea6 = loadImage("idea6.png");
  i6alp = loadImage("idea6_alpha.png");
  background(255);
  size(800, 500);
  frameRate(30);

  image(idea6, 0, 0);

  snows = new ArrayList();
  boms = new ArrayList();
}


void draw() {
  image(i6alp, 0, 0);

  snows.add(new Snow(random(0,width), 0));
  
  for (int i=0;i<snows.size();i++) {
    if (snows.get(i).isDead()) {
      snows.remove(i);
    }
  }

  for (Snow b : snows) {
    b.fall();
  }
  
  for(int i=0; i<snows.size(); i++){
    if(snows.get(i).wktk()){
      boms.add(new Bom(mouseX, mouseY));
    }
  }
  
  for (Bom b : boms) {
    b.draw();
  }

  for(int i=0;i<snows.size();i++) {
    if (snows.get(i).wktk()) {
      snows.remove(i);
    }
  }
  for(int i=0; i<boms.size(); i++){
    if(boms.get(i).isDead()){
      boms.remove(i);
    }
  }
}


