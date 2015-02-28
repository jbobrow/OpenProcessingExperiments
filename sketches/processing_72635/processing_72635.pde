
//Código inicial de grilla
PFont fuente;
PImage imagen_fondo;
int [] [] grillaX;
int [] [] grillaY;
float x;
float y;
float long_grilla;
int r;
int g;
int b;

void setup () {
  //Inicia display
  frameRate(60);
  size(700,750);
  background(255);

 imagen_fondo=loadImage("imagen.jpg");
 fuente=loadFont("gothic.vlw");

  r=255;
  g=0;
  b=0;

  long_grilla=10;
  x=0;
  y=0;
  grillaX=new int [width/( int )long_grilla][800/( int )long_grilla];
  grillaY=new int [width/( int )long_grilla][800/( int )long_grilla];
  for(int j=0;j<grillaY.length;j++) { 
    for(int i=0;i<grillaX.length;i++) {
      grillaX[i][j]=i*(int)long_grilla;
      grillaY[i][j]=j*(int)long_grilla;
    }
  }

  image(imagen_fondo, 0, 0);

  stroke(210);
  for(int j=0;j<grillaY.length;j++) { 

    for(int i=0;i<grillaX.length;i++) {

      point(grillaX[i][j],grillaY[i][j]);
    }
  }
}


void draw() {

  if (mousePressed && (mouseButton == LEFT)) {

    if(mouseX>=466&&mouseX;<=583&&mouseY;>=700&&mouseY;<=750) {
      save("painter_img.jpg");
    }

    if(mouseX>=0&&mouseX;<=117&&mouseY;>=700&&mouseY;<=750) {
      r+=5;
    }
    else if(mouseX>=117&&mouseX;<=233&&mouseY;>=700&&mouseY;<=750) { 
      g+=5;
    }
    else if(mouseX>=167&&mouseX;<=349.998&&mouseY;>=700&&mouseY;<=750) {
      b+=5;
    }

    if(r>=255) {
      r=255;
    }

    if(g>=255) {
      g=255;
    }

    if(b>=255) {
      b=255;
    }

    stroke(255);
    fill(r,g,b);
    println("valor="+float(mouseX)/10);
    x=(round(mouseX/long_grilla)*long_grilla);
    y=(round(mouseY/long_grilla)*long_grilla);
    println("redondeo="+round(x));
    rectMode(CENTER);
    rect(x,y,long_grilla,long_grilla);
  } 
  else if (mousePressed && (mouseButton == RIGHT)) {

    if(mouseX>=0&&mouseX;<=117&&mouseY;>=700&&mouseY;<=750) {
      r-=5;
    }
    else if(mouseX>=117&&mouseX;<=233&&mouseY;>=700&&mouseY;<=750) { 
      g-=5;
    }
    else if(mouseX>=167&&mouseX;<=349.998&&mouseY;>=700&&mouseY;<=750) {
      b-=5;
    }

    if(r<=0) {
      r=0;
    }

    if(g<=0) {
      g=0;
    }

    if(b<=0) {
      b=0;
    }
  }

  //Interfaz color

  rectMode(CORNER);
  line(0,700,700,700);
  stroke(210);

  fill(255,0,0);
  rect(0,700,117,50);

  fill(0,255,0);
  rect(117,700,117,50);

  fill(0,0,255);
  rect(233,700,117,50);

  fill(255);
  textAlign(CENTER);
  text(r,58,732);
  text(g,175,732);
  text(b,292,732);

  //Interfaz color pixel, borrar y reset
  rectMode(CORNER);
  line(0,700,700,700);
  stroke(210);
  fill(0);

  rect(349,700,117,50);

  rect(466,700,117,50);

  rect(583.33,700,117,50);

  rectMode(CENTER);
  fill(r,g,b);
  rect(408,725,14,14);

  /*fill(255);
   rect(525,725,14,14);
   stroke(210);
   point(525,725);*/

  fill(255);
  textFont(fuente);
  textAlign(CENTER);
  text("Reset",642,732);

  textAlign(CENTER);
  text("Save",525,732);

  if (mousePressed && (mouseButton == LEFT)) {
    if(mouseX>=583&&mouseX;<=700&&mouseY;>=700&&mouseY;<=750) {
      noStroke();
      //image(imagen_fondo, 0, 0);
      stroke(210);
      for(int j=0;j<grillaY.length;j++) { 

        for(int i=0;i<grillaX.length;i++) {
stroke(0,255,0);
          point(grillaX[i][j],grillaY[i][j]);
        }
      }
    }
  }
}
