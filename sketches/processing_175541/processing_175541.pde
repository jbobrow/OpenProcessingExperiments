
//El juego esta basado en los personajes de angry birds
//consiste en tres pantallas de dificultad que cambian al lograr
//1000 puntos. 
//En la primera pantalla aparecen dos angrys que 
//traspasan la pantalla de derecha a izquierda 
//y que quitan putuacion si te acercas, y con las flechas
//del teclado mueves tu personaje donde el objetivo es conseguir
//los huevos que van apareciendo de forma random.
//En la segunda pantalla aparecen los mismos personajes de la
//primera pantalla mas dos mÃ�Â¡s, que van a velocidades mÃ�Â¡s lentas
//pero quitan mas puntuaciÃ�Â³n.
//Finalmente, la ultima pantalla aparecen lo mismo de la segunda
//mas dos angrys que se mueven de forma aleatoria por toda la 
//pantalla.
//En cada inicio de pantalla hay una imagen explicativa de
//que evitar y que coger.
//Si tienes puntuaciÃ�Â³n negativa "Has perdido" y hay que apretar
//"r" para volver a cargar el juego.

//Imagenes
PImage cerdo,intro,fondo,fondo2,fondo3,angryr,angrya,angryn,angrybl,angrygr,angrygn,huevon;
PImage ganar, perder;
//Posiciones personajes
int poscX = 30, poscY = 400;
int posaX = 700, posaY = 300, velaX = 4;
int posaaX = 700, posaaY = 75, velaaX = 2;
int posanX = 700, posanY = 200, velanX = 3;
int posabX = 700, posabY = 400, velabX = 2;
int posagrX = 700, posagrY = 150, velagrX = (int)random(1,5), velagrY = (int)random(1,5);
int posagnX = 700, posagnY = 350, velagnX = (int)random(1,5), velagnY = (int)random(1,5);
int poshX = (int)random(50,700), poshY = (int)random(50,450);
//InicializaciÃ�Â³n pantalla y puntuaciÃ�Â³n 0
int pantalla=0;
int score=0;
//Distancias entre personajes
int disthcX,disthcY,distacX, distacY,distaacX,distaacY;
int distancX, distancY, distabcX, distabcY;
int distagrcX, distagrcY, distagncX, distagncY;


void setup(){
  size(750,500);
  //cargamos las imagenes que apareceran en el juego
  cerdo = loadImage("Corporal_Pig.png");
  intro = loadImage("inicio.jpg");
  fondo = loadImage("fondo.jpg");
  fondo2 = loadImage("segundonivel.jpg");
  fondo3 = loadImage("ultimonivel.jpg");
  angryr = loadImage("hola.png");
  angrya = loadImage("amarillo.png");
  angryn = loadImage("negro.png");
  angrybl = loadImage("blanquito.png");
  angrygr = loadImage("angrygr.png");
  angrygn = loadImage("grande.png");
  huevon = loadImage("huevonormal.png");
  ganar = loadImage("ganar.jpg");
  perder = loadImage("lose.jpg");
}
void draw(){
  //introducciÃ�Â³n del juego(imagen explicativa)
  if(pantalla==0){
    image(intro,0,0,width,height);
  }
  //segunda pantalla de juego, aparecen ya dos angrys.
  else if(pantalla==1){
    pantalla1();
  //Cerdo
    image(cerdo,poscX,poscY,70,70);  
  //Si la puntuacion es mayor o igual a 1000, pasas al siguiente
  //nivel
    if(score>=1000){
      pantalla=2;
    }
   //Ejecucion de la funciÃ�Â³n "score"
    score();
  }
  //tercera pantalla del juego(imagen explicativa)
  else if(pantalla==2){
    image(fondo2,0,0,width,height);
  }
  //cuarta pantalla
  else if(pantalla==3){    
    //mismos angry que en la pantalla 1
    pantalla1();
    //aÃ�Â±adimos dificultad con dos angrys mas
    pantalla3();
    //Cerdo de nuevo y puntaciÃ�Â³n(no se puede meter en una funciÃ�Â³n
   //porque si no otra funcion se superpone encima)
   //asÃ�Â­ al cargarse el Ã�Âºltimo aparecerÃ�Â¡ delante de 
   //todos los angrys
    image(cerdo,poscX,poscY,70,70); 
    score();
    //Si la puntuaciÃ�Â³n es mayor que 2000, pasas al siguiente
    //nivel
    if(score>=2000){
      pantalla=4;
  }
}
//quinta pantalla(imagen explicativa)
  else if(pantalla==4){
    image(fondo3,0,0,width,height);
  }
  //sexta pantalla
  else if(pantalla==5){
    //mismos angry que en la pantalla 1 y 3
    pantalla1();
    pantalla3();
    //aÃ�Â±adimos dificultad con dos angrys mas
    pantalla5();
    //Cerdo y funcion puntaciÃ�Â³n.
    image(cerdo,poscX,poscY,70,70);  
    score();
    //Si la puntuaciÃ�Â³n es mayor que 3000 GANAS
    if(score>=3000){
      image(ganar,0,0,width,height);
      score=3000;
    }
  }
  //pantalla que aparece cuando pierdes.
  else if(pantalla==6){
    image(perder,0,0,width,height);
  }
  
  
   //Cambios de pantalla
  if(key == 'a'){
    pantalla=3;
  }
  if(key == 'q'){
    pantalla=5;
  }
  if(key == 'r'){
    pantalla=1;
  }
  //movimiento up,down,left y right del cerdo por la pantalla
  if(key == CODED){
    if (keyCode == UP) {
      poscY=poscY-9;
    } 
    else if (keyCode == DOWN) {
      poscY=poscY+9;
    }
    if(keyCode == LEFT) {
      poscX=poscX-9;
    }
    else if(keyCode == RIGHT) {
      poscX=poscX+9;
    }
    //limitaciones de la pantalla en el movimiento del cerdo
    if(poscX <= 20){
      poscX=20;
    }
   if(poscX>=width-90){
     poscX=width-90;
    }
   if(poscY <= 18){
     poscY = 18;
   }
   if(poscY >= height-90){
     poscY = height-90;
   }
 }
  
  
  
}    
//FunciÃ�Â³n puntaciÃ�Â³n
void score(){
  fill(0);
  textSize(15);
  text("Score: " + score, 40, 50);
  //Si la puntuaciÃ�Â³n es de signo negativo
  //aparece la pantalla=6, la de has perdido
  //y la puntaciÃ�Â³n vuelve a 0 y posicion inicial
  if(score<=-1){
    pantalla=6;
    score=0;
    poscX = 30; 
    poscY = 400;
  }
}
//FunciÃ�Â³n teclado 
void keyPressed(){
  //Cambios de pantalla
  if(key == 'a'){
    pantalla=3;
  }
  if(key == 'q'){
    pantalla=5;
  }
  if(key == 'r'){
    pantalla=1;
  }
  //movimiento up,down,left y right del cerdo por la pantalla
  if(key == CODED){
    if (keyCode == UP) {
      poscY=poscY-9;
    } 
    else if (keyCode == DOWN) {
      poscY=poscY+9;
    }
    if(keyCode == LEFT) {
      poscX=poscX-9;
    }
    else if(keyCode == RIGHT) {
      poscX=poscX+9;
    }
    //limitaciones de la pantalla en el movimiento del cerdo
    if(poscX <= 20){
      poscX=20;
    }
   if(poscX>=width-90){
     poscX=width-90;
    }
   if(poscY <= 18){
     poscY = 18;
   }
   if(poscY >= height-90){
     poscY = height-90;
   }
 }
}
//FunciÃ�Â³n ratÃ�Â³n
void mousePressed(){
  //cambio de pantalla 0 a 1
  if(mouseButton == LEFT){
    pantalla=1;
    println("APRETAS");
  }
 
  if(mouseButton == RIGHT){
  score=score+100;
  }
  
}

//Pantalla 1
void pantalla1(){
  //Imagen de fondo y huevo
  image(fondo,0,0,width,height);
  image(huevon,poshX,poshY,40,40);
  //Colision de huevo con el cerdo, aÃ�Â±adimos 100puntos
  //y cambia el huevo de posiciÃ�Â³n random
  disthcX = abs((poscX+27)-poshX);
  disthcY = abs((poscY+35)-(poshY));
  if((disthcX<20)&&(disthcY<20)){
   poshX = (int)random(75,400);
   poshY = (int)random(75,400); 
   score=score+100;
  }
  
  //Imagen del angry rojo y su movimiento
  image(angryr,posaX,posaY,60,60);
  posaX=posaX-velaX; 
  //Cuando llega al limite izq, reaparece a la derecha
  //con una posiciÃ�Â³n random en la Y y velocidad random
  if(posaX <= 0){
  posaX = 700;
  posaY = (int)random(50,420); 
  velaX = (int)random(4,2);
   }
  //Colision del angry con el cerdo(quita puntuaciÃ�Â³n)
  distacX = abs((poscX)-posaX);
  distacY = abs((poscY)-posaY);
  if((distacX<15)&&(distacY<15)){
  score=score-10;}

  //Imagen angry amarillo y su movimiento
  //misma repeticion que el angry rojo
  //y colisiÃ�Â³n con el cerdo(quita puntuaciÃ�Â³n)
  image(angrya,posaaX,posaaY,60,60);
  posaaX=posaaX-velaaX;
  if(posaaX <= 0){
  posaaX = 700;
  posaaY = (int)random(50,420); 
  velaaX = (int)random(4,2);
   }
  distaacX = abs((poscX)-posaaX);
  distaacY = abs((poscY)-posaaX);
  if((distaacX<20)&&(distaacY<20)){
  score=score-10;}
  
 }
void pantalla3(){
  image(angryn,posanX,posanY,70,60);
  posanX=posanX-velanX; 
  if(posanX <= 0){
  posanX = 700;
  posanY = (int)random(50,420); 
  velanX = (int)random(3,1);
   }
  distancX = abs(poscX-posanX);
  distancY = abs(poscY-posanY);
  if((distancX<30)&&(distancY<30)){
  score=score-10;
}
 
  image(angrybl,posabX,posabY,75,60);
  posabX=posabX-velabX; 
  if(posabX <= 0){
  posabX = 700;
  posabY = (int)random(50,420); 
  velabX = (int)random(3,1);
   }
  distabcX = abs(poscX-posabX);
  distabcY = abs(poscY-posabY);
  if((distabcX<30)&&(distabcY<30)){
  score=score-10;
}
}
void pantalla5(){
  
  image(angrygr,posagrX,posagrY,100,85);
  posagrX = posagrX-velagrX;
  posagrY = posagrY-velagrY;
  //Choque con las paredes en sus limites
  if((posagrX<= 0)){
    velagrX = (int)random(1,5) * -1;
  }
  if(posagrX+100 >= width){
    velagrX = (int)random(1,5);
  }
  if(posagrY <= 0){
    velagrY = (int)random(1,5) * -1;
  }
  if(posagrY+65 >= height){
  velagrY = (int)random(1,5);
  }
  distagrcX = abs(poscX-posagrX);
  distagrcY = abs(poscY-posagrY);
  if((distagrcX<10)&&(distagrcY<10)){
  score=score-20;
  }
  image(angrygn,posagnX,posagnY,100,85);
  posagnX = posagnX-velagnX;
  posagnY = posagnY-velagnY;
  //Choque con las paredes en sus limites
  if(posagnX<= 0){
    velagnX = (int)random(1,5) * -1;
  }
  if(posagnX+100 >= width){
    velagnX = (int)random(1,5);
  }
  if(posagnY <= 0){
    velagnY = (int)random(1,5) * -1;
  }
  if(posagnY+65 >= height){
  velagnY = (int)random(1,5);
}
  distagncX = abs(poscX-posagnX);
  distagncY = abs(poscY-posagnY);
  if((distagncX<10)&&(distagncY<10)){
  score=score-20;
  }
}

