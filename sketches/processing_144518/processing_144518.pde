
//VARIABLES
float xn;//posicio nuvols
float vn;//velocitat nuvols
float va;//velocitat X mario
float vb;//velocitat Y mario
float A;// X mario
float B;// Y mario
float mida;//mida relativa el·lipses

//SETUP
void setup() {
  size(1000, 700);
  print("MARC ALONSO - 20N GEDI - GRUP1 - INFORMÀTICA");
  xn=1;
  vn=3;
  va=5;
  vb=5;
  mida=1;
}

//DIBUIX NUVOLS
void draw() {

  background(100-mouseX/5, 200-mouseX/5, 255-mouseX/5);//es fa de nit o de dia segons la posició X del mouse
  noStroke();

  //nuvols
  xn=xn+vn;
  fill(255);
  ellipse(xn+200, 40, 400*mida, 50*mida);
  ellipse(xn+500, 100, 300*mida, 60*mida);
  ellipse(xn+300, 300, 500*mida, 60*mida);

  //quan els nuvols toquen les parets laterals, canvien de sentit la velocitat, i varia la mida
  if (xn+500+150>width||xn<0) {
    vn=-vn;
    mida=random(0.5, 1.5);
  }

  //DIBUIX MARIO

  //gorra
  fill(255, 3, 3);

  //a cada meitat del dibuix en X, el color de la gorra canvia (esquerra groc, dreta vermell)
  if (A+210<width/2) {
    fill(250, 253, 24);
  }

  rect(150+A, 30+B, 150, 30);
  rect(120+A, 60+B, 270, 30);

  //cara
  fill(233, 162, 74);
  beginShape();
  vertex(120+A, 90+B);
  vertex(120+A, 180+B);
  vertex(150+A, 180+B);
  vertex(150+A, 240+B);
  vertex(360+A, 240+B);
  vertex(360+A, 180+B);
  vertex(420+A, 180+B);
  vertex(420+A, 150+B);
  vertex(390+A, 150+B);
  vertex(390+A, 120+B);
  vertex(330+A, 120+B);
  vertex(330+A, 90+B);
  vertex(120+A, 90+B);
  endShape();

  //cabell
  fill(97, 35, 14);
  rect(90+A, 120+B, 30, 90);
  rect(120+A, 180+B, 30, 30);
  rect(120+A, 90+B, 90, 30);
  rect(150+A, 120+B, 30, 30);
  rect(150+A, 150+B, 60, 30);

  //bigoti
  fill(97, 35, 14);
  rect(300+A, 150+B, 30, 30);
  rect(270+A, 180+B, 120, 30);

  //ull
  fill(0);
  rect(270+A, 90+B, 30, 60);

  //jersei vermell
  fill(255, 3, 3);
  rect(120+A, 240+B, 180, 30);
  rect(90+A, 270+B, 300, 30);
  rect(60+A, 300+B, 360, 30);
  rect(60+A, 330+B, 360, 30);

  //pants blaus
  fill(14, 68, 128);

  //mentre el mouse esta clicat, el color dels pantalons cambia aleatoriament
  if (mousePressed == true) {
    fill(random(255), random(255), random(255));
  }

  rect(150+A, 330+B, 180, 60);
  rect(210+A, 300+B, 60, 30);
  rect(120+A, 390+B, 240, 30);
  rect(180+A, 240+B, 30, 90);
  rect(270+A, 270+B, 30, 60);
  rect(120+A, 420+B, 90, 30);
  rect(270+A, 420+B, 90, 30);

  //botons grocs
  fill(250, 253, 24);
  rect(180+A, 330+B, 30, 30);
  rect(270+A, 330+B, 30, 30);

  //sabates
  fill(97, 35, 14);
  rect(90+A, 450+B, 90, 60);
  rect(60+A, 480+B, 30, 30);
  rect(300+A, 450+B, 90, 60);
  rect(390+A, 480+B, 30, 30);

  //mans
  fill(233, 162, 74);
  rect(60+A, 330+B, 60, 90);
  rect(120+A, 360+B, 30, 30);
  rect(330+A, 360+B, 30, 30);
  rect(360+A, 330+B, 60, 90);

  //moviment mario
  A=A+va;
  B=B+vb;

  //el mario rebota amb els limits de pantalla i amb el terra dibuixat
  if (A+420>width||A+60<0) {
    va=-va;
  }
  if (B+510+90>height||B+30<0) {
    vb=-vb;
  }

  //DIBUIX EXTRES(CANONADA, BASE, MONEDA)
  stroke(0);

  //canonada verda
  strokeWeight(2);
  fill(0, 215, 100);
  rect(600, 200, 250, 50);
  rect(620, 250, 210, 360);

  //base
  strokeWeight(5);
  fill(150);

  rect(-100, 610, 200, 100);
  rect(-100+200, 610, 200, 100);
  rect(-100+400, 610, 200, 100);
  rect(-100+600, 610, 200, 100);
  rect(-100+800, 610, 200, 100);
  rect(-100+1000, 610, 200, 100);

  //moneda estrella
  noStroke();
  fill(180, 180, 0);
  ellipse(725, 100, 160, 160);
  fill(220, 220, 0);
  ellipse(725, 100, 155, 155);
  fill(200, 200, 0);
  ellipse(725, 100, 145, 145);
  fill(250, 250, 0);
  ellipse(725, 100, 140, 140);

  //estrella
  stroke(180, 180, 0);
  fill(220, 220, 0);

  //el codi següent que dibuixa l'estrella ha estat extret d'un fórum,
  //no l'he creat jo, però l'he hagut d'entendre per modificar-lo.

  float xpos; 
  float ypos;
  int sz;

  smooth();
  xpos =725;
  ypos = 93;
  sz = width/8;

  beginShape();
  vertex(xpos, ypos-sz/2);
  vertex(xpos+sz/6, ypos-sz/6);
  vertex(xpos+sz/2, ypos-sz/11);
  vertex(xpos +sz/4, ypos+sz/8);
  vertex(xpos+sz/3, ypos+sz/2);
  vertex(xpos, ypos+sz/3);
  vertex(xpos-sz/3, ypos+sz/2);
  vertex(xpos-sz/4, ypos+sz/6);
  vertex(xpos-sz/2, ypos-sz/9);
  vertex(xpos-sz/6, ypos-sz/6);
  endShape(CLOSE);
}


//si es clica el mouse, el mario es mou on es el cursor, i varia la seva velocitat de moviment
void mousePressed() {
 
  va=random(-10, 10);
  vb=random(-10, 10);
  
  A=mouseX-220;
  B=mouseY-255;
}



