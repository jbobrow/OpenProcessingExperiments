
/*Reloj creativo.
Realizado por Laia Cámpiz Gutiérrez.
Creación de Videojuegos.
Comunicación Audiovisual. 
Universidad Pompeu Fabra. */


//Declaramos variables.
int cx;
int cy;
float radioSegundos;
float radioMinutos;
float radioHoras;
float fondo;

void setup() {
  size(640, 360);

  //Damos valor a las variables que hemos declarado arriba. 
  cx = width / 2;
  cy = height / 2;
  
  
  //Se elige el menor valor de la altura o la anchura de la ventana (tamaño dado en size) y se establece como radio máximo del reloj. Esto sirve
  //para que el tamaño sea proporcional a la ventana. 
  
  int radio = min(width, height) / 2;  //Minimo de la ventana entre el valor width y height. En este caso sería height porque es 360 y width es 640.
  radioSegundos = radio * 0.45;         //lo multiplicamos por el numero que queramos. Para que no sea tan grande. 
  radioMinutos = radio * 0.5;
  radioHoras = radio * 0.85;
  fondo =  2 * radio * 0.5;   //Aquí lo multiplicamos además por 2 porque queremos el diámetro y no el radio. 
}

void draw() {
  background(110);
  
  fondoReloj(); 
  horas();
  minutos();
  segundos();
}
  
  






///////////////////////////////////////////////////////////////FUNCIONES/////////////////////////////////////////////////////////

void fondoReloj (){
  //Dibujamos el fondo del reloj.
  //fill(245,255,180);
  noStroke();
  
  boolean amanecer = ((hour()>=6)&&(hour()<=8));
  boolean dia = ((hour()>8)&&(hour()<19));
  boolean atardecer = ((hour()>=19)&&(hour()<=20));     
  
  //Cambio color fondo
  if (amanecer){
    fill(255,204,121);
  }

  if (dia){
    fill(245,255,180);
  }

  if (atardecer){
    fill(245,158,164);
  }
   
  if ((!amanecer)&&(!dia)&&(!atardecer)) {
    fill(105,140,242);
  }
 
  ellipse(cx, cy, fondo, fondo);     //Utilizamos la variable fondo porque nos interesa que tenga el radio que hemos indicado arriba en esta variable.
}


void horas (){
  //HORAS
   int horaBase12=hour();          //Queremos que sea sobre 12 y el ordenador va sobre 24. Por eso cuando la hora sea más grande que 12 le restaremos a la hora del ordenador 12.
   if (horaBase12>12) {
      horaBase12 = horaBase12-12; //Restamos 12 porque es la diferencia entre hora analógica y digital. Por ejemplo 20:00 o 8:00pm. 20-8 = 12.
   }
   
  strokeWeight(1);
  
  boolean amanecer = ((hour()>=6)&&(hour()<=8));
  boolean dia = ((hour()>8)&&(hour()<19));
  boolean atardecer = ((hour()>=19)&&(hour()<=20)); 

//Cambio color según segundos  
 if (amanecer){
    stroke(255,144,8);
  }

  if (dia){
    stroke(255,233,64);
  }

  if (atardecer){
    stroke(245,54,80);
  }
   
  if ((!amanecer)&&(!dia)&&(!atardecer)) {
    stroke(5,8,255);
  } 
 
 for (float  pintaHora = 1; pintaHora <= horaBase12; pintaHora++) {    //Esto sirve para que se mantengan las rayas. Siempre y cuando la hora sea 0 y más pequeña o igual
  
  float gradosHoras = pintaHora*(2*PI)/12- HALF_PI;        //2*PI = 360º de la circumferencia. Se divide en 12 porque son las horas que queremos y le restamos HALF_PI para que empieze en las 12 y no en las 3. 
  float xInterno = cx + cos(gradosHoras) * radioMinutos;   //Esto nos da las 4 coordenadas necesarias para pintar las horas. Cos 
  float yInterno = cy + sin(gradosHoras) * radioMinutos;   //radioMinutos porque necesitamos que la primera coordenada esté situada en la circumferencia de los minutos. 
  float xExterno = cx + cos(gradosHoras) * radioHoras;     //radioHoras porque la segunda coordenada estará en el circulo de las horas, aunque este circulo no esté dibujado.
  float yExterno = cy + sin(gradosHoras) * radioHoras;
  
  line(xInterno,yInterno,xExterno,yExterno);               //Creamos una linea dentro del bucle for con estas coordenadas.
 } 
} 

void minutos (){
 
  //MINUTOS
  float gradosMinutos=minute()*(2*PI)/60 - HALF_PI;   //En este caso lo dividimos entre 60, porque son 60 minutos. Restamos Half_PI por el mismo motivo que antes.
  strokeWeight(2);
  beginShape(POINTS);
  
  boolean amanecer = ((hour()>=6)&&(hour()<=8));
  boolean dia = ((hour()>8)&&(hour()<19));
  boolean atardecer = ((hour()>=19)&&(hour()<=20));
  
  
  //Cambio color según minutos
  if (amanecer){
    stroke(255,144,8);
  }

  if (dia){
    stroke(255,233,64);
  }

  if (atardecer){
    stroke(245,54,80);
  }
   
  if ((!amanecer)&&(!dia)&&(!atardecer)) {
    stroke(5,8,255);
  } 
  
  //Como hacemos el bucle segun el angulo, debemos restar tambien en el inicio de las 12 y no en el de las 3.
  for (float  angle = 0- HALF_PI; angle < gradosMinutos; angle+=0.001) {
    //Posicionamiento de un ángulo en coordenadas x,y en una circunferencia. Fórmula extraida de VITUTOR (Poner enlace).
    float x = cx + cos(angle) * radioMinutos;    //Formula extraida del ejemplo siguiente: https://processing.org/examples/clock.html
    float y = cy + sin(angle) * radioMinutos;
    vertex(x, y);
  }
  endShape();   
}

void segundos (){
 //SEGUNDOS
  
  float segundos =second()*radioSegundos/60; //radioSegundos es el tamaño de la circumferencia. Por eso lo dividimos entre 60 segundos que son los que queremos conseguir.
  //fill(255);
  
  boolean amanecer = ((hour()>=6)&&(hour()<=8));
  boolean dia = ((hour()>8)&&(hour()<19));
  boolean atardecer = ((hour()>=19)&&(hour()<=20));
   
  //Cambio de color según horas.
   
  noStroke();         
  
  if (amanecer){
    fill(255,144,8);
  }

  if (dia){
    fill(255,233,64);
  }

  if (atardecer){
    fill(245,54,80);
  }
   
  if ((!amanecer)&&(!dia)&&(!atardecer)) {
    fill(5,8,255);
  }
  
ellipse(cx, cy, 2*segundos, 2*segundos); //Multiplicamos segundos por dos porque la función ellipse funciona con diametro y lo que hemos declarado es el radio.  
}  

