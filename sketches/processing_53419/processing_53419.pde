
PImage nucl;
PImage elec;
PImage bg;
float neut;
float proto;

float angle;
float angle2;
float angle3;
float angle4;
float angle5;
float r;
float speed;

void setup () {
  size (800, 500);
  smooth();
  bg = loadImage ("BG.gif");
  elec = loadImage ("geodesic.gif");
  nucl = loadImage ("Sphere.png");
  angle = 0.0;
  angle2 = 0.0;
  angle3 = 0.0;
  angle4 = 0.0;
  angle5 = 0.0;
  speed = 0.01;


  smooth();
  imageMode(CENTER);
  frameRate(60);
}

void draw() {

  //BG
  pushMatrix();
  r = random(1, 8);
  image (bg, width/2, height/2);
  //  filter (BLUR,r);
  popMatrix();

  //Nucleus
  pushMatrix(); 
  translate (mouseX, mouseY);
  scale (cos (angle) +4);
  image (nucl, 0, 0, 20, 20);
  popMatrix();





  //  for (int i=1; i<=255; i=2) {

  //    stroke(i,100,100);


  stroke (1, 80);

  /*  //Ring 1
   pushMatrix();
   translate (mouseX, mouseY);
   scale (cos (angle) +4);
   noFill();
   //rotate(70);
   ellipse (0, 0, 20, 100);
   popMatrix();
   
   //Ring 2
   pushMatrix();
   translate (mouseX, mouseY);
   scale (cos (angle) +4);
   rotate(40);
   ellipse (0, 0, 30, 100);
   popMatrix();
   
   
   //Ring 3
   pushMatrix();
   translate (mouseX, mouseY);
   scale (cos (angle) +4);
   rotate(05);
   ellipse (0, 0, 20, 150);
   popMatrix();
   
   //Ring 4
   pushMatrix();
   translate (mouseX, mouseY);
   scale (cos (angle) +4);
   rotate(25);
   ellipse (0, 0, 35, 100);
   popMatrix();
   //  }
   */


  //orbits
  float orb = sin (angle)*200;
  float orb2 = sin (angle+100)*200;
  float orb3 = cos (angle+120)*200;
  float orb4 = sin (angle+150)*200;

  //Scale
  float elecsi = sin (angle2) *50;
  float elecsi2 = sin (angle3) *50;
  float elecsi3 = cos (angle4) *50;
  float elecsi4 = sin (angle5) *50;

  //Electron 1 
  pushMatrix ();
  translate (0, orb);
  translate (mouseX, mouseY);
  image (elec, 0, 0, elecsi2, elecsi2);
  popMatrix();

  //Electron 2
  pushMatrix ();
  translate (orb2, 0);
  translate (mouseX, mouseY);
  image (elec, 0, 0, elecsi2, elecsi2);
  popMatrix();

  //electron 3
  pushMatrix ();
  translate (orb3+30, 0);
  translate (mouseX, mouseY);
  image (elec, 0, 0, elecsi3, elecsi3);
  popMatrix();

  //electron 4
  pushMatrix ();
  translate (0, orb3);
  translate (mouseX, mouseY);
  image (elec, 0, 5, elecsi3, elecsi3);
  popMatrix();


  //increase
  angle += speed;
  angle2 += .005;
  angle3 += .0045;
  angle4 += .0048;
  angle5 += .005;
}


