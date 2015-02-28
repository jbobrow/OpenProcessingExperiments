
//Programa que va pintant la pantalla amb random walker i canvia el color si cliques

//definició de les variables:
int boling = 2;
int i;
int colorins;
float r=134;
float g=167;
float b=136;


//matriu per les posicions x i y i velocitats també dels elements
float[] posicionsX = new float[boling];
float[] posicionsY = new float[boling];
float[] velocitatsX = new float[boling];
float[] velocitatsY = new float[boling];



void setup(){
  size(700,700);
  background(255);
  
  //des d'on sortiràn els elements
  for(int i=0; i<boling; i++){
  println(i);
  posicionsX[i]= random (width/2, height/2)+(int)random(-50,50);
  posicionsY[i]= random (width/2, height/2)+(int)random(-50,50);
  velocitatsX[i]= random (1,3);
  velocitatsY[i]= random (1,3);
  } 
}


 

void draw(){
  // bucle que fa que es realitzin les mateixes accions per tots els valors de les matrius:
  for(int i=0; i<boling; i=i+1){
    //es canvien les posicions inicials:
    posicionsX[i] += random(-20,20);
    posicionsY[i] += random(-20,20);
  
  
   //fem la comprovació per si surt dels marges per X
  if(posicionsX[i]<20){
    posicionsX[i] = 20;
  }
  if(posicionsX[i]>width-20){
    posicionsX[i] =width-20;
  }
  
  //comprovació per si surt dels marges per Y
  if(posicionsY[i]<20){
    posicionsY[i] = 20;
  }
  if(posicionsY[i]>height-20){
    posicionsY[i]=(height-20);
  }
  
  //dibuix de l'element
  
  noFill ();
  strokeWeight(1);
  stroke(r,g,b,100);
  ellipse(posicionsX[i],posicionsY[i], 7, 7);
  ellipse(posicionsX[i],posicionsY[i], 15, 15);
  ellipse(posicionsX[i],posicionsY[i], 22, 22);
  }
}

void mousePressed(){
 r=random(255);
 g=random(255);
 b=random(255);
 }

 
 



