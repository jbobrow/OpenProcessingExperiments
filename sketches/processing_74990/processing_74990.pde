
class Rotor {
  float x, y; // X-coordinate, y-coordinate
  float speed,sc; // Used to define the tilt
  float haut,larg; // Height of the egg
  float init;

  // Constructor
  Rotor(int xpos, int ypos, float h, float l,float s) {
    x = xpos;
    y = ypos;
    haut = h;
    larg=l;
    speed=s;
    init=random(100);
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
    translate(x, y);
    sc=sin(((float)frameCount+init)*speed/10);
    scale(1,sc);
    rect(0,0,larg,haut);
    fill(0);
    rect(0,0,larg,-haut);
    popMatrix();
    pushMatrix();
    translate(x,y);
    if(((y-80)/100)%2==1){fill(255);}
    beginShape();
    vertex(-30,-haut);
    vertex(-300,0);
    vertex(-30,haut);
    vertex(-30,0);
    endShape();
    beginShape();
    vertex(30+larg,-haut);
    vertex(30+larg+280,0);
    vertex(30+larg,haut);
    vertex(30+larg,0);
    endShape();
    popMatrix();
    
  }
}

