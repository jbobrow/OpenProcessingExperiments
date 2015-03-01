
//boolean, string i PFont per els missatges, i d'altres
int n, m, z1, z2, z3;
PFont f;
String missatge = "ERROR 404";
String missatge2 ="Windows no funciona, com sempre...";
String missatge3 ="Clica per intentar iniciar el sistema";
boolean mouseIsDown = false;
boolean carregant = false;
float[] arcStartPositions = new float[3];
float arcBoundSize, arcMaxBoundSize, arcLength = 80;


void setup(){
  size(500,500);
  background(0);
  f = createFont("Dotum-20.vlw",20,true);
  textFont(f, 17);
  frameRate(60);
  smooth();
  for(int i=0;i<arcStartPositions.length;i++){
    arcStartPositions[i] = PI/10*i;
  }
    n = 500;     //nombres d'elipses per cercle
    m = 10;      //força de les ones
    z1 = 2000;   //z general
    z2 = 2;      //z rotació
    z3 = 5;      //z ones
}
 
void draw(){
  background(0);
  //color i caraceristiques de la barra i cercle
  arcBoundSize = arcMaxBoundSize;
  for(float s:arcStartPositions){
    arcLength = random(PI,8*PI/6);
    color c = color(0,255,41);
    stroke(c);
    arc(arcMaxBoundSize/2,arcMaxBoundSize/2,arcBoundSize,arcBoundSize,s,s+arcLength);
    arcBoundSize-=10;
  }
  for(int i=0;i<arcStartPositions.length;i++){
    arcStartPositions[i]+=PI/10;
  }
  if(mouseIsDown == true)
  {
    carregant = true;
    frameCount = 1;
  }
  //missatges sobre Windows
  if(carregant == false){
    fill(255);
    fill(#00FF29);
    textAlign(DOWN);
    text (missatge,205,150);
    text (missatge2,110,230);
    text (missatge3,120,310);
  }
  //barra carregant, amb el seu missatge i contador
  if(carregant == true){
    fill(255);
    fill(#00FF29);
    textAlign(LEFT);
    text ("Carregant... " + int((frameCount%301) / 3) + "%", 190, 185);
    rect(148, 258, 204, 24);
    fill(0);
    int fillX = ((frameCount%301) / 3 * 2);
    rect(350, 260, fillX-200, 20);
    
    if(frameCount%301 == 0){
      carregant = false;
    }
  }
  //per preparar  el cercle de carga
  float t = millis()/z1;
    carga(t, 0);
    carga(t, 3);
}

// aquí es configura el cercle de carga
void carga(float t, int o) {
      for(int i = 0; i < n; i++) {
          float p = (i/n)*TWO_PI;
          float x = (width/2) + sin(p+t) * (200+sin((t*z2+p)*z3+o)*m*(1-sin(p)));  
          float y = (height/2) + cos(p+t) * (200+sin((t*z2+p)*z3+o)*m*(1-sin(p)));
          ellipse(x, y, 5, 5);
    }
 }
 
//funció mousePressed, per reiniciar
void mousePressed() {
  mouseIsDown = true;
}
  
//al fer mouseReleased, tornará a la barra
void mouseReleased() {
  mouseIsDown = false;
}



