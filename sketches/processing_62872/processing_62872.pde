
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/59807*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * Alcys_Hatch
 *
 * Fait par Jacques Maire
 * le mardi 30 mai 2012
 */
PImage img;
float te;
void setup() {
  size(692, 800, P3D);
  img=loadImage("job.gif");
  img.loadPixels();
  size(img.width, img.height, P3D);
  frameRate(20);
}

void draw() {
  background(0);
  // image(img,0,0);
  //-------------------------------------------
  te=millis()*0.005;
  strokeWeight(4); 
  float dt= 5+2*cos(5*te);
  float h=5*dt/sqrt(100+dt*dt);
  float  dx=25/h;
  float dy=5*dt/h;
  for (int i=0;i<img.height-1;i+=dy) {
    hachure(new PVector(5, dt, 0), #DCBBB1, new PVector(0, i, 0));
  }
  for (int i=0;i<img.width-1;i+=dx) {
    hachure(new PVector(5, dt, 0), #DCBBB1, new PVector(i, 0, 0));
  }
  //----------------------------------------
  dt=-8+4*sin(3*te); //vert
  h=-8*dt/sqrt(100+dt*dt);
  dx=64/h;
  dy=dt*8/h;
  strokeWeight(2);
  for (int i=img.height-1;i>10;i+=dy) {
    hachure(new PVector(8, dt, 0), #B99386, new PVector(0, i, 0));
  }
  for (int i=0;i<img.width-1;i+=dx) {
    hachure(new PVector(8, dt, 0), #B99386, new PVector(i, img.height-1, 0));
  }
  //----------------------------------------
  dt=6+4*sin(2*te); 
  h=10*dt/sqrt(100+dt*dt);
  dx=100/h;
  dy=dt*10/h;   
  strokeWeight(2);
  for (int i=0;i<img.height-10;i+=dy) {
    hachure(new PVector(10, dt, 0), #80625A, new PVector(0, i, 0));
  }
  for (int i=0;i<img.width-10;i+=dx) {
    hachure(new PVector(10, dt, 0), #80625A, new PVector(i, 0, 0));
  }
  //-----------------------------------------
  strokeWeight(1);
  dt=-10+4*sin(0*te); 
  h=-10*dt/sqrt(100+dt*dt);
  dx=100/h;
  dy=dt*10/h;
  for (int i=img.height-1;i>10;i+=dy) {
    hachure(new PVector(10, dt, 0), #1D1625, new PVector(0, i, 0));
  }
  for (int i=0;i<img.width-10;i+=dx) {
    hachure(new PVector(10, dt, 0), #1D1625, new PVector(i, img.height-1, 0));
  }
  //---------------------------------------
}


void hachure(PVector dir, int couleur0, PVector depart) {

  while ( cadree (depart)&& (!memeCouleur(couleur (depart), couleur0))) {
    depart=PVector.add(dir, depart);
  }


  PVector  arrivee=PVector.add(dir, depart);

  while ( (cadree (arrivee)) && (memeCouleur(couleur(arrivee), couleur0))) 
  {
    arrivee=PVector.add(dir, arrivee);
  }

  if (cadree(arrivee)) {
    ligne(depart, arrivee);
    depart=PVector.add(dir, arrivee);
    if (cadree(depart)) hachure(dir, couleur0, depart);
  }
  else {

    if (cadree(depart)&&memeCouleur(couleur(depart), couleur0)) {
      while (!cadree (arrivee)) arrivee=PVector.sub(arrivee, dir);
      if ( cadree(arrivee)&&(memeCouleur(couleur(arrivee), couleur0))) {
        ligne(depart, arrivee);
      }
    }
  }
}
boolean memeCouleur(int c1, int c2) {
  boolean res= ((red(c1)==red(c2)) &&(green(c1)==green(c2))&&(blue(c1)==blue(c2)));
  return res;
}

boolean cadree(PVector v) {
  return ((v.x>=0)&&(v.x<img.width)&&(v.y<img.height)&&(v.y>=0));
}

int couleur(PVector v) {
  return img.pixels[int(floor(v.y)*img.width+v.x)];
}

void ligne(PVector u, PVector v) { 
  stroke(255);

  line(u.x, u.y, v.x, v.y);
}



