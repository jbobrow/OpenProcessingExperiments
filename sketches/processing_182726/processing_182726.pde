


float xaigua = 0;
float yaigua = 500;
float maigua = 150;

//control nube
float xnube = 50;
float ynube = 45;
float mnube = 50;

//control del pollito
float pollox = random (800);
float polloy = random (500);
float mpollo = 40;
float velocitatx = 2;
float velocitaty = 4;

int bones=0;
int dolentes=0;

void setup() {
  size (800, 500);
 
}

void draw() {
  float xarbre = mouseX;
  float yarbre = 400;
  float mida = 200;
  fill(5);

  background (102, 213, 234);


  //tronc

  fill(155, 116, 78);
  noStroke();
  rect(xarbre, yarbre, mida, mida/4);
  ellipse(xarbre, yarbre+25, mida/4, mida/4);
  ellipse(xarbre, yarbre+25, mida/4, mida/4);
  ellipse(xarbre+mida, yarbre+25, mida/4, mida/4);
  rect (xarbre+mida-30, yarbre-20, mida-190, mida-170);
  ellipse(xarbre+mida-25, yarbre-16, mida/20, mida/20);

  stroke(134, 105, 77);
  strokeWeight(2);
  line(xarbre+30, yarbre+10, xarbre+150, yarbre+10);
  line(xarbre-10, yarbre+40, xarbre+90, yarbre+40);
  line(xarbre-5, yarbre+30, xarbre+180, yarbre+30);

  // onades

  fill(77, 113, 134);
  noStroke();

  ellipse(xaigua, yaigua, maigua, maigua);
  ellipse(xaigua+100, yaigua, maigua, maigua);
  ellipse(xaigua+200, yaigua, maigua, maigua);
  ellipse(xaigua+300, yaigua, maigua, maigua);
  ellipse(xaigua+400, yaigua, maigua, maigua);
  ellipse(xaigua+500, yaigua, maigua, maigua);
  ellipse(xaigua+600, yaigua, maigua, maigua);
  ellipse(xaigua+700, yaigua, maigua, maigua);
  ellipse(xaigua+800, yaigua, maigua, maigua);

  //nube
  fill(255);
  ellipse(xnube, ynube, mnube, mnube);
  ellipse(xnube*2, ynube, mnube*2, mnube);
  ellipse(xnube*3, ynube, mnube*2, mnube);

  ellipse(xnube*10, ynube*5, mnube+10, mnube+10);

  ellipse(xnube*10+mnube-5, ynube*5, mnube+10, mnube+10);
  ellipse(xnube*10+mnube*2-10, ynube*5, mnube+10, mnube+10);

  //dibuix pollito aka pilota

  fill(255, 251, 139);

  pollox = pollox + velocitatx;
  ellipse(pollox, polloy, mpollo, mpollo+15);
  ellipse(pollox, polloy+25, mpollo+15, mpollo+15);
  fill(255, 34, 56);
  triangle(pollox-5, polloy, pollox+5, polloy, pollox, polloy+5);
  fill(255);
  ellipse(pollox-6, polloy-10, mpollo/4, mpollo/4);
  ellipse(pollox+6, polloy-10, mpollo/4, mpollo/4);
  fill(5);
  ellipse(pollox-6, polloy-10, mpollo/8, mpollo/8);
  ellipse(pollox+6, polloy-10, mpollo/8, mpollo/8);


  //movimiento pelota

  pollox = pollox + velocitatx;
  polloy = polloy + velocitaty;




  if (polloy-20<=0) {
    velocitaty=-velocitaty;
  }

  if (pollox>=width-20) {
    velocitatx= -velocitatx;
  }

  if (pollox-20 <=0) {
    velocitatx=-velocitatx;
  }

  // que rebote en el tronco

  if (pollox >= mouseX-mida && pollox <= mouseX+mida&& polloy >= yarbre-9-mpollo && polloy <= yarbre+9-mpollo) {

    velocitaty = -velocitaty;
  }
  
 
}

void mousePressed(){
  
      velocitatx = random(5);
      velocitaty = random(5);
      pollox = pmouseX;
      polloy = pmouseY;
      mouseReleased();
}

