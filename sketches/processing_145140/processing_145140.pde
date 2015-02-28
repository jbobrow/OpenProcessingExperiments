
//posició/velocitat person
float xperson;
float yperson;
float vx=random(-3.5, 3.5);
float vy=random(-3.5, 3.5);

//posicio tub
float tubx;
float tuby;

//colors person
float colorfosc1=random(255);
float colorfosc2=random(255);
float colorfosc3=random(255);

float colorclar1=random(255);
float colorclar2=random(255);
float colorclar3=random(255);

float colorroba1=random(255);
float colorroba2=random(255);
float colorroba3=random(255);

//posició/velocitat nuvols
float posiciox=-150;
float posicioy=random(0, 300);
float posiciox2=-450+random(-100, 100);
float posicioy2=random(300, 600);
float vel=1;

void setup() {
  xperson=random(100, 400);
  yperson=random(100, 200);
  size(500, 550);
  tubx=width/2-70;
  tuby=height-200;
}

void draw() {
  fons();
  movementNuvol();
  tub();
  person();
  movement();
}

void mousePressed() {
  vx=random(-3.5, 3.5);
  vy=random(-3.5, 3.5);

  colorfosc1=random(255);
  colorfosc2=random(255);
  colorfosc3=random(255);

  colorclar1=random(255);
  colorclar2=random(255);
  colorclar3=random(255);

  colorroba1=random(255);
  colorroba2=random(255);
  colorroba3=random(255);
}

void fons() {  
  background(200, 255, 255);
}

void movementNuvol() {
  fill(255, 255, 255);
  noStroke();

  //nuvolet1
  ellipse(posiciox, posicioy, 200, 100);
  ellipse(posiciox-75, posicioy-50, 100, 75);
  ellipse(posiciox, posicioy-50, 75, 50);
  ellipse(posiciox+75, posicioy+50, 100, 75);
  ellipse(posiciox-25, posicioy+50, 75, 50);
  posiciox=posiciox+vel;
  posicioy=posicioy;
  if (posiciox>width+150) {
    posiciox=-150;
    posicioy=random(0, 300);
  }

  //nuvolet2
  ellipse(posiciox2, posicioy2, 200, 100);
  ellipse(posiciox2-75, posicioy2-50, 100, 75);
  ellipse(posiciox2, posicioy2-50, 75, 50);
  ellipse(posiciox2+75, posicioy2+50, 100, 75);
  ellipse(posiciox2-25, posicioy2+50, 75, 50);
  posiciox2=posiciox2+vel;
  posicioy2=posicioy2;
  if (posiciox2>width+150) {
    posiciox2=-450+random(-100, 100);
    posicioy2=random(300, 600);
  }
}

void tub() {  
  noStroke();
  fill(115, 220, 50);
  rect(tubx, tuby, 140, 50);
  rect(tubx+10, tuby+50, 120, 150);

  fill(175, 245, 100);
  rect(tubx, tuby, 30, 50);
  rect(tubx+10, tuby+50, 30, 150);

  fill(100, 180, 55);
  rect(tubx+110, tuby, 30, 50);
  rect(tubx+100, tuby+50, 30, 150);

  fill(225, 255, 140);
  rect(tubx, tuby, 10, 50);
  rect(tubx+10, tuby+50, 10, 150);

  fill(80, 145, 50);
  rect(tubx+130, tuby, 10, 50);
  rect(tubx+120, tuby+50, 10, 150);

  noFill();
  stroke(65, 65, 65);
  strokeWeight(6);
  rect(tubx, tuby, 140, 50);
  rect(tubx+10, tuby+50, 120, 153);

  textSize(25);
  textAlign(CENTER);
  fill(65, 65, 65);
  text("Oppa", tubx+70, tuby+103);
  text("Flappy", tubx+70, tuby+128);
  text("Style", tubx+70, tuby+153);
}

void person() { 
  //hombros
  noStroke();
  fill(colorroba1, colorroba2, colorroba3);
  rect(xperson-53, yperson+46, 100, 60, 35);

  stroke(65, 65, 65);
  strokeWeight(6);
  noFill();
  rect(xperson-53, yperson+46, 100, 70, 35);

  //cames
  fill(40, 40, 40);
  stroke(65, 65, 65);
  strokeWeight(6);
  rect(xperson-28, yperson+136, 25, 100);
  rect(xperson-3, yperson+136, 25, 100);
  noStroke();
  rect(xperson-28, yperson+116, 50, 38);

  //relleno panxa,ralla mig
  fill(colorroba1, colorroba2, colorroba3);
  rect(xperson-28, yperson+101, 50, 40);

  stroke(65, 65, 65);
  strokeWeight(6);
  line(xperson-28, yperson+138, xperson+22, yperson+138);

  //mans
  fill(255, 200, 150);
  ellipse(xperson-41, yperson+154, 24, 24);
  ellipse(xperson+35, yperson+154, 24, 24);

  //braços
  fill(colorroba1, colorroba2, colorroba3);
  rect(xperson-53, yperson+81, 25, 70);
  rect(xperson+22, yperson+81, 25, 70);

  noStroke();
  rect(xperson-50, yperson+78, 19, 20);
  rect(xperson+25, yperson+78, 19, 20);

  //triangle
  stroke(65, 65, 65);
  strokeWeight(6);
  fill(255, 255, 255);
  triangle(xperson-28, yperson+46, xperson+22, yperson+46, xperson-3, yperson+101);
  line(xperson-3, yperson+101, xperson-3, yperson+136);

  //cap
  noStroke();
  fill(255, 255, 255);
  ellipse(xperson, yperson-10, 125, 85);

  fill(colorfosc1, colorfosc2, colorfosc3);
  ellipse(xperson, yperson+11, 125, 85);

  fill(colorclar1, colorclar2, colorclar3);
  ellipse(xperson, yperson-4, 90, 69);

  noFill();
  stroke(65, 65, 65);
  strokeWeight(6);
  ellipse(xperson-3, yperson, 125, 110);

  //pajarita
  strokeWeight(3);
  fill(40, 40, 40);
  triangle(xperson-28, yperson+49, xperson-28, yperson+69, xperson-3, yperson+59);
  triangle(xperson-3, yperson+59, xperson+22, yperson+49, xperson+22, yperson+69);

  //ull
  strokeWeight(6);
  fill(255, 255, 255);
  rect(xperson+4, yperson-42, 55, 50, 20, 27, 10, 20);
  ellipse(xperson+42, yperson-17, 3, 18);

  //boca
  fill(250, 100, 70);
  rect(xperson+4, yperson+8, 67, 15, 10);
  rect(xperson+4, yperson+23, 60, 15, 10);

  //ala
  noStroke();
  fill(colorfosc1, colorfosc2, colorfosc3);
  rect(xperson-75, yperson-14, 55, 35, 10, 30, 30, 30);

  fill(colorclar1, colorclar2, colorclar3);
  rect(xperson-75, yperson-24, 55, 30, 10, 30, 30, 30);

  noFill();
  stroke(65, 65, 65);
  strokeWeight(6);
  rect(xperson-75, yperson-24, 55, 47, 10, 30, 30, 30);

  //peus
  fill(255, 255, 255);
  rect(xperson-3, yperson+236, 40, 17, 0, 10, 10, 10);
  rect(xperson-28, yperson+236, 40, 17, 0, 10, 10, 10);

  xperson=xperson+vx;
  yperson=yperson+vy;
}

void movement() {
  if (xperson+71 >width||xperson-75<0) {
    vx=-vx;
    colorfosc1=random(255);
    colorfosc2=random(255);
    colorfosc3=random(255);
    colorclar1=random(255);
    colorclar2=random(255);
    colorclar3=random(255);

    colorroba1=random(255);
    colorroba2=random(255);
    colorroba3=random(255);
  }

  if (yperson+253 >height||yperson-55<0) {
    vy=-vy;
    colorfosc1=random(255);
    colorfosc2=random(255);
    colorfosc3=random(255);

    colorclar1=random(255);
    colorclar2=random(255);
    colorclar3=random(255);

    colorroba1=random(255);
    colorroba2=random(255);
    colorroba3=random(255);
  } 

  if (xperson>=3*width/5 && vx<0) { 
    fill(255, 130, 150);
    ellipse(xperson+34, yperson+38, 24, 20);
    rect(xperson+22, yperson+23, 24, 15);
    noStroke();
    ellipse(xperson+34, yperson+38, 18, 18);
    strokeWeight(5);
    stroke(65, 65, 65);
    line(xperson+34, yperson+23, xperson+34, yperson+48);
  } 
  if (xperson<=2*width/5 && vx>0) {
    strokeWeight(6);
    fill(255, 130, 150);
    ellipse(xperson+34, yperson+38, 24, 20);
    rect(xperson+22, yperson+23, 24, 15);
    noStroke();
    ellipse(xperson+34, yperson+38, 18, 18);
    strokeWeight(5);
    stroke(65, 65, 65);
    line(xperson+34, yperson+23, xperson+34, yperson+48);
  }
  if (yperson<=2*width/5 && vy>0) {
    noStroke();
    fill(255);
    ellipse(xperson+42, yperson-17, 15, 30);
    strokeWeight(6);
    stroke(65, 65, 65);
    line(xperson+32, yperson-23, xperson+47, yperson-8);
    line(xperson+32, yperson-8, xperson+47, yperson-23);
  }
}  



