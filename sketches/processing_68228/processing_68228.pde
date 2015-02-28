
int x=400, y=400, randomX=0, randomY=0;


void setup() {
  size(x, y);
  smooth();
  noFill();
}

void draw() {
  background(155);

  strokeWeight(5);
  //fill(255,230,0);
  int r=50;

  stroke(0);//negro
  ellipse((int)(x-r/2)/2, (int)(y-r)/2, r, r);

  stroke(255, 0, 0);//rojo
  // ellipse((int)(x-r/2)/2+r+10, (int)(y-r)/2, r, r);

  if ((randomX!=(int)(x-r/2)/2+r+10)) {
    /*   randomX=getRandomCoord();
     randomY=getRandomCoord();*/
    randomX=(int)random(0, x);
  }
  if (randomY!=(int)(y-r)/2) {
    randomY=(int)random(0, y);
  }
  ellipse(randomX, randomY, r, r);

  stroke(0, 0, 255);//azul
  ellipse((int)((x-r/2)/2)-r-10, (int)(y-r)/2, r, r);

  stroke(255, 255, 0);//amarillo
  ellipse((int)(x-r/2)/2-(r/2)-5, (int)(y-r)/2+r/2, r, r);

  stroke(0, 255, 0);//verde
  ellipse((int)(x-r/2)/2+(r/2)+5, (int)(y-r)/2+r/2, r, r);
}


