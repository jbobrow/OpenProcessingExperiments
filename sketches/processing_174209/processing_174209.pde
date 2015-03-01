

float r = 0;
float generador =0;//angulo. movimiento del punto sea fluido 
int alturaSen = 150; //posición en pantalla.
int[] alturaCos = {150, -10, -20, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160, 170, 180, 190, -30, -40, -50, 200, 210, 221};
color[] colors = new color[alturaCos.length];

int recordedMillis = 0;
int interval = 200;


void setup() {
  size(500, 300);
  stroke(255);
  randomColors();
  //frameRate(7.5);
}

void randomColors() {
for(int i = 0; i < colors.length; i++) {
    colors[i] = color(random(135,155),random(196,206), random(226,255));
    //colors[i] = color(random(255),random(255,211), random(0));
  }
}

void draw() {
  background(175, 219, 211);;
  

  if (mousePressed) {
    randomColors();
    background(255);
    
     for(int i=0;i<width;i++){
      //Creamos un valor segÃƒÂºn el sino y cosino del generador
      float valorSen = sin(generador/4);
      float valorCos = cos(generador);
      //aumentamos el generadors (~ frecuencia de onda)
      generador += 0.01;
      valorCos *= 100; //amplitud
      
//dibujamos los puntos mediante los cuales obtendremos nuestra onda
for(int x=0; x<alturaCos.length; x++){
   strokeWeight(1);
   stroke(colors[x]);
   point(i, alturaCos[x]+ valorCos);
  }
}
} 
  
  else {
      for (int i=0; i<width; i++) {
      //Creamos un valor segun el sino y cosino del generador
      float valorSen = sin(generador); 
      float valorCos = cos(generador);
      //aumentamos el generadors (~ frecuencia de onda)
      generador += 0.1;

   //multiplicamos los valores (= amplitud de onda)
    
    valorCos *= 50;
    valorSen *= 100;
    //esta es la clave
    stroke(245, 238, 106);
    strokeWeight(4);
    point(i+cos(generador) *r, i + sin(generador)*r);
    r = r + 0.05;

    stroke(175, 219, 211);
    strokeWeight(4);
    
    stroke(0);
    point(i, height*3/4 + sin(generador) *40);  //dos formas distintas de hacerlo *40= amplitud
    point(i, height*3/4 + (PI/2)*sin(generador) *40);
    point(i, height*3/4+valorCos);
    point(i, alturaCos[5]+valorCos/4);
    point(i, alturaCos[9]+valorCos/4);
      }  

  }
}

void mousePressed(){
  if(millis()-recordedMillis < interval){
  noLoop();
  stroke(127);
  strokeWeight(1);
  for(int i=0; i < width; i += 25){
    line(i,0,i,height); 
  }
  }
  recordedMillis = millis();
}
void mouseReleased(){
  stroke(255);
  strokeWeight(3);
  loop(); 
}



