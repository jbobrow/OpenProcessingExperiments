
class Barra {
  color Col;


  Barra() {

  }

  void dibujar(float bposx, float bposy, float bposz,float tposx, float tposy, float tposz) {
    Col = color(random(0,255),random(0,255),random(0,255));

    pushMatrix();
    translate(tposx,tposy,tposz);
    // rotateX (radians(mouseX));
    rotateY(0.5);
    fill(15,141,242);
    noStroke();
    map(bposy,mouseX,mouseY,mouseY,mouseX);
        bposy =mouseX*2;
    box(bposx,bposy,bposz);
    popMatrix();

  }
}


