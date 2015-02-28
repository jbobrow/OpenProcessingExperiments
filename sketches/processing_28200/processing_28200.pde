
//Flor inmobil 
//AAOO, with Openprocessing 

   
int radio= 10;             
int nPetalos = 10;
float tamanoPetalo = 60;
int centroX = 0;
int centroY = 0;
int valor = 0;
float deg=30;


void setup() {
  
  size(450, 450);
  background (0, 125, 255);
  smooth();
  noLoop(); //para que solo dibuje una vez
  fill (100, 30, 15);
  rect (0,330,450,450); //linea suelo
  stroke (0);
  raiz(225,height/1.5,30,0);
  
}
void draw() {
  translate(225, 100);
  dibujaFlor();
  float giro = atan2 (mouseY-height/1.8,mouseX-0); 
}

void trazarPetalo(int inicioX, int inicioY) {

// centro flor
  float curvaPetalo = tamanoPetalo/4 ;
  float finalX = inicioX;
  float finalY = inicioY + tamanoPetalo;

  //calcular las curvas del petalo
  beginShape();
  vertex(inicioX, inicioY);
  bezierVertex(inicioX + curvaPetalo, inicioY + curvaPetalo, finalX + curvaPetalo, finalY - curvaPetalo, finalX, finalY);
  bezierVertex(finalX - curvaPetalo, finalY - curvaPetalo, inicioX - curvaPetalo, inicioY + curvaPetalo, inicioX, inicioY); 
  endShape();
}

void dibujaFlor() {

  //tallo
  line(centroX,centroY+tamanoPetalo+10,0, height-height/1.8);
 
  //circulo del centro
  fill(255, 255, 0);
  ellipse(centroX, centroY, 20, 20);
  fill(255);

  // calcular la curva para rotacion
  float angle = radians(360 / nPetalos);
  for (int i = 0; i < nPetalos; i++) {
  trazarPetalo(centroX, centroY + radio);
  rotate(angle);
  }  
 
}

//hacer las tres raices
void raiz(float x, float y, float tamano, float curva){

 stroke (0);
 fill (0);
  if(tamano>14) {
    float raizx=x+tamano*sin(curva);
    float raizy=y+tamano*cos(curva);
    float raizx2=x+tamano*sin(curva);
    float raizy2=y+tamano*cos(curva);
    float raizx3=x+tamano*sin(curva);
    float raizy3=y+tamano*cos(curva);


    line( x, y, raizx, raizy);
    line( x, y, raizx2, raizy2);
    line( x, y, raizx3, raizy3);

    raiz(raizx,raizy,tamano*random(0.8,0.9),curva-0.5);
    raiz(raizx2,raizy2,tamano*random(0.8,0.9),curva+0.5);
    raiz(raizx3,raizy3,tamano*random(0.8,0.91),curva+0);
  }


}






