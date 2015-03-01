
PImage bicmac;

int bicmacs = 100;
float []posx = new float [bicmacs];
float []posy = new float [bicmacs];
float []velx = new float [bicmacs];
float []vely = new float [bicmacs];

void setup() {
  size (400, 400);

  bicmac = loadImage ("bicmac.png");

  imageMode (CENTER);

  for (int i=0; i<bicmacs; i ++) {
    posx[i] = int (random (width));
    posy[i] = int (random (height));
    velx[i] = random (1, 3);
    vely[i] = random (1, 3);
  }
}

void draw () {
  colorMode (RGB, 255);
  fill (0, 25);
  rect (0, 0, width, height);

  for (int i=0; i<bicmacs; i++) {
    posx[i] += velx[i];
    posy[i] += vely[i];


    //comprobamos las posiciones X
    if (posx[i] <0 || posx[i] >width) {
      velx[i] = -velx[i];
    } 
    //comprobamos las posiciones Y
    if ((posy[i] <0) || (posy[i] >height)) {
      vely [i] = -vely [i];
    }
  }

  for (int i=0; i<bicmacs; i++) {
    image (bicmac, posx[i], posy[i],bicmac.width*0.2,bicmac.height*0.2);
  }
}



