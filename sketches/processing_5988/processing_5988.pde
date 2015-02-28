
/* 
Original code: Pablo Camus 2009 "oscilaciones matrix"
Thank you!
 */ 
float inc = .9;//incremento de angulo 
float dim = 30; //diametro de la ellipse central 
boolean isBackGround = false; 
boolean isFade = false; 
int LONGITUD = 60; 
int NUM_TALLOS = 16; 
void setup() { 
  size(800,800); 
 
  smooth(); 
} 
void draw() { 
 
  if ( isBackGround  == true){  
    background(0); 
  } //equivalente a  if ( isBackGround ){ background(255);} 
  if (isFade) hazFade(); 
  inc += 0.05; 
  //float angle = sin(inc) / 10.0 ; 
  float angle = sin(inc) /20.0 ; 
  translate(width/2,height/2); //trasladamos nuestro punto 0,0 de coordenadas a la mitad de la pantalla 
  for (int i = 0; i < NUM_TALLOS; i++) { // UN LOOP! que será esto? repite el bloque entre corchetes tantas veces como se cumpla la condicion de en medio 
    tail(0,dim/2, LONGITUD, angle); // llamamos a la funcion tal con 4 parametros 
    rotate(PI*2/NUM_TALLOS); // rotamos nuestra pantalla PI/4 
  } 
  fill(250,242,76); 
  stroke(255,22,33); 
  ellipse(0,0,25,25);
   fill(255); 
} 
void tail(float x,float y, int units, float angle) { 
  pushMatrix(); 
  translate(x, y); 
   
  for (int i =0 ; i < units; i++) { // loop decreciente,  
    strokeWeight(i); 
    stroke(0); 
    rect(10,10, 20, 50); 
    strokeWeight(0.5); 
    line(0,0,255,50); 
     fill(random(255)); 
  ellipse(120,120,12,100); 
  
  fill(random(255),random(255),random(255)); 
  stroke(255,22,33); 
  ellipse(0,0,5,5);
      
    translate(0, 20); //translate(0, 4); interesante 
    rotate(angle); 
  } 
  
  popMatrix(); 
} 
 
void hazFade(){ 
  isBackGround = false; 
  fill(250,242,76); 
  noStroke(); 
  rect(0,0,width,height); 
} 
 
void keyPressed() { 
  switch(key) { 
  case '+':  
    println("has pulsado la tecla +"); 
    break; 
  case '-':  
    println("has pulsado la tecla -"); 
    break; 
 
  case 'F':  
  case 'f': 
    isFade = !isFade; 
    break; 
  case 's':  
  case 'S':  
    println("salvamos IMAGEN"); 
    save("out/filename-"+frameCount+".png"); 
    break; 
 
  case 'b':  
  case 'B':  
    isBackGround =! isBackGround; 
 
    break; 
  } 
} 
 

