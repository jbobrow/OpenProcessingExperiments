

//Creacion de una matriz de 3 Walkers llamada PIGwkrs
Walker [] PIGwkrs=new Walker [10];

//Declaración de parámetros

int myXx, myYy;

//Inicialización
void setup(){
  //quitar cursor
  noCursor();
  //presentación del trabajo, se lee siempre
  println("Angry Birds _ PIG");
  println("Amaia Aranzabal 2GEDI 03 _ Elisava");
  //tamaño de la ventana
  size(800,800);
  //definición color del fondo
  background(255,255,255);
  
  //Inicialización de cada Walker, parametros Step y medidas X,Y
  for ( int i=0; i<PIGwkrs.length;i++){
    PIGwkrs[i]=new Walker (5, myXx, myYy);
  }
}

void draw(){
  //definicion del color del fondo
  background(255,255,255);
  
  //Ejecución de los Walkers
  for (int i=0; i<PIGwkrs.length; i++){
    PIGwkrs[i].run();
  }
}

//Realización de la Clase Walker
class Walker {
  //Declaración de variables
  int mySzX, mySzY, myStep;
  float myX, myY;
   
  //Constructor
  Walker (int _st, int _szX, int _szY) {
    myStep = _st;
    mySzX = _szX;
    mySzY = _szY;
    myX = width/2;
    myY = height/2;
  }    
  //Creacion de una funcion equivalente al draw  
  void run() {
    updatePosition();
    drawMe();
  }
  
  //Definicion de posiciones
  void updatePosition() {
    //Creación de un random para cada dirección
    float randX = random(100);
    float randY = random(100);
    
    if (randX >= 50) {
      myX += myStep;
    } 
    else {
      myX -= myStep;
    }
    if (randY >= 50) {
      myY += myStep;
    } 
    else {
      myY -= myStep;
    }
    //Con CONSTRAIN se asegura que el cuerpo no salga de la ventana
    myX = constrain(myX, 0, width);
    myY = constrain(myY, 0, height);
  }
    
    
  void drawMe (){
  PIG(myXx,myYy);
  }

void PIG (int myXx, int myYy){ 
  //PIG
  //oreja izquierda
  strokeWeight(5);
  stroke(19,21,12);
  fill(135,185,34);
  ellipse(myX-(width/2)/8,myY-((height/2)/4.5),(width/2)/11,(height/2)/10);
  //oreja derecha
  ellipse(myX+(width/2)/15,myY-((height/2)/4),(width/2)/11,(height/2)/10);
  //cuerpo
  ellipseMode(CENTER);
  ellipse(myX,myY,(width/2)/2,(2*(height/2))/4.5);
  //orejas
  noStroke();
  ellipse(myX-(width/2)/8,myY-((height/2)/4.5),(width/2)/11,(height/2)/10);
  ellipse(myX+(width/2)/15,myY-((height/2)/4),(width/2)/11,(height/2)/10);
  fill(56,149,43);
  ellipse(myX-(width/2)/8,myY-((height/2)/4.5),(width/2)/22,(height/2)/25);
  ellipse(myX+(width/2)/15,myY-((height/2)/4),(width/2)/25,(height/2)/22);
  //boca
  fill(30,59,29);
  ellipse(myX,myY+(height/2)/25,(2*(width/2))/10,(height/2)/4);
  //cejas
  fill(32,91,39);
  arc(myX-((width/2)*3)/16,myY-(height/2)/20,((width/2)*3)/30,((height/2)*3)/30,PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  arc(myX+((width/2)*3)/16,myY-(height/2)/20,((width/2)*3)/30,((height/2)*3)/30,PI+QUARTER_PI, TWO_PI-QUARTER_PI);
  fill(135,185,34);
  ellipse(myX-((width/2)*3)/16,myY-(height/2)/23,((width/2)*3)/28,((height/2)*3)/28);
  ellipse(myX+((width/2)*3)/16,myY-(height/2)/23,((width/2)*3)/28,((height/2)*3)/28);
  //ojos
  strokeWeight(3);
  stroke(65,112,43);
  fill(255,255,255);
  ellipse(myX-((width/2)*3)/16,myY,((width/2)*3)/30,((height/2)*3)/30);
  ellipse(myX+((width/2)*3)/16,myY,((width/2)*3)/30,((height/2)*3)/30);
  noStroke();
  fill(0,0,0);
  ellipse(myX-((width/2)*3)/15,myY,((width/2)*2)/75,((height/2)*2)/75);
  ellipse(myX+((width/2)*3)/16.5,myY,((width/2)*2)/75,((height/2)*2)/75);
  
  //ojos grandes, en el tiempo que se pulsa el mouse los ojos se agrandan y cambia aleatoriamente su color
  if (mousePressed) {
  strokeWeight(3);
  stroke(65,112,43);
  fill(255);
  ellipse(myX-((width/2)*3)/16,myY,((width/2)*3)/10,((height/2)*3)/10);
  ellipse(myX+((width/2)*3)/16,myY,((width/2)*3)/10,((height/2)*3)/10);
  noStroke();
  fill (random(255),random(255),random(255));
  ellipse(myX-((width/2)*3)/15,myY,((width/2)*2)/25,((height/2)*2)/25);//cambio de tamaño
  ellipse(myX+((width/2)*3)/16.5,myY,((width/2)*2)/25,((height/2)*2)/25);
  }
  
  //dientes
  fill(68,114,38);
  ellipse(myX,myY+((height/2)/9),(width/2)/20,(height/2)/15);
  ellipse(myX-(width/2)/20,myY+((height/2)/10),(width/2)/20,(height/2)/15);
  ellipse(myX+(width/2)/20,myY+((height/2)/10.5),(width/2)/20,(height/2)/15);
  fill(255,255,255);
  ellipse(myX,myY+((height/2)/9),(width/2)/25,((height/2)*4)/75);
  ellipse(myX-(width/2)/20,myY+((height/2)/10),(width/2)/25,((height/2)*4)/75);
  ellipse(myX+(width/2)/20,myY+((height/2)/10.5),(width/2)/25,((height/2)*4)/75);
  //nariz
  stroke(87,134,39);
  strokeWeight(5);
  fill(179,201,2);
  ellipse(myX,myY,(width/2)/4,(2*(height/2))/10);
  noStroke();
  fill(30,59,29);
  ellipse(myX-(width/2)/20,myY,(width/2)/25,(width/2)/15);
  ellipse(myX+(width/2)/20,myY,(width/2)/25,(width/2)/20);
  }
}



