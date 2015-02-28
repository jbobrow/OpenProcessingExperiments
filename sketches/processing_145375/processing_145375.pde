
//Jaume Regàs - P3 - GRUP 03
//La practica tracta de fer que un objecte reboti als extrems de la finestra

//ulls i papallona        //anomenem quins valors son enters(int) o racionals(float)
int posx, posx2, posy, velx, vely, valor1, valor2;
float posxm, posym, velxm, velym;

//boca                       //definim els valors d'uns altres valors enters
int midaxMinima = 75;
int midaxMaxima = 125;
int midayMinima = 60;
int midayMaxima = 100;
int interval = 1;
boolean creixent = true;
int midaxBola = 75;
int midayBola = 60;

void setup() {  //donem valors als valors "int" i "float" que no hem donat anteriorment
  size (600,480);
  noCursor();
  posx = 200;
  posy = 200;
  posx2 = 400;
  velx = 1;
  vely = 1;
  posxm = width/2;
  posym = height/2;
  velxm = 6.25;
  velym = 6.25;
  valor1 = 0;
  valor2 = 10;
}

void draw() {
  background(255, 239, 116);
  stroke(0, 0, 0);
  strokeWeight(15);
  
  //linia ulls
  line(0, 200, 600, 200);
  
  //ull esquerre
  fill(255, 255, 255);
  rectMode(CENTER);
  rect(200, 200, 120, 100, 20);
  
  //ull dret
  rect(400, 200, 120, 100, 20);
  
   
  //MOVIMENT ULLS
  
  //redefinim els valors
  posx = posx + velx;
  posy = posy + vely;
  posx2 = posx2 + velx;
  posxm = posxm + velxm;
  posym = posym + velym;
  
  //nineta ull esquerre
  fill(valor1, 0, 0);
  stroke(valor1, 0, 0);
  ellipse(posx, posy, valor2, valor2);
  
  if ((posx >= 240)||(posx < 160)) {
    velx = -velx;
  }
  
  if ((posy > 230)||(posy < 170)) {
    vely = -vely;
  }
  
  //nineta ull dret
  ellipse(posx2, posy, valor2, valor2);
  
  if (posx >= 450) {
    velx = -velx;
  }
  
  //boca                     //m'he basat en un codi penjat a la web processing.joan.cat (breathBall) tot i que està modificat ja que en aquest cas es tracta d'una el·lipse
  fill(255, 121, 121);
  stroke(0);
  strokeWeight(15);
  ellipse(300, 325, midaxBola, midayBola);
  
  //si esta creixent, s'ha de sumar l'interval (es fa gran)
  if(creixent==true){
    midaxBola = midaxBola + interval;
  } 
  
  //si no esta creixent, s'ha de restar l'interval (es fa petita)
  else { 
    midaxBola = midaxBola - interval;
  }
  
  //com es una el·lipse i no un cercle, té eix x i y, ja que tenen valor diferent
   if(creixent==true){
    midayBola = midayBola + interval;
  } 
  else { 
    midayBola = midayBola - interval;
  }
  
  //limits boca
  if(midaxBola > midaxMaxima){
    creixent = false;
  }
  if(midaxBola < midaxMinima){
    creixent = true;
  }
  if(midayBola > midayMaxima){
    creixent = false;
  }
  if(midayBola < midayMinima){
    creixent = true;
  }
  
  //papallona
  noStroke();
  fill(posx-50, posy-50, 255);
  
  //ala dreta
  ellipse(posxm-27.5, posym-27.5, 45, 45);
  ellipse(posxm-25, posym+35, 30, 30);
  triangle(posxm,posym-20,posxm+47,posym-17,posxm+25,posym+20);
  triangle(posxm+10,posym-32,posxm+40,posym+32,posxm,posym+20);
  triangle(posxm,posym+25,posxm+12,posym+42,posxm+30,posym+10);
  
    //cercles ala dreta
  fill(posxm, 200, posxm);  //quan sobrepassi la meitat del dibuix, canviara drasticament de color
  if (posxm > width/2) {
  fill(posym, 50, posym);
  }

  ellipse(posxm-27.5, posym-27.5, 15, 15);
  ellipse(posxm-25, posym+35, 10, 10);
  
  //ala esquerra
  fill(posx-50, posy-50, 255);
  ellipse(posxm+27.5, posym-27.5, 45, 45);
  ellipse(posxm+25, posym+35, 30, 30);
  triangle(posxm,posym-20,posxm-47,posym-17,posxm-25,posym+20);
  triangle(posxm-10,posym-32,posxm-40,posym+32,posxm,posym+20);
  triangle(posxm,posym+25,posxm-12,posym+42,posxm-30,posym+10);
  
    //cercles ala esquerra
  fill(posxm, 200, posxm);  //quan sobrepassi la meitat del dibuix, canviara drasticament de color
  if (posxm > width/2) {
  fill(posym, 50, posym);
  }
  
  ellipse(posxm+27.5, posym-27.5, 15, 15);
  ellipse(posxm+25, posym+35, 10, 10);

  //cap i cos
  fill(0,0,0);
  ellipse(posxm, posym-21.5, 12.5, 12.5);
  ellipse(posxm, posym+5, 12.5, 55);
  
  //banyes
  stroke(0);
  strokeWeight(2);
  line(posxm-2, posym-21.5, posxm-4, posym-40);
  line(posxm, posym-21.5, posxm+4, posym-40);
  
  //moviment papallona
  if ((posxm >= width-50)||(posxm < 50)) {
    velxm = -velxm;
  }
  
  if ((posym > height-50)||(posym < 50)) {
    velym = -velym;
  }
}  

  void mousePressed(){   //quan es fagi un click amb el mouse, es reiniciara el proces
  
   posx = 200;
   posy = 200;
   posx2 = 400;
   posxm = width/2;
   posym = height/2;
   
   //quan es fagi un click amb el mouse, els ulls es faran grans i de color vermell
   fill(255,0,0);
   stroke(valor1,0,0);
   ellipse(200, 200, 10, 10);
   ellipse(400, 200, 10, 10);
    //Cinta del cap--> canvia el color
    
    if (valor1==0){ //si es fa click amb el mouse, canviara el color dels ulls
    valor1=255;
    }
    else{
    valor1=0;
    }
    if (valor2==10){ //si es fa click amb el mouse, canviara la mida dels ulls
    valor2=5;
    }
    else{
    valor2=10;
    }
    

  
  }
  





