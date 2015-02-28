
void setup () {
  size (780, 420);
}



color black = color (0);
int x = 50;
int y = 50;
int diametre  = 40;
int define = 0;


IntList xeat;
IntList yeat;
IntList pacballs = new IntList ();




void draw () {
  background (255);
  manger ();
  lines();
  fill(255, 239, 0);
  stroke (1);
  ellipse (x, y, diametre, diametre);
  color bordure_haut = get (x, y-diametre/2 - 2);
  color bordure_bas = get (x, y+diametre/2 + 2);
  color bordure_gauche = get (x-diametre/2- 2, y);
  color bordure_droite = get (x+diametre/2 + 2, y);
  print (bordure_haut);
  //if ((pixels[(x+diametre/2) * y] != black) && (pixels[(x-diametre/2) * y] != black) && (pixels[(y+diametre/2) * x] != black) && (pixels[(y-diametre/2) * x] != black)) {
  if ((bordure_haut != black) && (bordure_bas != black) && (bordure_gauche != black) && (bordure_droite != black)) {
    loadPixels();
    if (keyCode == UP) {
      y -= 2;
    } 
    else if (keyCode == DOWN) {
      y += 2;
    } 
    else if (keyCode == LEFT) {
      x -= 2;
    }
    else if (keyCode == RIGHT) {
      x += 2;
    }
    updatePixels();
  } 
  else if (bordure_haut == black) {
    y  += 2;
  } 
  else if (bordure_bas == black) {
    y-= 2 ;
  } 
  else if (bordure_gauche == black) {
    x += 2 ;
  } 
  else if (bordure_droite == black) {
    x -= 2 ;
  }
}


// Draw background lines
void lines () {
  stroke (0);
  fill (255, 0, 0);
  // Contours
  line (20, 10, 760, 10);
  line (20, 10, 20, 410);
  line (20, 410, 760, 410);
  line (760, 10, 760, 410);
  //Barres verticales 
  rect (205, 10, 20, 80);
  rect (205, 330, 20, 80);
  rect (565, 10, 20, 80);
  rect (565, 330, 20, 80);
  //Petites barres horizontales
  rect (160, 160, 50, 20);
  rect (160, 240, 50, 20);
  rect (565, 160, 50, 20);
  rect (565, 240, 50, 20);
  //Grandes barres horizontales
  rect (285, 80, 200, 20);
  rect (285, 330, 200, 20);
  //Barres horizontales et verticales en meme temps
  //haut gauche
  rect (80, 80, 60, 20);
  rect (80, 90, 20, 80);
  // bas gauche
  rect (80, 330, 60, 20);
  rect (80, 250, 20, 80);
  //bas droit
  rect (640, 330, 60, 20);
  rect (680, 250, 20, 80);
  //haut droit
  rect (640, 80, 60, 20);
  rect (680, 90, 20, 80);
  //Antre des monstres
  rect (285, 160, 50, 20);
  rect (285, 160, 20, 80);
  rect (285, 240, 200, 20);
  rect (475, 160, 20, 100);
  rect (435, 160, 50, 20);
}





void manger () {

  define += 1;
  stroke (2);
  fill(0, 0, 255);
  int manger = 10;
  IntList pacballs; 
  IntList xeat;
  IntList yeat;
  xeat = new IntList ();
  yeat = new IntList ();

  if (define == 0) {
    //Ligne 1
    xeat.append(50);
    xeat.append(90);
    xeat.append(130);
    xeat.append(170);
    xeat.append(250);
    xeat.append(290);
    xeat.append(330);
    xeat.append(370);
    xeat.append(410);
    xeat.append(450);
    xeat.append(490);
    xeat.append(530);
    xeat.append(610);
    xeat.append(650);
    xeat.append(690);
    xeat.append(730);
    //Ligne 2
    xeat.append(50);
    xeat.append(170);
    xeat.append(250);
    xeat.append(530);
    xeat.append(610);
    xeat.append(730);
    //Ligne 3
    xeat.append(50);
    xeat.append(130);
    xeat.append(170);
    xeat.append(210);
    xeat.append(250);
    xeat.append(290);
    xeat.append(330);
    xeat.append(370);
    xeat.append(410);
    xeat.append(450);
    xeat.append(490);
    xeat.append(530);
    xeat.append(570);
    xeat.append(610);
    xeat.append(650);
    xeat.append(730);

    //Ligne 4
    xeat.append(50);
    xeat.append(130);
    xeat.append(250);
    xeat.append(530);
    xeat.append(650);
    xeat.append(730);
    //Ligne 5
    xeat.append(50);
    xeat.append(90);
    xeat.append(130);
    xeat.append(170);
    xeat.append(210);
    xeat.append(250);
    xeat.append(530);
    xeat.append(570);
    xeat.append(610);
    xeat.append(650);
    xeat.append(690);
    xeat.append(730);
    //Ligne 4
    xeat.append(50);
    xeat.append(130);
    xeat.append(250);
    xeat.append(530);
    xeat.append(650);
    xeat.append(730);
    //Ligne 3
    xeat.append(50);
    xeat.append(130);
    xeat.append(170);
    xeat.append(210);
    xeat.append(250);
    xeat.append(290);
    xeat.append(330);
    xeat.append(370);
    xeat.append(410);
    xeat.append(450);
    xeat.append(490);
    xeat.append(530);
    xeat.append(570);
    xeat.append(610);
    xeat.append(650);
    xeat.append(730);
    //Ligne 2
    xeat.append(50);
    xeat.append(170);
    xeat.append(250);
    xeat.append(530);
    xeat.append(610);
    xeat.append(730);
    //Ligne 1
    xeat.append(50);
    xeat.append(90);
    xeat.append(130);
    xeat.append(170);
    xeat.append(250);
    xeat.append(290);
    xeat.append(330);
    xeat.append(370);
    xeat.append(410);
    xeat.append(450);
    xeat.append(490);
    xeat.append(530);
    xeat.append(610);
    xeat.append(650);
    xeat.append(690);
    xeat.append(730);



    //Ligne 1
    for (int i=0; i<16; i++) {
      yeat.append(50);
    }
    //Ligne 2
    for (int i=0; i<6;i++) {
      yeat.append(90);
    }
    //Ligne 3
    for (int i=0; i<16;i++) {
      yeat.append(130);
    }
    //Ligne 4
    for (int i=0; i<6; i++) {
      yeat.append(170);
    }
    //Ligne 5
    for (int i=0; i<12; i++) {
      yeat.append(210);
    }
    //Ligne 4
    for (int i=0; i<6; i++) {
      yeat.append(250);
    }
    //Ligne 3
    for (int i=0; i<16;i++) {
      yeat.append(290);
    }
    //Ligne 2
    for (int i=0; i<6;i++) {
      yeat.append(330);
    }
    //Ligne 1
    for (int i=0; i<16; i++) {
      yeat.append(370);
    }


    pacballs = new IntList ();
    for (int i=0; i<100; i++) {
      pacballs.append(0);
    }
  }

  for (int i=0; i<100; i++) {
    int nums = pacballs.get(i);
    if (nums == 0) {
      int xmanger = xeat.get(i);
      int ymanger = yeat.get(i);
      ellipse (xmanger, ymanger, manger, manger);
    }
  }
  for (int i=0; i<100 ; i++) {
    int xmanger = xeat.get(i);
    int ymanger = yeat.get(i);
    if (sqrt(sq(xmanger - mouseX) + sq(ymanger-mouseY)) < manger *1/ 2 + diametre*1 / 2) {
      pacballs.set(i, 1);
    }
  }
}

