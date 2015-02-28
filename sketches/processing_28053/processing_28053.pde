
//Copyright Jonathan Fraser 2011
//Free to use for non-commercial purposes
//Enjoy :)

ArrayList plist = new ArrayList();
int MAX = 50;

void setup() {
  size(400,400);
  background(100);
}

void draw() {
  background(50);
  if(mousePressed && mouseButton == RIGHT) {
    background(50);
    boolean clearall = true;
    while(plist.size() > 0) {
      for(int i = 0; i < plist.size(); i++) {
        plist.remove(i);
      }
    }
  }

  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i); 
    //makes p a particle equivalent to ith particle in ArrayList
    p.run();
    p.update();
    p.gravity();
  }
}

void mousePressed() {
  for (int i = 0; i < MAX; i ++) {
    plist.add(new Particle(mouseX,mouseY)); // fill ArrayList with particles

    if(plist.size() > 5*MAX) {
      plist.remove(0);
    }
  }
}


