
 float ix1,ix2,ix3,ix4,ix5,ix6; // puntos iniciales de los globos en el eje x
  int iy = 252; // punto inicial de los globos en y
  int fy = -12; // punto final de los globos en y
  int i;
  int r1,g1,b1,r2,b2,g2,r3,b3,g3,r4,b4,g4,r5,b5,g5,r6,b6,g6;
  boolean ida,venida;
  int marcador=0;
  float[][] matbomba = new float[2][6];
  int ancho=400,alto=240;
  float x1canon=30.5,y1canon=120,xbala,ybala;
  char letra;
   
  bala disparo;
  
  import processing.serial.*;
  
  Serial myPort;  // The serial port
   
  class bala{ //la clase que toca colocar, para cumplir con las condiciones del programa...
  boolean sedispara=false; //y que conste que apesar de utlizarse únicamente para guardar una bandera, se utilizo...que es lo importante...
}
   
  void crea_bombas(){  //rutina que me 'crea' las bombas...en realidad las repite cuando llegan arriba, les reasigna una nueva coordenada en x y listo...ah y nuevos colores
      if((matbomba[1][0]>=fy)&&(matbomba[1][0]<=(fy+6))){
      ix1=random(200,335);
      r1=(int)random(0,235);
      g1=(int)random(0,235);
      b1=(int)random(0,235);
      matbomba[0][0]=ix1;
      matbomba[1][0]=iy;
      }
      if((matbomba[1][1]>=fy)&&(matbomba[1][1]<=(fy+6))){
      ix2=random(200,335);
      r2=(int)random(0,235);
      g2=(int)random(0,235);
      b2=(int)random(0,235);
      matbomba[0][1]=ix2;
      matbomba[1][1]=iy;
      }
      if((matbomba[1][2]>=fy)&&(matbomba[1][2]<=(fy+6))){
      ix3=random(200,335);
      r3=(int)random(0,235);
      g3=(int)random(0,235);
      b3=(int)random(0,235);
      matbomba[0][2]=ix3;
      matbomba[1][2]=iy;
      }
      if((matbomba[1][3]>=fy)&&(matbomba[1][3]<=(fy+6))){
      ix4=random(200,335);
      r4=(int)random(0,235);
      g4=(int)random(0,235);
      b4=(int)random(0,235);
      matbomba[0][3]=ix4;
      matbomba[1][3]=iy;
      }
      if((matbomba[1][4]>=fy)&&(matbomba[1][4]<=(fy+6))){
      ix5=random(200,335);
      r5=(int)random(0,235);
      g5=(int)random(0,235);
      b5=(int)random(0,235);
      matbomba[0][4]=ix5;
      matbomba[1][4]=iy;
      }
      if((matbomba[1][5]>=fy)&&(matbomba[1][5]<=(fy+6))){
      ix6=random(200,335);
      r6=(int)random(0,235);
      g6=(int)random(0,235);
      b6=(int)random(0,235);
      matbomba[0][5]=ix6;
      matbomba[1][5]=iy;
      }
    }
   
  void tray_bombas(){  //función que me dibuja las bombas, siguiendo una trayectoria...y que contiene más funciones que en realidad lo hacen...
    if(matbomba[1][0]>=232){
      ida=true;
      venida=false;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]>=225){
      ida=false;
      venida=true;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]>=242){
      ida=true;
      venida=false;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]>=228){
      ida=false;
      venida=true;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]>=234){
      ida=true;
      venida=false;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]>=236.4){
      ida=false;
      venida=true;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //1
    if(matbomba[1][0]<232&&matbomba[1][0]>=202){
      ida=false;
      venida=true;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<225&&matbomba[1][1]>=195){
      ida=true;
      venida=false;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<242&&matbomba[1][2]>=212){
      ida=false;
      venida=true;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<228&&matbomba[1][3]>=198){
      ida=true;
      venida=false;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<234&&matbomba[1][4]>=204){
      ida=false;
      venida=true;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<236.4&&matbomba[1][5]>=206.4){
      ida=true;
      venida=false;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //2
    if(matbomba[1][0]<202&&matbomba[1][0]>=172){
      ida=true;
      venida=false;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<195&&matbomba[1][1]>=165){
      ida=false;
      venida=true;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<212&&matbomba[1][2]>=182){
      ida=true;
      venida=false;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<198&&matbomba[1][3]>=168){
      ida=false;
      venida=true;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<204&&matbomba[1][4]>=174){
      ida=true;
      venida=false;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<206.4&&matbomba[1][5]>=176.4){
      ida=false;
      venida=true;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //3
    if(matbomba[1][0]<172&&matbomba[1][0]>=142){
      ida=false;
      venida=true;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<165&&matbomba[1][1]>=135){
      ida=true;
      venida=false;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<182&&matbomba[1][2]>=152){
      ida=false;
      venida=true;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<168&&matbomba[1][3]>=138){
      ida=true;
      venida=false;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<174&&matbomba[1][4]>=144){
      ida=false;
      venida=true;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<176.4&&matbomba[1][5]>=146.4){
      ida=true;
      venida=false;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //4
    if(matbomba[1][0]<142&&matbomba[1][0]>=112){
      ida=true;
      venida=false;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<135&&matbomba[1][1]>=105){
      ida=false;
      venida=true;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<152&&matbomba[1][2]>=122){
      ida=true;
      venida=false;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<138&&matbomba[1][3]>=108){
      ida=false;
      venida=true;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<144&&matbomba[1][4]>=114){
      ida=true;
      venida=false;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<146.4&&matbomba[1][5]>=116.4){
      ida=false;
      venida=true;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //5
    if(matbomba[1][0]<112&&matbomba[1][0]>=82){
      ida=false;
      venida=true;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<105&&matbomba[1][1]>=75){
      ida=true;
      venida=false;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<122&&matbomba[1][2]>=92){
      ida=false;
      venida=true;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<108&&matbomba[1][3]>=78){
      ida=true;
      venida=false;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<114&&matbomba[1][4]>=84){
      ida=false;
      venida=true;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<116.4&&matbomba[1][5]>=86.4){
      ida=true;
      venida=false;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //6
    if(matbomba[1][0]<82&&matbomba[1][0]>=52){
      ida=true;
      venida=false;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<75&&matbomba[1][1]>=45){
      ida=false;
      venida=true;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<92&&matbomba[1][2]>=62){
      ida=true;
      venida=false;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<78&&matbomba[1][3]>=48){
      ida=false;
      venida=true;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<84&&matbomba[1][4]>=54){
      ida=true;
      venida=false;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<86.4&&matbomba[1][5]>=56.4){
      ida=false;
      venida=true;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //7
    if(matbomba[1][0]<52&&matbomba[1][0]>=22){
      ida=false;
      venida=true;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<45&&matbomba[1][1]>=15){
      ida=true;
      venida=false;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<62&&matbomba[1][2]>=32){
      ida=false;
      venida=true;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<48&&matbomba[1][3]>=18){
      ida=true;
      venida=false;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<54&&matbomba[1][4]>=24){
      ida=false;
      venida=true;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<56.4&&matbomba[1][5]>=26.4){
      ida=true;
      venida=false;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //8
    if(matbomba[1][0]<22&&matbomba[1][0]>=-18){
      ida=true;
      venida=false;
      i=0;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][1]<15&&matbomba[1][1]>=-18){
      ida=false;
      venida=true;
      i=1;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][2]<32&&matbomba[1][2]>=-18){
      ida=true;
      venida=false;
      i=2;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][3]<18&&matbomba[1][3]>=-18){
      ida=false;
      venida=true;
      i=3;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][4]<24&&matbomba[1][4]>=-18){
      ida=true;
      venida=false;
      i=4;
      zigzag(ida,venida,i);
    }
    if(matbomba[1][5]<26.4&&matbomba[1][5]>=-18){
      ida=false;
      venida=true;
      i=5;
      zigzag(ida,venida,i);
    }
    circular(); //9
  }
 
void zigzag(boolean ida, boolean venida, int i){ //es el zigzageo para que tome la trayectoria de una bomba...
  if((ida==true)&&(venida==false)){
    switch(i){
      case 0:
      matbomba[0][0]+=1;
      matbomba[1][0]-=1;
      return;
      case 1:
      matbomba[0][1]+=0.5;
      matbomba[1][1]-=0.5;
      break;
      case 2:
      matbomba[0][2]+=2;
      matbomba[1][2]-=2;
      break;
      case 3:
      matbomba[0][3]+=1.5;
      matbomba[1][3]-=1.5;
      break;
      case 4:
      matbomba[0][4]+=0.75;
      matbomba[1][4]-=0.75;
      break;
      case 5:
      matbomba[0][5]+=1.2;
      matbomba[1][5]-=1.2;
      break;
    }
  }
  if((ida==false)&&(venida==true)){
    switch(i){
      case 0:
      matbomba[0][0]-=1;
      matbomba[1][0]-=1;
      return;
      case 1:
      matbomba[0][1]-=0.5;
      matbomba[1][1]-=0.5;
      break;
      case 2:
      matbomba[0][2]-=2;
      matbomba[1][2]-=2;
      break;
      case 3:
      matbomba[0][3]-=1.5;
      matbomba[1][3]-=1.5;
      break;
      case 4:
      matbomba[0][4]-=0.75;
      matbomba[1][4]-=0.75;
      break;
      case 5:
      matbomba[0][5]-=1.2;
      matbomba[1][5]-=1.2;
      break;
    }
  }
}
 
void circular(){ // estas sub-sub rutina me va creando las elipses con forma de globos, según las coordenadas dabas por alguna función anterior(zigzag)...
  fondo();
  smooth();
  noStroke();
  fill(r1,g1,b1);
  ellipse(matbomba[0][0],matbomba[1][0],20,25);
  fill(r2,b2,g2);
  ellipse(matbomba[0][1],matbomba[1][1],15,25);
  fill(r3,g3,b3);
  ellipse(matbomba[0][2],matbomba[1][2],20,30);
  fill(r4,g4,b4);
  ellipse(matbomba[0][3],matbomba[1][3],17,21);
  fill(r5,g5,b5);
  ellipse(matbomba[0][4],matbomba[1][4],22,29);
  fill(r6,g6,b6);
  ellipse(matbomba[0][5],matbomba[1][5],20,23);
  noSmooth();
}
 
void fondo(){ //y este es la del fondo y otras cosas adiconales decorativas...
  background(232,235,255);
  noStroke();
  smooth();
  fill(214,131,67);
  rect(ancho-40,0,40,240);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  stroke(178,88,20);
  strokeWeight(3);
  line(ancho-40,0,ancho-40,alto);
  line(ancho-40,20,ancho,20);
  line(ancho-40,60,ancho,60);
  line(ancho-40,100,ancho,100);
  line(ancho-40,140,ancho,140);
  line(ancho-40,180,ancho,180);
  line(ancho-40,220,ancho,220);
  noStroke();
  fill(129,117,108);
  rect(0,0,13,240);
  fill(64,54,46);
  ellipse(5,7,3,4);
  ellipse(6,19,4,4);
  ellipse(3,34,3,1);
  ellipse(5,39,3,4);
  ellipse(5,59,7,4);
  ellipse(5,66,3,4);
  ellipse(7,89,2,5);
  ellipse(5,99,3,4);
  ellipse(9,104,5,1);
  ellipse(5,123,3,4);
  ellipse(5,147,4,11);
  ellipse(3,163,8,4);
  ellipse(5,179,3,4);
  ellipse(4,182,5,4);
  ellipse(2,240,2,2);
  ellipse(6,213,3,3);
  ellipse(1,229,4,4);
  ellipse(0,0,5,5);
  ellipse(0,235,7,4);
  noSmooth();
  return;
}
 
void canon(){ // esta funcioncilla es la encargada del cañon de disparo, lo sube, lo baja, y que salga el proyectil, siempre que se presiona una 'tecla'
  if(keyPressed){
    letra=key;
    movcanon();
    return;
    }
}
    
void movcanon(){
    switch(letra){
      case 's':
      if(y1canon==(alto-18)){
        y1canon-=2;
      }else{
        y1canon+=2;
      }
      break;
      case 'S':
      if(y1canon==(alto-18)){
        y1canon-=2;
      }else{
        y1canon+=2;
      }
      break;
      case 'w':
      if(y1canon==18){
        y1canon+=2;
      }else{
        y1canon-=2;
      }
      break;
      case 'W':
      if(y1canon==18){
        y1canon+=2;
      }else{
        y1canon-=2;
      }
      break;
      case 'd':
      disparo.sedispara=true;  //aquí se utiliza la clase...
      break;
      case 'D':
      disparo.sedispara=true; //aquí se utiliza la clase...de nuevo...
      break;
    }
      dib_canon();
      return;
  }
  
void comserial(){ //comprueba si se presiono algo en el serial, y si es así, mueve el cañon
  letra=myPort.readChar();
  movcanon();
  return;
}
 
void dib_canon(){ //esta operación, lo que hace es irme dibujando el cañon a medida que este vaya subiendo y bajando
  noStroke();
  smooth();
  fill(173);
  rect(x1canon,y1canon-9,55,18);
  fill(188,155,51);
  ellipse(x1canon,y1canon,35,35);
  fill(94);
  ellipse(x1canon+55,y1canon,9,18);
  fill(188,94,21);
  ellipse(x1canon,y1canon,8,8);
  strokeWeight(1.5);
  stroke(174,99,45);
  line(x1canon+(12*cos(0)),y1canon-(12*sin(0)),x1canon+(17*cos(0)),y1canon-(17*sin(0)));
  line(x1canon+(12*cos(PI/6)),y1canon-(12*sin(PI/6)),x1canon+(17*cos(PI/6)),y1canon-(17*sin(PI/6)));
  line(x1canon+(12*cos(PI/3)),y1canon-(12*sin(PI/3)),x1canon+(17*cos(PI/3)),y1canon-(17*sin(PI/3)));
  line(x1canon+(12*cos(PI/2)),y1canon-(12*sin(PI/2)),x1canon+(17*cos(PI/2)),y1canon-(17*sin(PI/2)));
  line(x1canon+(12*cos(2*PI/3)),y1canon-(12*sin(2*PI/3)),x1canon+(17*cos(2*PI/3)),y1canon-(17*sin(2*PI/3)));
  line(x1canon+(12*cos(5*PI/6)),y1canon-(12*sin(5*PI/6)),x1canon+(17*cos(5*PI/6)),y1canon-(17*sin(5*PI/6)));
  line(x1canon+(12*cos(PI)),y1canon-(12*sin(PI)),x1canon+(17*cos(PI)),y1canon-(17*sin(PI)));
  line(x1canon+(12*cos(7*PI/6)),y1canon-(12*sin(7*PI/6)),x1canon+(17*cos(7*PI/6)),y1canon-(17*sin(7*PI/6)));
  line(x1canon+(12*cos(4*PI/3)),y1canon-(12*sin(4*PI/3)),x1canon+(17*cos(4*PI/3)),y1canon-(17*sin(4*PI/3)));
  line(x1canon+(12*cos(3*PI/2)),y1canon-(12*sin(3*PI/2)),x1canon+(17*cos(3*PI/2)),y1canon-(17*sin(3*PI/2)));
  line(x1canon+(12*cos(5*PI/3)),y1canon-(12*sin(5*PI/3)),x1canon+(17*cos(5*PI/3)),y1canon-(17*sin(5*PI/3)));
  line(x1canon+(12*cos(11*PI/6)),y1canon-(12*sin(11*PI/6)),x1canon+(17*cos(11*PI/6)),y1canon-(17*sin(11*PI/6)));
  if(disparo.sedispara==false){
    strokeWeight(2.5);
    strokeCap(ROUND);
    stroke(200);
    line(x1canon+55,y1canon,x1canon+75,y1canon);
    xbala=(x1canon+55);
    ybala=y1canon;
  }
  noSmooth();
  return;
}
 
void labala(){ // y he aquí lo más importante, el proyectil, la bala, o en su caso, el alfiler para estallar los globito...esta función nos permite moverlo, y estallar los globos,
  if(disparo.sedispara==true){  //adicionalmente de irnos contando cuantos hemos estallado...
    xbala+=2.5;
    for(i=0;i<=5;i++){
      if((ybala<=(matbomba[1][i]+13))&&(ybala>=(matbomba[1][i]-13))){
        if(((xbala+20)<=(matbomba[0][i]))&&((xbala+20)>=(matbomba[0][i]-12))){
          disparo.sedispara=false;
          marcador++;
          matbomba[1][i]=fy;
          crea_bombas();
        }
      }
    }
    if(((xbala+20)<=(ancho-35))&&((xbala+20)>=(ancho-43))){ //por si le pega a ninguna bomba, ps cuando choque con el muro se recargue...
      disparo.sedispara=false;
    }
  }
  strokeWeight(2.5);  //esta sería la 'bala' ha andar...
  strokeCap(ROUND);
  stroke(200);
  line(xbala,ybala,xbala+20,ybala);
  return;
}
 
void contador(){  //estas son nuestras 'salidas' visibles, un contador del tiempo de juego y la cantidad de bombas estalladas...
  int tiempo=millis();
  fill(0);
  text("Tiempo: "+(int)(tiempo/1000),13,10);
  text("Bombas: "+marcador,13,22);
  if(tiempo>=40000){
    disparo.sedispara=false; //he aquí de nuevo la utilización de la clase...
    fondo();
    String anuncio ="Termino el Juego  Estallaste "+marcador+" bombas";
    fill(185,31,22);
    textAlign(CENTER,CENTER);
    textSize(32);
    text(anuncio,30,20,310,180);
  }
}
 
void setup() {  // la función 'main' del processing
  size(ancho,alto);
  for(i=0;i<=5;i++){
    matbomba[1][i]=fy;
  }
  disparo=new bala();
  myPort = new Serial(this, Serial.list()[0], 9600);
}
 
void draw() {  // y ps el 'while' del processing... la función más corta de todo el programa... xD...
  crea_bombas();
  tray_bombas();
  canon();
  comserial();
  labala();
  contador();
}

