
/*
Oscar Illera
Processing, 
Matrix-yo
 */
float inc = 0.0;//incremento de angulo
float dim = 20; //diametro de la ellipse central
boolean isBackGround = true;
boolean isFade = false;
int LONGITUD = 90;
int NUM_TALLOS = 6;
void setup() {
  size(1000,800);
 isFade = !isFade;

  smooth();
}
void draw() {

  if ( isBackGround  == true){ 
    background(0);
  } //equivalente a  if ( isBackGround ){ background(255);}
  if (isFade) hazFade();
  inc += 0.006;
  //float angle = sin(inc) / 10.0 ;
  float angle = sin(inc) /5.0 ;
  translate(width/2,height/2); //trasladamos nuestro punto 0,0 de coordenadas a la mitad de la pantalla
  for (int i = 0; i < NUM_TALLOS; i++) { // UN LOOP! que será esto? repite el bloque entre corchetes tantas veces como se cumpla la condicion de en medio
    tail(0,dim/3, LONGITUD, angle); // llamamos a la funcion tal con 4 parametros
    rotate(PI*2/NUM_TALLOS); // rotamos nuestra pantalla PI/4
  }
  fill(180);
  ellipse(0,0,dim,dim);
}
void tail(float x,float y, int units, float angle) {
  pushMatrix();
  translate(x, y);
  for (int i =0 ; i < units; i++) { // loop decreciente, 
    strokeWeight(i);
    stroke(0);//
    line(2, 3, 0, -4);
    strokeWeight(0.2);
    line(255,255,222,0);
    translate(0, 12); //translate(0, 4); interesante
    rotate(angle);
  }
  fill(230,0,0);
  ellipse(0,0,10,10);
  popMatrix();
}

void hazFade(){
  isBackGround = false;
  fill(255,255,255);
  noStroke();
  rect(1,2,width,height);
}

void keyPressed() {
  switch(key) {
  case '+': 
    println("has pulsado la tecla +");
    break;
  case '-': 
    println("has pulsado la tecla -");
    break;

  //case 'F': 
  //case 'f':
    //isFade = !isFade;
   // break;
  case 's': 
  case 'S': 
   // println("salvamos IMAGEN");
    save("out/filename-"+frameCount+".png");
    break;

  case 'b': 
  case 'B': 
    isBackGround =! isBackGround;

    break;
  }
}


