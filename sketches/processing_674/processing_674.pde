
// cargo las variables que contendran las geom
PShape secs1;
PShape mins1;
PShape horas1;
PShape dias1;
PShape meses1;
PShape anos1;

void setup (){
  size (700, 700);
  // cargo los svg 
  secs1 = loadShape("secs.svg"); 
  mins1 = loadShape("mins.svg"); 
  horas1 = loadShape("horas.svg");
  dias1 = loadShape("dias.svg");
  meses1 = loadShape("meses.svg");
  anos1 = loadShape("anos.svg");
  smooth ();
}

void draw() {
  background (255);
  // no se por que funcionan solaaaaaaaaaas y no juntas 
  //referencia ();

  secs ();
  //mins ();
  //horas (); 
  //dias();
  //meses ();
  //anos (); 
}
/* esto es pa saber donde esta el centro 
void referencia (){
  stroke (20);
  line (width/2, height, width/2, 1);
  line (width, height/2, 1, height/2);
}*/

void secs (){
  // osea seis grados  
  float rad = PI/30;
  int s = second(); 
  // que lo rote y que lo dibuje en estas 3 lineas 
  translate(width/2, height/2);
  rotate(s*(rad));
  shape(secs1,-79,-78,100,100);
}

void mins (){
  float rad = PI/30;
  int m = minute();
  // para cuadrarlo en el centro 
  //ellipse ( width/2, height/2, 150,150); 
  translate(width/2, height/2);
  rotate(m*(rad));
  shape(mins1,-128,-107,150,150);
}



void horas (){
  float rad = PI/12;
  // esto es pa saber cuantos grados son PI/12 
  //float deg = degrees(rad);
  //println(rad + " radians is " + deg + " degrees");
  int h = hour();
  // a ver si esta reconociendo los datos del reloj 
  //println( h + " horas");
  translate(width/2, height/2);
  rotate(h*(rad));
  shape(horas1,-134,-114,200,200);
}

void dias (){
  float rad = PI/15;
  int d = day();   
  //println( d + "dias");
  translate(width/2, height/2);
  rotate(d*(rad));
  shape(dias1,-143,-150,250,250);
}

void meses (){
  float rad = PI/6;
  float deg = degrees(rad);
  //println(rad4 + " radians is " + deg + " degrees");
  int m = month();  // Values from 1 - 12
  translate(width/2, height/2);
  rotate(m*(rad));
  shape(meses1,-162,-162,300,300);
}

void anos (){
  float rad = PI/5;
  int ye = year();  
  //ellipse ( width/2, height/2, 350,350);  
  translate(width/2, height/2);
  // aqui como solo son 10 años entonces le resto los 2000
  rotate((ye-2000)*rad);
  shape(anos1,-174,-174,350,350);
}




