
ArrayList zoge;
int velikost_zoge;


void setup() {
  
  size(500,500);
  //frameRate(35);
  velikost_zoge = 12;
  zoge = new ArrayList();
  for (int i = 1; i <= 200; i++)
    zoge.add(new Zoga(mouseX, mouseY));
}



void draw() {
  
  background(255);

  for (int i = zoge.size()-1; i >= 0; i--) {
    Zoga trenutna = (Zoga) zoge.get(i);
    trenutna.posodobi();
    trenutna.prikazi();
  }

}


class Zoga {

  private PVector lokacija, smer, hitrost;
 
  Zoga() {
    lokacija = new PVector(random(width),random(height));
    smer = new PVector(random(2*width)-width,random(2*height)-height);
    hitrost = new PVector(0,0);
    
    smer.normalize();
    smer.div(100);
  }
  
  Zoga(int x, int y) {
    lokacija = new PVector(x,y);
    smer = new PVector(random(2*width)-width,random(2*height)-height);
    hitrost = new PVector(0,0);
    
    smer.normalize();
    smer.div(100);
  }
  
  void posodobi() {
    hitrost.add(smer);
    hitrost.limit(10);
    lokacija.add(hitrost);
    preveri_robove();
  }
  
  void prikazi() {
    fill(random(256), random(256), random(256));
    ellipse(lokacija.x, lokacija.y, velikost_zoge, velikost_zoge);
  }
  
  void preveri_robove() {
    if (lokacija.x > width || lokacija.x < 0) {
      smer.x*=-1;
      hitrost.x*=-1;
    }

    if (lokacija.y > height || lokacija.y < 0) {
      smer.y*=-1;
      hitrost.y*=-1;
    }
    
  }
  
}

void mousePressed() {
  if (mouseButton == LEFT) {
    zoge.add(new Zoga(mouseX, mouseY));
  }
}
