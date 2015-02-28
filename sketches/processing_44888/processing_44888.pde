
// dia 3, hecho por ssbeltran

//ahora queremos jugar entre posición de mouse, mousePressed, y ruido Perlin

float AvelX;
float AruidoX = .00618;
float AvarX;
float AvelY;
float AruidoY = .00615;
float AvarY;
float AposX = 0.5;
float AposY = 0.5;

float BvelX;
float BruidoX = .00600;
float BvarX;
float BvelY;
float BruidoY = .00601;
float BvarY;
float BposX = mouseX;
float BposY = mouseY;

float CvelX;
float CruidoX = .00635;
float CvarX;
float CvelY;
float CruidoY = .00632;
float CvarY;
float CposX = mouseX;
float CposY = mouseY;

float DvelX;
float DruidoX = .00666;
float DvarX;
float DvelY;
float DruidoY = .00669;
float DvarY;
float DposX = mouseX;
float DposY = mouseY;

float rot;
float skl;
float contadorX;
float contadorY;


//- - - - ---- - - - - - -- - - SETUP

void setup () {

  size (800, 800);
  background (255);
  smooth();
  frameRate (60);
}

// - - - - - - - - - - - - -- - - -DRAW

void draw () {

  translate (width/2, height/2);
  rotate (radians(rot));
  rot += 0.1;

  scale (0.6);


  //ahora calculamos los valores de todo


  AvelX = noise(AvarX)*width;
  AvarX += AruidoX;
  AvelY = noise(AvarY)*width;
  AvarY += AruidoY;

  BvelX = noise(BvarX)*width;
  BvarX += BruidoX;
  BvelY = noise(BvarY)*width;
  BvarY += BruidoY;

  CvelX = noise(CvarX)*width;
  CvarX += CruidoX;
  CvelY = noise(CvarY)*width;
  CvarY += CruidoY;

  DvelX = noise(DvarX)*width;
  DvarX += DruidoX;
  DvelY = noise(DvarY)*width;
  DvarY += DruidoY;


  contadorX = 0.1 + (random(0.1, 3));
  contadorY = 0.5 + (random (0.2, 5));

  fill (0);
  stroke (0, 0);
  ellipse (AvelX, AvelY, contadorX%12.5, contadorY%12.5);
  ellipse (BvelX, BvelY, contadorX%15, contadorY%15);
  ellipse (CvelX, CvelY, contadorX%20, contadorY%20);
  ellipse (DvelX, DvelY, contadorX%17.5, contadorY%17.5);

  stroke (mouseX, mouseY, 0, 100);
  line (BvelX, BvelY, AvelX, AvelY);
  stroke (180, 255, 0, 100);
  line (CvelX, CvelY, DvelX, DvelY);
}

// - - - - - - - - - - - - - - INTERACTIVO


void mousePressed () {

  stroke(0, 255);
  fill(0, 0);
  beginShape (POLYGON);
  curveVertex (mouseX, mouseY);
  curveVertex (AvelX, AvelY);
  curveVertex (BvelX, BvelY);
  curveVertex (CvelX, CvelY);
  curveVertex (DvelX, DvelY);
  curveVertex (mouseX, mouseY);
  endShape();
  stroke(0, 0);
}


