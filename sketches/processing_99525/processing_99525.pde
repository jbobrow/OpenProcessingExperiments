
/*
David Palomar Cros
 Grup 03
 GEDI 
 seminari 6
 
 Fons de finestra format per linies que van de les parets al mouse. Un mosquit segueix al ratolí però va més lent i li costa atraparlo. En clicar el mous, s'inicia de nou la posició
 de les línies on es trova el mouse.*/

//nombrem les variables
float posX, xVel, posY, yVel;
int sz=20;

//inicialitzem les variables posicio i velocitat
void setup() {
  size(600, 600);
  background(0);
  posX = width/2;
  posY = height/2;
  xVel = 20;
  yVel = 20;
}
//al draw, citem les funcions que volem que apareguin al dibuix
void draw() {
  //dibuixa_fons seran les línies que formen el fons
  dibuixa_fons(mouseX, mouseY);
  //actualitza serà la posició que tindran les línies 
  actualizar();
  //mosquit serà la funció que definirà el mosquit
  mosquit();
}
//amb mouse pressd fem que al clicar el mouse pasi alguna cosa diferent, en el meu cas que s'inicialitzin les línies
void mousePressed() {
  background(0);
  //de fons tornem a dibuixar les línies
  dibuixa_fons(mouseX, mouseY);
}
//ara dibuixem el fons 
//donem variables a la x i la y
void dibuixa_fons(int x, int y) {
  //fem que la i s'incrementi segons si es més petita que l'altura, s'incrementarà en 20 unitat
  for (int i=0; i<=height; i+=20) {
    strokeWeight(0.2);
    //deixem tot en funció de la i
    stroke(i, 255, 255, 60);
    line(0, i, x, y);
    line(i, 0, x, y);
    line(i, height, x, y);
    line(width, i, x, y);
  }
}
//ara posem la funció d'actualització
void actualizar() {
  // declarem la distància X com a la posició del mouse - la poiciò 
  float distX = mouseX-posX;
  float distY = mouseY-posY;
  
  //i actualizem la posiciò de manera que la bola no acabi d'arribar mai.
  posX += distX/xVel;
  posY += distY/yVel;
 
}
//per acabar dibuixem el mosquit

void mosquit () {
  //ala   1
  stroke(0);
  fill(97, 220, 240);
  beginShape();
  //deixo totes les posicions en funció de la pos X i Y
  vertex(posX-20, posY-10);
  vertex(posX-30, posY-30);
  vertex(posX-20, posY-45);
  vertex(posX-10, posY-35);
  vertex(posX-5, posY-10);
  endShape(); 
  //ala2
  beginShape();
  vertex(posX+10, posY-10);
  vertex(posX+20, posY-30);
  vertex(posX+10, posY-45);
  vertex(posX, posY-35);
  vertex(posX-5, posY-10);
  endShape();

  //cos mosquit
  fill(70, 35, 35);
  ellipse(posX, posY, 40, 40);
  fill(mouseX, mouseY, 200); 

  // els ulls del mosquit

  ellipse(posX+10, posY-10, sz, sz);
  ellipse(posX-5, posY-10, sz, sz);
  fill(0);
  ellipse(posX+12, posY-10, 5, 5);
  ellipse(posX-6, posY-10, 5, 5);
  beginShape();
  vertex(posX+12, posY+12);
  vertex(posX+20, posY+20);
  endShape();
}



