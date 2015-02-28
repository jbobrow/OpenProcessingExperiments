
//Nasim Nounou practica 4 los pollos al rescate del huevo,
//los pollos iran alli donde este el huevo
int a = 10;
int b = 10;
int Pollos = 10;
int i;


//Matriz de posiciones de los pollos
int[] posX = new int[Pollos];
int[] posY = new int[Pollos];
//Matriz velocidades de los pollos
float[] velX = new float[Pollos];
float[] velY = new float[Pollos];


void setup(){
  size(1200,800);//width, height
  //Determinar posiciones y velocidades iniciales
  for(int i=0; i<Pollos; i++){ //Si "i" es más pequeño que "Pollos", se le suma 1.
    posX[i] = width/2; //Posicio X inicial
    posY[i] = height/2; //Posicio Y inicial.
    velX[i] = random(6); //Velocitat X inicial.
    velY[i] = random(10); //Velocitat Y inicial.
  }

}

void draw(){
  background(255);
  

  
  for(int i=0; i<Pollos; i++){
    //Redeterminar las posiciones iniciales:
    posX[i] += velX[i];
    posY[i] += velY[i];
 
    //limites para que reboten los "pollos":
    if((posX[i]<0+2*a)||(posX[i]>width-9*a/2)){
      velX[i] = -velX[i];
    }
    if((posY[i]<2*a)||(posY[i]>height-2*a)){
      velY[i] = -velY[i];
    }
    
    
//dibujo pollo

  strokeWeight(1);
  stroke(1);
fill(255);
ellipse(posX[i]-50,posY[i]-10,30,30);
ellipse(posX[i]-60,posY[i],60,30);
ellipse(posX[i]+50,posY[i]-10,30,30);
ellipse(posX[i]+60,posY[i],60,30);
ellipse(posX[i],posY[i],100,100);
fill(234,5,5);
ellipse(posX[i],posY[i]-50,30,50);
fill(234,143,5);
ellipse(posX[i],posY[i],20,30);
line(posX[i]-10,posY[i],posX[i]+10,posY[i]);
fill(0);
ellipse(posX[i]-20,posY[i]-20,15,25);
ellipse(posX[i]+20,posY[i]-20,15,25);
fill(255);
ellipse(posX[i]-20,posY[i]-20,10,15);
ellipse(posX[i]+20,posY[i]-20,10,15);
strokeWeight(3);
line(posX[i]-30,posY[i]-30,posX[i]-10,posY[i]-20);
line(posX[i]+30,posY[i]-30,posX[i]+10,posY[i]-20);
strokeWeight(7);
stroke(255);
line(posX[i]-30,posY[i]-36,posX[i]-10,posY[i]-26);
line(posX[i]+30,posY[i]-36,posX[i]+10,posY[i]-26);

//huevo
stroke(0);
strokeWeight(1);
ellipse(mouseX,mouseY,40,60);



  }
}

void mousePressed(){
  //posicion inicial de los pollos al lado del huevo
  for(int i = 0; i<Pollos; i++)
    posX[i] = mouseX;
    posY[i] = mouseY;
    
}


