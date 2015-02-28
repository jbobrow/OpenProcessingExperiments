
//variables matriu moviment
int total=10;

float[] xperson = new float[total];
float[] yperson = new float[total];

color[] colorfosc = new color[total];
color[] colorclar = new color[total];
color[] colorroba = new color[total];  

//posicio tub
int tubx;
int tuby;

//posició/velocitat platillo
int posiciox=-150;
int posicioy=int(random(65, height/2));
int vel=1;

void setup() {
  size(700, 800);

  for (int i=0; i<total; i++) {
    xperson[i] = width/2;
    yperson[i] = height/2;

    colorfosc[i] = color(random(255), random(255), random(255));
    colorclar[i] = color(random(255), random(255), random(255));
    colorroba[i] = color(random(255), random(255), random(255));
  }

  tubx=width/2-70;
  tuby=height-200;
}

void draw() { 
  background(200, 255, 255);

  movementPlat();
  tub();

  for (int i=0; i<total; i++) {
    xperson[i] += random(-5, 10);
    yperson[i] += random(-10, 5);

    //comprovar salt de limits
    if (xperson[i] < -71) {
      xperson[i] = width+75;
    }
    if (xperson[i] > width+75) {
      xperson[i] = -71;
    }
    if (yperson[i] < -253) {
      yperson[i] = height+55;
    }
    if (yperson[i] > height+55) {
      yperson[i] = -253;
    }

    //hombros
    noStroke();
    fill(colorroba[i]);
    rect(xperson[i]-53, yperson[i]+46, 100, 60, 35);

    stroke(65, 65, 65);
    strokeWeight(6);
    noFill();
    rect(xperson[i]-53, yperson[i]+46, 100, 70, 35);

    //cames
    fill(40, 40, 40);
    stroke(65, 65, 65);
    strokeWeight(6);
    rect(xperson[i]-28, yperson[i]+136, 25, 100);
    rect(xperson[i]-3, yperson[i]+136, 25, 100);
    noStroke();
    rect(xperson[i]-28, yperson[i]+116, 50, 38);

    //relleno panxa,ralla mig
    fill(colorroba[i]);
    rect(xperson[i]-28, yperson[i]+101, 50, 40);

    stroke(65, 65, 65);
    strokeWeight(6);
    line(xperson[i]-28, yperson[i]+138, xperson[i]+22, yperson[i]+138);

    //mans
    fill(255, 200, 150);
    ellipse(xperson[i]-41, yperson[i]+154, 24, 24);
    ellipse(xperson[i]+35, yperson[i]+154, 24, 24);

    //braços
    fill(colorroba[i]);
    rect(xperson[i]-53, yperson[i]+81, 25, 70);
    rect(xperson[i]+22, yperson[i]+81, 25, 70);

    noStroke();
    rect(xperson[i]-50, yperson[i]+78, 19, 20);
    rect(xperson[i]+25, yperson[i]+78, 19, 20);

    //triangle
    stroke(65, 65, 65);
    strokeWeight(6);
    fill(255, 255, 255);
    triangle(xperson[i]-28, yperson[i]+46, xperson[i]+22, yperson[i]+46, xperson[i]-3, yperson[i]+101);
    line(xperson[i]-3, yperson[i]+101, xperson[i]-3, yperson[i]+136);

    //cap
    noStroke();
    fill(255, 255, 255);
    ellipse(xperson[i], yperson[i]-10, 125, 85);

    fill(colorfosc[i]);
    ellipse(xperson[i], yperson[i]+11, 125, 85);

    fill(colorclar[i]);
    ellipse(xperson[i], yperson[i]-4, 90, 69);

    noFill();
    stroke(65, 65, 65);
    strokeWeight(6);
    ellipse(xperson[i]-3, yperson[i], 125, 110);

    //pajarita
    strokeWeight(3);
    fill(40, 40, 40);
    triangle(xperson[i]-28, yperson[i]+49, xperson[i]-28, yperson[i]+69, xperson[i]-3, yperson[i]+59);
    triangle(xperson[i]-3, yperson[i]+59, xperson[i]+22, yperson[i]+49, xperson[i]+22, yperson[i]+69);

    //ull
    strokeWeight(6);
    fill(255, 255, 255);
    rect(xperson[i]+4, yperson[i]-42, 55, 50, 20, 27, 10, 20);
    ellipse(xperson[i]+42, yperson[i]-17, 3, 18);

    //boca
    fill(250, 100, 70);
    rect(xperson[i]+4, yperson[i]+8, 67, 15, 10);
    rect(xperson[i]+4, yperson[i]+23, 60, 15, 10);

    //ala
    noStroke();
    fill(colorfosc[i]);
    rect(xperson[i]-75, yperson[i]-14, 55, 35, 10, 30, 30, 30);

    fill(colorclar[i]);
    rect(xperson[i]-75, yperson[i]-24, 55, 30, 10, 30, 30, 30);

    noFill();
    stroke(65, 65, 65);
    strokeWeight(6);
    rect(xperson[i]-75, yperson[i]-24, 55, 47, 10, 30, 30, 30);

    //peus
    fill(255, 255, 255);
    rect(xperson[i]-3, yperson[i]+236, 40, 17, 0, 10, 10, 10);
    rect(xperson[i]-28, yperson[i]+236, 40, 17, 0, 10, 10, 10);


    if (mousePressed) {
      colorfosc[i] = color(random(255), random(255), random(255));
      colorclar[i] = color(random(255), random(255), random(255));
      colorroba[i] = color(random(255), random(255), random(255));

      noStroke();
      fill(255);
      ellipse(xperson[i]+42, yperson[i]-17, 15, 30);
      strokeWeight(6);
      stroke(65, 65, 65);
      line(xperson[i]+32, yperson[i]-23, xperson[i]+47, yperson[i]-8);
      line(xperson[i]+32, yperson[i]-8, xperson[i]+47, yperson[i]-23);

      strokeWeight(6);
      fill(255, 130, 150);
      ellipse(xperson[i]+34, yperson[i]+38, 24, 20);
      rect(xperson[i]+22, yperson[i]+23, 24, 15);
      noStroke();
      ellipse(xperson[i]+34, yperson[i]+38, 18, 18);
      strokeWeight(5);
      stroke(65, 65, 65);
      line(xperson[i]+34, yperson[i]+23, xperson[i]+34, yperson[i]+48);

      strokeWeight(20);
      int raig=int (random(0, 2));

      if (raig == 0) {
        stroke(0);
        line(posiciox, posicioy, xperson[i], yperson[i]);
      }
      else {
        stroke(255);
        line(posiciox, posicioy, xperson[i], yperson[i]);
      }
    }
  }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
void movementPlat() {
  //platillo
  strokeWeight(5);
  stroke(65, 65, 65);
  fill(170);
  ellipse(posiciox, posicioy-20, 175, 75);
  ellipse(posiciox, posicioy+20, 175, 75);
  quad(posiciox-137.5, posicioy-2.5, posiciox+137.5, posicioy-2.5, posiciox+87.5, posicioy-35, posiciox-87.5, posicioy-35);
  quad(posiciox-137.5, posicioy+2.5, posiciox+137.5, posicioy+2.5, posiciox+87.5, posicioy+35, posiciox-87.5, posicioy+35);
  fill(0);
  ellipse(posiciox, posicioy, 45, 45);
  fill(255, 0, 0);
  ellipse(posiciox, posicioy, 25, 25);

  posiciox=posiciox+vel;

  if (posiciox>width+150) {
    posiciox=-150;
    posicioy=int(random(65, height/2));
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



