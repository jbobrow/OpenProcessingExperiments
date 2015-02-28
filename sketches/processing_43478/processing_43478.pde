
float x1, x2, x3, x4, k, l, h, s, b;
int v1, v2, c, n, e;


void setup() {
  size(600, 400);
  
  colorMode(HSB, 255);
  x1 = random (0, width*3);
  x2 = random (0, width*3);

  v1 = int (random( height/16, height*2));
  v2 = int (random( height/16, height*2));
  c = int (random(0, 200));
  n = int (random(1, width*3));
  e = int (random( 0, 200));
  k=3;
  l=10;
  float l = map(width, 0, width, 0, width/2);
  float k = map(width, 0, width, 0, width/2);

  h= int(random(0, 255));
  s= int(random(0, 255));
  b= int(random(0, 255));
}

void draw () { 
  background(255);
  noFill();
  smooth();



  for (int i=0; i<n; i++) {

    stroke(h, s, b, l*i);
    strokeWeight(k);


    bezier(x1-e*i, height, x1-e*i, height-v1, x2-c*i, v2, x2-c*i, 0);
  }
}

void keyReleased() {

  if ((key == '3')||(key == 'c')) { // change la distance des tangentes du bas
    v1 = int (random( height/16, height*2));
  }

  if ((key == '9')||(key == 'e')) { // change la distance des tangentes du haut
    v2 = int (random( height/16, height*2));
  }

  if ((key == '8')||(key == 'z')) {// change la distance entre les points du haut
    c = int (random(0, 200));
  }

  if ((key == '5')||(key == 's')) {// change le nombre
    n = int (random(1, width*3));
  }

  if ((key == '+')||(key == 'g')) {// change les distances en haut et en bas
    c = int (random(0, 200));
    e = int (random( 0, 200));
  }

  if ((key == '2')||(key == 'x')) {//change la distance entre les points du bas
    e = int (random( 0, 200));
  }

  if (( key == '1')||(key == 'w')) {// change les positions sur width des points de départ du bas
    x1 = random (0, width*3);
  }

  if (( key == '7')||(key == 'a')) {// change les positions sur width des points de départ du haut
    x2 = random (0, width*3);
  }


  if ((key== '6')||(key=='q')) { // change la distance des tangentes
    v1 = int (random( height/16, height*2));
    v2 = int (random( height/16, height*2));
  }


  if (( key == '4')||(key == 's')) { // change les positions sur width des points
    x1 = random (0, width*3);
    x2 = random (0, width*3);
  }


  if (( key == '0')||(key == 'f')) {// change tout
    x1 = random (0, width*3);
    x2 = random (0, width*3);
    v1 = int (random( height/16, height*2));
    v2 = int (random( height/16, height*2));
    c = int (random(0, 200));
    e = int (random( 0, 200));
    n = int (random(1, width*3));
    l = int (random(0, 255));
    k = int (random(1, 10));
    h= int(random(0, 255));
    s= int(random(0, 255));
    b= int(random(0, 255));
  }
}

void keyPressed() {

  if (key == CODED) {

    if ( keyCode == RIGHT) { 
      l=l+1;
    } // flèche droite et gauche change l'opacité
    if ( keyCode == LEFT) { 
      l=l-1;
      if (l<-10) {
        l=l+1;
      } 
      if ((l<1)&&(l>=-10)) {
        l=map(l, 1, -10, 1, 0);
      }
    } // flèche haut et bas change l'épaisseur du trait


    if ( keyCode == DOWN) { 
      k=k-1;
      if (k<-10) {
        k=k+1;
      } 
      if ((k<1)&&(k>=-10)) {
        k=map(k, 1, -10, 1, 0);
      }
    }
    if   (keyCode == UP) { 
      k=k+1;
    }
  }

  if ( key == 'i') { 
    h=h+1;
  }

  if ( key == 'k') { 
    h=h-1;
  }

  if ( key == 'o') { 
    s=s+1;
  }
  if ( key == 'l') { 
    s=s-1;
  }

  if ( key == 'p') { 
    b=b+1;
  }
  if ( key == 'm') { 
    b=b-1;
  }
}


