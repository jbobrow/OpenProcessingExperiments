
//Jaume Regàs - P4 - GRUP 03
//La practica tracta de fer que una serie d'objectes es moguin de manera aleatoria

//declarem les variables
int i, papallona, posx2, posy2, posx22, posy22, velx2, vely2, valor1, valor2;
int numPapallones = 5;

//boca                       //declarem i definim els valors d'unes altres variables
int midaxMinima = 75;
int midaxMaxima = 125;
int midayMinima = 60;
int midayMaxima = 100;
int interval = 5;
boolean creixent = true;
int midaxBola = 75;
int midayBola = 60;

//creem una matriu de color
color[] colorAlesPapallones = new color[numPapallones];

//creem una matriu de possX amb "numPapallones" elements:
float[] posX = new float[numPapallones];
//posY
float[] posY = new float[numPapallones];
//velX
float[] velX = new float[numPapallones];
//velY
float[] velY = new float[numPapallones];

void setup(){
size(600,480);
//PRESENTACIO
println("PAPALLONES");
println("JAUME REGAS 2ON GEDI GRUP 03");
//valor de les variables
i = 0;
posx2 = 200;
posy2 = 200;
posx22 = 400;
posy22 = 120;
velx2 = 5;
vely2 = 4;
valor2 = 30;
//no utilitzarem el "noCursor();" ja que sino no sabriem on fem click 

//inicialitzacio de les variables
for(int i = 0; i<numPapallones; i++){
  posX[i] = width/2;
  posY[i] = height/2;
  velX[i] = random(-15,15);
  velY[i] = random(-15,15);
  colorAlesPapallones[i] = color(100,random(100,255),255);

  }
}

void draw(){
  background(255, 239, 116);
  stroke(0, 0, 0);
  strokeWeight(15);
  
  //dibuixem, comencem amb la boca: 
  //m'he basat en un codi penjat a la web processing.joan.cat (breathBall) tot i que està modificat ja que en aquest cas es tracta d'una el·lipse
  fill(255, 121, 121);
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
  posx2 = posx2 + velx2;
  posy2 = posy2 + vely2;
  posx22 = posx22 + velx2;
    
  //nineta ull esquerre
  fill(valor1, 0, 0);
  stroke(valor1, 0, 0);
  ellipse(posx2, posy2, valor2, valor2);
  
  if ((posx2 >= 205)||(posx2 < 195)) {
    velx2 = -velx2;
  }
  
  if ((posy2 > 205)||(posy2 < 195)) {
    vely2 = -vely2;
  }
  
  //nineta ull dret
  ellipse(posx22, posy2, valor2, valor2);
  
  //celles: redefinim el valor de la seva posicio y
  //(shan aprofitat els limits dels ulls)
  stroke(0);
  posy22 = posy22 + (vely2/2);
  noFill();
  arc(200, posy22, 100, 50,PI+0.5,(2*PI)-0.5);
  arc(400, posy22, 100, 50,PI+0.5,(2*PI)-0.5);
  
   
  //comencem un bucle, aixi es faran les mateixes accions a tots els valors de les matrius
  for(i = 0; i<numPapallones; i++){
    posX[i] += velX[i];
    posY[i] += velY[i];
    
  //limits (eix x)
  if(((posX[i] - 50) <= 0)||((posX[i] + 50) >= width)){
    velX[i] = -velX[i];
  }
  else{
    velX[i] = random(-15,15);
  }
  
  //limits (eix y)
   if(((posY[i] - 50) <= 0)||((posY[i] + 50) >= height)){
    velY[i] = -velY[i];
  }
  else{
    velY[i] = random(-15,15);
  }
  
  
  //papallona
  noStroke();
  fill(colorAlesPapallones[i]);
  
  //ala dreta
  ellipse(posX[i]-27.5, posY[i]-27.5, 45, 45);
  ellipse(posX[i]-25, posY[i]+35, 30, 30);
  triangle(posX[i],posY[i]-20,posX[i]+47,posY[i]-17,posX[i]+25,posY[i]+20);
  triangle(posX[i]+10,posY[i]-32,posX[i]+40,posY[i]+32,posX[i],posY[i]+20);
  triangle(posX[i],posY[i]+25,posX[i]+12,posY[i]+42,posX[i]+30,posY[i]+10);
  
    //cercles ala dreta
  fill(posX[i], 200, posX[i]);  //quan sobrepassin la meitat del dibuix, canviaran drasticament de color
  if (posX[i] > width/2) {
  fill(posY[i], 50, posY[i]);
  }

  ellipse(posX[i]-27.5, posY[i]-27.5, 15, 15);
  ellipse(posX[i]-25, posY[i]+35, 10, 10);
  
  //ala esquerra
  fill(colorAlesPapallones[i]); 
  ellipse(posX[i]+27.5, posY[i]-27.5, 45, 45);
  ellipse(posX[i]+25, posY[i]+35, 30, 30);
  triangle(posX[i],posY[i]-20,posX[i]-47,posY[i]-17,posX[i]-25,posY[i]+20);
  triangle(posX[i]-10,posY[i]-32,posX[i]-40,posY[i]+32,posX[i],posY[i]+20);
  triangle(posX[i],posY[i]+25,posX[i]-12,posY[i]+42,posX[i]-30,posY[i]+10);
  
  //cercles ala esquerra
  fill(posX[i], 200, posX[i]);  //quan sobrepassin la meitat del dibuix, canviaran drasticament de color
  if (posX[i] > width/2) {
  fill(posY[i], 50, posY[i]);
  }
  
  ellipse(posX[i]+27.5, posY[i]-27.5, 15, 15);
  ellipse(posX[i]+25, posY[i]+35, 10, 10);

  //cap i cos
  fill(0,0,0);
  ellipse(posX[i], posY[i]-21.5, 12.5, 12.5);
  ellipse(posX[i], posY[i]+5, 12.5, 55);
  
  //banyes
  stroke(0);
  strokeWeight(2);
  line(posX[i]-2, posY[i]-21.5, posX[i]-4, posY[i]-40);
  line(posX[i], posY[i]-21.5, posX[i]+4, posY[i]-40);
  }
}
  
void mousePressed(){
  posX[papallona] = mouseX;
  posY[papallona] = mouseY;
  
  //si fem click a algun dels limits de la finestra, la papallona queda encallada,
  //es per aixo que s'ha de posar alguna restricció perque aixo no passi:
  
  //aquest proces diu que si fem click a algun dels extrems de la pantalla, la
  //papallona apareixera moguda 50 valors (dimensions papallona) mes al centre
  if (mouseX < 50){
    posX[papallona] = mouseX+51; //dexem 1 de marge perque 50 inclou l'error d'encallar-se
  }
  if (mouseX > width-50){
    posX[papallona] = mouseX-51;
  }
  if (mouseY < 50){
    posY[papallona] = mouseY+51;
  }
  if (mouseY > height-50){
    posY[papallona] = mouseY-51;
  }
   if (valor1==0){ //si es fa click amb el mouse, canviara el color dels ulls
    valor1=255;
    }
    else{
    valor1=0;
    }
    if (valor2==30){ //si es fa click amb el mouse, canviara la mida dels ulls
    valor2=40;
    }
    else{
    valor2=30;
    }
}

  



