
ArrayList<Feuerwerk> feuerwerke = new ArrayList<Feuerwerk>();


void setup() {
  size(600, 600);
  smooth();
  background(0);
  frameRate(120);
  colorMode(HSB, 100);
}

boolean mouseReleased = false;
float pressedMouseX = 0;
float pressedMouseY = 0;
//Feuerwerk f = new Feuerwerk();

void mouseReleased() {
  feuerwerke.add(new Feuerwerk(mouseX, mouseY));
}

void draw() {
  noStroke();
  fill(0, 15);
  rect(0, 0, 600, 600);

  for (int i = feuerwerke.size()-1; i >= 0; i--) {
    Feuerwerk f = feuerwerke.get(i);
    f.redraw();
    f.redrawdeco();
    f.redrawdeco2();
    if (!f.aktiv) feuerwerke.remove (f);
  }
}

class Feuerwerk {

  float w = 0;
  float h = 0;
  float w2 = 0;
  float h2 = 0;
  float w3 = 0;
  float h3 = 0;
  int time;
  int diff;
  int pMX;
  int pMY;
  float c = random(0, 100);
  boolean aktiv=true;
  float n;
  float n2;
  float r = random(0, 50);
  float r2 = random(-5, 5);
  int x = 1;

  public Feuerwerk(int mx, int my) {
    pMX = mx;
    pMY = my;
    time = frameCount;
    noStroke();
    fill(0, 20);
    rect(0, 0, 500, 500);
  }

  void redraw() {                              //Feuerwerkstrahlen in Kreis
    diff = frameCount - time; 
    if (diff>200) {
      return;
    }

    for (int i = 1; i < 45; i++) {
      stroke(c, 100, 100-i*2);
      strokeWeight(4);
      point(sin(i)*w+pMX+r2, cos(i)*h+pMY+r2);
    }

    h+=1.6;
    w+=1.6;
  }
  void redrawdeco() {                          //Glitzer
    diff = frameCount - time; 
    if (diff>400) {
      aktiv=false;
    }

    n = noise(diff*0.5);
    for (int g = 0; g < 5; g++) {
      stroke(c, 100, 100);
      strokeWeight(2);
      point(pMX+random(-g-1*h2*10, g+1*h2*10), pMY+random(-g-1*w2*10, g+1*w2*10));
    }

    h2+=0.8;
    w2+=0.8;
  }
  
  void redrawdeco2() {                        //weisses Band nach unten
    diff = frameCount - time; 
    if (diff>350) {
      aktiv=false;
    }

    n2 = noise(x*0.05);

    for (int g = 0; g < 300; g++) {
      stroke(100);
      strokeWeight(2);
      point(50*n2+pMX, diff*0.1+pMY+x);
    }
    x++;
  }
}


