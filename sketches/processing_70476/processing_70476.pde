
int tag = 16;

int mon_a_stau=6;
int mon_a_gesperrt=12;
int mon_a_baustelle=6;
int mon_l_stau=4;
int mon_l_gesperrt=104;
int mon_l_baustelle=140;
int mon_b_stau=9;
int mon_b_gesperrt=16;
int mon_b_baustelle=28;
//alles mal 4

int don_a_stau=24;
int don_a_gesperrt=20;
int don_a_baustelle=8;
int don_l_stau=4;
int don_l_gesperrt=136;
int don_l_baustelle=100;
int don_b_stau=4;
int don_b_gesperrt=20;
int don_b_baustelle=28;
//triangle baustelle

int fr_a_stau=12;
int fr_a_gesperrt=12;
int fr_a_baustelle=12;
int fr_l_stau=4;
int fr_l_gesperrt=132;
int fr_l_baustelle=140;
int fr_b_stau=4;
int fr_b_gesperrt=80;
int fr_b_baustelle=28;
//rect=stau

boolean stop = false;
float x_b = 0;
float y_b = 0;
float x_a =0;
float y_a =0;
float x_l =0;
float y_l =0;

float x_b_r =0;
float y_b_r =0;
float x_b_c=0;
float y_b_c=0;
float x_b_t=0;
float y_b_t=0;

float x_a_r =0;
float y_a_r =0;
float x_a_c=0;
float y_a_c=0;
float x_a_t=0;
float y_a_t=0;

float x_l_r =0;
float y_l_r =0;
float x_l_c=0;
float y_l_c=0;
float x_l_t=0;
float y_l_t=0;




PImage car;
PImage A;
PImage B;
PImage L;
PImage Arect;
PImage ACross;
PImage ATriangle;
PImage Brect;
PImage BCross;
PImage BTriangle;
PImage Lrect;
PImage LCross;
PImage LTriangle;



int rectsizea = 15;
int rectsizeB = 15;
int rectsizel=15;

int crosssizea=15;
int crosssizeb=15;
int crosssizel=15;

int tsizea=15;
int tsizeb=15;
int tsizel=15;

int rectsize=15;

float xcenter;    // Mittelpunkt auf der x-Achse
float ycenter;    // Mittelpunkt auf der y-Achse
float rad = 120; 
float radb = 70;
float radl = 200;
float radr = 60;
float radt = 80;
float radc= 40;// Radius der Kreisbahn
float angle;
float angle2;
float angle3;
float angle4;
float angle5;
float angler;
float anglet;
float anglec;

PFont font;
PFont font2;



void setup() {
  size(500, 500);
  if (frame != null) {
    frame.setResizable(true);
  }
  background(0, 0, 0, 104);

  A=loadImage("A.png");
  B=loadImage("B.png");
  L=loadImage("L.png");
  font = loadFont("AndaleMono-14.vlw");
  font2 = loadFont("AndaleMono-12.vlw");
  textFont(font);


  Arect=loadImage("Arect.png");
  ACross=loadImage("ACross.png");
  ATriangle=loadImage("ATriangle.png");
  Brect=loadImage("Brect.png");
  BCross=loadImage("BCross.png");
  BTriangle=loadImage("BTriangle.png");
  Lrect=loadImage("Lrect.png");
  LCross=loadImage("LCross.png");
  LTriangle=loadImage("LTriangle.png");
  car=loadImage("car.png");

  ycenter=height/2;
  xcenter=width/2;
}

void draw() {
  noCursor();
  background(0);

  text(str(tag) + ".06.2012", 350, 40);
  text("Verkehrsdaten", 350, 20); 

  if (dist(mouseX, mouseY, x_b_r, y_b_r) < 50) { 
    text("Stau", x_b_r, y_b_r);  

    ;
  }
  if (dist(mouseX, mouseY, x_b_r, y_b_r) < 20) { 
    text("b1,b5", x_b_r, y_b_r+20);  

    ;
  }



  if (dist(mouseX, mouseY, x_b_c, y_b_c) < 50) { 
    text("gesperrt", x_b_c, y_b_c);  

    ;
  }
  if (dist(mouseX, mouseY, x_b_c, y_b_c) < 20) { 
    text("b12,b5", x_b_c, y_b_c+20);  

    ;
  }



  if (dist(mouseX, mouseY, x_b_t, y_b_t) < 50) { 
    text("Baustelle", x_b_t, y_b_t);  

    ;
  }
  if (dist(mouseX, mouseY, x_b_t, y_b_t) < 20) { 
    text("b1", x_b_t, y_b_t+20);  

    ;
  }


  if (dist(mouseX, mouseY, x_l_t, y_l_t) < 50) { 
    text("Baustelle", x_l_t+20, y_l_t);  

    ;
  }
  if (dist(mouseX, mouseY, x_l_t, y_l_t) < 20) { 
    text("L85,L1003,L1022,L1054", x_l_t+20, y_l_t+20);  

    ;
  }






  image(car, xcenter, ycenter );
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);

  if (!stop) {
    //Bundesstraße B!!, kreist um car
    angle2 += 0.01; 
    x_b = xcenter + cos (angle2) * rad;
    y_b = ycenter + sin (angle2) * rad;
  }
  image(B, x_b, y_b, 60, 60);

  if (!stop) {
    //Brect kreist um B
    angler += 0.021; 

    x_b_r = x_b + cos (angler) * radr;
    y_b_r = y_b + sin (angler) * radr;
  }

  image(Brect, x_b_r, y_b_r, rectsizeB, rectsizeB );

  if (!stop) {
    //BCross kreist um B
    anglec += 0.031; 

    x_b_c = x_b + cos (anglec) * radc;
    y_b_c = y_b + sin (anglec) * radc;
  }
  image(BCross, x_b_c, y_b_c, crosssizeb, crosssizeb );

  if (!stop) {
    //BTriangle kreist um B
    anglet += 0.051; 

    x_b_t = x_b + cos (anglet) * radt;
    y_b_t = y_b + sin (anglet) * radt;
  }
  image(BTriangle, x_b_t, y_b_t, tsizeb, tsizeb );

  if (!stop) {
    //Landesstraße L ,kreist um car
    angle5 += 0.006; 
    x_l = xcenter + cos (angle5) * radl;
    y_l = ycenter + sin (angle5) * radl;
  }

  image(L, x_l, y_l);
  if (!stop) {
    //Lrect kreist um L
    angler += 0.01; 

    x_l_r = x_l + cos (angler) * radr;
    y_l_r = y_l + sin (angler) * radr;
  }
  image(Lrect, x_l_r, y_l_r, rectsizel * 2, rectsizel * 2);


  //LCross kreist um L
  if (!stop) {
    anglec += 0.01; 

    x_l_c = x_l + cos (anglec) * radc;
    y_l_c = y_l + sin (anglec) * radc;
  }
  image(LCross, x_l_c, y_l_c, crosssizel * 2, crosssizel * 2);

  //LTriangle kreist um L
  if (!stop) {
    anglet += 0.01; 

    x_l_t = x_l + cos (anglet) * radt;
    y_l_t = y_l + sin (anglet) * radt;
  }
  image(LTriangle, x_l_t, y_l_t, tsizel, tsizel );

  if (!stop) {
    //A, kreist um car
    angle += 0.03; 
    x_a = xcenter + cos (angle) * radb;
    y_a = ycenter + sin (angle) * radb;
  }
  image(A, x_a, y_a, 160, 160);
  if (!stop) {
    //ACross kreist um A
    anglec += 0.01; 

    x_a_c = x_a + cos (anglec) * radb;
    y_a_c = y_a + sin (anglec) * radb;
  }
  image(ACross, x_a_c, y_a_c, crosssizea * 2, crosssizea * 2);
  if (!stop) {
    //arect kreist um A
    angler += 0.03; 

    x_a_r = x_a + cos (angler) * radr;
    y_a_r = y_a + sin (angler) * radr;
  }
  image(Arect, x_a_r, y_a_r, rectsizea * 2, rectsizea * 2);

  if (!stop) {
    //Atriangle kreist um A
    anglet += 0.019; 

    x_a_t = x_a + cos (anglet) * radt;
    y_a_t = y_a + sin (anglet) * radt;
  }
  image(ATriangle, x_a_t, y_a_t, tsizea, tsizea );
}

void keyPressed() {
  if (key == ' ') {
    stop = !stop;
  }
}

void mousePressed() {


  if (tag >= 19) {
    tag = 16;
  }
  else {
    tag = tag + 1;
  }
 
  //rect stau
  if (rectsizel == mon_l_stau) {
    rectsizel = don_l_stau;
  } 
  else if (rectsizel == don_l_stau) {
    rectsizel = fr_l_stau;
  } 
  else {
    rectsizel = mon_l_stau;
  }


  if (rectsizea == mon_a_stau) {
    rectsizea = don_a_stau;
  } 
  else if (rectsizea == don_a_stau) {
    rectsizea = fr_a_stau;
  } 
  else {
    rectsizea = mon_a_stau;
  }



  if (rectsizeB == mon_b_stau) {
    rectsizeB = don_b_stau;
  } 
  else if (rectsizeB == don_b_stau) {
    rectsizeB = fr_b_stau;
  } 
  else {
    rectsizeB = mon_b_stau;
  }

  //a gesperrt, cross

  if (crosssizea == mon_a_gesperrt) {
    crosssizea = don_a_gesperrt;
  } 
  else if (crosssizea == don_a_gesperrt) {
    crosssizea = fr_a_gesperrt;
  } 


  else {
    crosssizea = mon_a_gesperrt;
  }

  if (crosssizeb == mon_b_gesperrt) {
    crosssizeb = don_b_gesperrt;
  } 
  else if (crosssizeb == don_a_gesperrt) {
    crosssizeb = fr_b_gesperrt;
  } 
  else {
    crosssizeb = mon_b_gesperrt;
  }




  if (crosssizel == mon_l_gesperrt) {
    crosssizel = don_l_gesperrt;
  } 
  else if (crosssizel == don_l_gesperrt) {
    crosssizel = fr_l_gesperrt;
  } 
  else {
    crosssizel = mon_l_gesperrt;
  }


  if (tsizea == mon_a_baustelle) {
    tsizea = don_a_baustelle;
  } 
  else if (tsizea == don_a_baustelle) {
    tsizea = fr_a_baustelle;
  } 
  else {
    tsizea = mon_a_baustelle;
  }


  if (tsizeb == mon_b_baustelle) {
    tsizeb = don_b_baustelle;
  } 
  else if (tsizeb == don_b_baustelle) {
    tsizeb = fr_b_baustelle;
  } 
  else {
    tsizeb = mon_b_baustelle;
  }


  if (tsizel == mon_l_baustelle) {
    tsizel = don_l_baustelle;
  } 
  else if (tsizel == don_l_baustelle) {
    tsizel = fr_l_baustelle;
  } 
  else {
    tsizel = mon_l_baustelle;
  }
}


