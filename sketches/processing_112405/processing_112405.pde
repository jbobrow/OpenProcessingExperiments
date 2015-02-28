
// a reta do ponto p na direção de pd de comprimento cmp

float cmp=250;
int pt=4000;
PVector pontos[]=new PVector[pt];
PVector pd; // direção da reta
PVector p[] = new PVector[10];  // ponto inicial da reta
PVector pr; // a reta em si: do ponto p na direção de pd de comprimento cmp
PVector pr2;
PVector eng2;
PVector eng1;
int qp;
float ang;
float dx, dy;

void setup() {
  size(1000, 800);
  novosVetores(); //escolhe randomicamente um novo ponto para ser a direção
}

void novosVetores() {
  pr=new PVector(0, 0);
  eng1=new PVector(width/2-50, 2*height/3 );
  eng2=new PVector(width/2, height/2);
  float a=0;
  float b=0;
  while (dist (a, b, eng1.x, eng1.y)>100) {
    a=random(width/2-50, width/2+50);
    b=random(height/2-50, height/2+50);
  }
  pd= new PVector(a, b);
  p[0]= new PVector(0, 0);
  p[1]= new PVector(0, 0);
}


void draw() {
  background(0);

  p[0].x = eng1.x + 25*cos(ang/17);  /// o ponto gira 
  p[0].y = eng1.y + 25*sin(ang/17);

  p[1].x = eng2.x + 25*cos(-ang/19);  /// o ponto gira 
  p[1].y = eng2.y + 25*sin(-ang/19);

  ang+=.3;

  desPontos();

  strokeWeight(2);
  fill(0, 200);
  ellipse(eng1.x, eng1.y, 70, 70); //engrenagem central
  pr=calcula(p[0], pd, 200, false);

  strokeWeight(2);
  fill(0, 200);
  ellipse(eng2.x, eng2.y, 70, 70); //engrenagem 2
  pr2=calcula(p[1], pr, 200, true);

  if (mousePressed) {
    if (dist(mouseX, mouseY, eng1.x, eng1.y)<35) {
      eng1.x+=mouseX-dx;
      eng1.y+=mouseY-dy;
      dx=mouseX;
      dy=mouseY;
    } 
    if (dist(mouseX, mouseY, eng2.x, eng2.y)<35) {
      eng2.x+=mouseX-dx;
      eng2.y+=mouseY-dy;
      dx=mouseX;
      dy=mouseY;
    } 
    if (dist(mouseX, mouseY, pd.x, pd.y)<7) {
      pd.x+=mouseX-dx;
      pd.y+=mouseY-dy;
      dx=mouseX;
      dy=mouseY;
    }
  }
  fill(255);
  textSize(12);
  String texto="algumas coisas são arrastáveis";
  text(texto, 700, 700);
  texto="qualquer tecla apaga";
  text(texto, 700, 715);
}


void keyPressed() {
  qp=0;
}


void mousePressed() {
  dx=mouseX;
  dy=mouseY;
}

PVector calcula(PVector v1, PVector v2, float comp, boolean dp) {   // calcula o ponto de v1 na direção de v2 a uma distancia comp 
  PVector pvr= new PVector(0, 0, 0);
  //pvr.set(0, 0, 0);
  pvr.add(v2);
  pvr.sub(v1);
  pvr.normalize(); //normaliza 
  pvr.mult(comp);  // coloca o comprimento
  pvr.add(v1);

  if (dp) {
    pontos[qp%pt]=new PVector(pvr.x, pvr.y); //guarda e desenha os pontos da ponta do braço
    qp++;
  }

  ////////////desenha
  stroke(255);
  strokeWeight(18);
  line(v1.x, v1.y, pvr.x, pvr.y);  //o desenho do braço (preto)
  stroke(0);
  strokeWeight(15);
  line(v1.x, v1.y, pvr.x, pvr.y);  //o desenho do braço (branco);


  stroke(255); 
  strokeWeight(1);
  fill(0);
  ellipse(v1.x, v1.y, 13, 13);
  ellipse(v2.x, v2.y, 13, 13);
  ellipse(pvr.x, pvr.y, 5, 5);
  ellipse(pvr.x, pvr.y, 2, 2);
  return pvr;
}


void desPontos() {
  stroke(255); // pontos
  strokeWeight(.25);
  noFill();
  beginShape();
  for (int i=0; i<min(qp, pt); i++) {
    curveVertex(pontos[i].x, pontos[i].y);
  }
  endShape();
}
