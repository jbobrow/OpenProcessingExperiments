
int Posx;
int Posy;

int i;
int j;
void setup() {


  size(500, 500);

}

void draw() {


  background (0);
  for (int Posx=0; Posx<=width; Posx+=50) {
    for (int Posy=0; Posy<=height; Posy+=50) {
      fill(Posx, Posy, random (255), random (255));
      ellipse(Posx, Posy, 30, 30);
    }
  }

}






  



