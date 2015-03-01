
void setup() {
  size(700, 700);
  background(0);
  stroke(color(255, 100));
  smooth();
  fill(255);
}

float r=random(255)+75;
float g=random(255)+75;
float b=random(255)+75;
int edgenum=0;
int Dx;
int Dy;
int coords [] = new int [6];
 
void draw() {
  if (coords[5]>0) {
    for (int i = 0; i < 100; i++)
    {
      switch(int(random(3)))
      {
      case 0:
        Dx = (coords[0]+Dx)/2;
        Dy = (coords[1]+Dy)/2;
        break;
      case 1:
        Dx = (coords[2]+Dx)/2;
        Dy = (coords[3]+Dy)/2;
        break;     
      case 2:
        Dx = (coords[4]+Dx)/2;
        Dy = (coords[5]+Dy)/2;
        break;
      }
      stroke(r,g,b);
      point(Dx, Dy);
    }
  } 
}

void mouseClicked() {
  if (coords[5]>0) {
    edgenum=0;
    for (int i=0; i<6; i++) {
      coords[i]=0;
      }
    r=random(255)+75;
    g=random(255)+75;
    b=random(255)+75;
    }
  edgenum+=1;
  coords[(edgenum*2)-2]=mouseX;
  coords[(edgenum*2)-1]=mouseY;
}


