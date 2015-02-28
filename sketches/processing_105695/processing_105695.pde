
void setup() {
  size(800, 800);
}
float posX;
float posY;
int widthE;
float heightE;
float topX;
float topY;
float sizeX;
float sizeY;

void draw() {
  translate(width/2, height/2);
  rotate(random(0, PI));

  rotate(random(0, PI));
  feather();
}




void feather() {
  topX=random(-width, width);
  topY=random(-height, height);
  sizeX=random(200, 1200);
  sizeY=random(200, 1800);

  for (int N=1;N<random(5,20);N++) {
    noStroke();
    curve((topX-sizeX)/(N*10), (topY+sizeY)/(N*10), (topX-sizeX)/(N*10), (topY+sizeY)/(N*10), topX, topY, topX, topY);
    noStroke();
    curve((topX-sizeX)/(N*10), (topY+sizeY)/(N*10), topX, topY, topX, topY, (topX+sizeX)/(N*10), (topY+sizeY)/(N*10));
    noStroke();
    bezier((topX+sizeX)/(N*10), (topY+sizeY)/(N*10), (topX+sizeX)/(N*10), (topY+sizeY)/(N*10), topX, topY, topX, topY);
    posX=random(-width, width);
    posY=random(-height, height);
    widthE=int(random(1, 4))*10;
    heightE=random(1, 15);
    if (heightE>widthE) {
      for (int i=0;i<widthE/10;i++) {
        arc(posX, posY, widthE-10*i, heightE, 0, TWO_PI);
        line(posX, posY-heightE/2, posX, posY+heightE/2);
      }
    }
  }
}

