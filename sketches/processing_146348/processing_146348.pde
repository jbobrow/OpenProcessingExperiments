
//Nasim Nounou practica 4 llas gallinas asustadas porq se comen su huevo,
//si clickas descubriras quein es la madre del huevo
int a = 10;
int b = 10;
int Galli = 5;
int i;

/////Matriz de posiciones "x" y "y" de las gallinas
float[] posX = new float[Galli];
float[] posY = new float[Galli];
//Matriz de colores de las gallinas
color[] colorGalli = new color[Galli];

void setup(){
  size(600,600);//width, height
  //Determinar posiciones iniciales y colores:
  for(int i=0; i<Galli; i++){ //Si "i" es mes petit que "Galli", se li suma 1.
    posX[i] = (posX[i]+width/2)+(int)random(-20,20); //Posicio X inicial
    posY[i] = (posY[i]+height/2)+(int)random(-20,20); //Posicio Y inicial
    colorGalli[i] = color(random(251),random(188),random(0)); //Color del cuerpo random pera cada gallina.

  
}
}
  
void draw(){
background(255);
//Determinar el bucle para que se repitan las acciones a todas las matrices:
  for(int i=0; i<Galli; i++){
    //Redeterminar las posiciones iniciales:
    posX[i] += random(-20,20);
    posY[i] += random(-20,20);
 
    //Determinar los limites para que reboten las gallina:
    //en X:
    if(posX[i]<2*a){
      posX[i] = a*2;
    }
    if(posX[i]>width-9*a/2){
      posX[i] = width-9*a/2;
    }
    //en Y:
    if(posY[i]<2*a){
      posY[i] = a*2;
    }
    if(posY[i]>height-2*a){
      posY[i] = height-2*a;
    }

 strokeWeight(1);
  stroke(1);
fill(255);
   ellipse(posX[i]-50,posY[i]-10,30,30);

   ellipse(posX[i]+50,posY[i]-10,30,30);
  
ellipse(posX[i],posY[i],100,100);
fill(234,5,5);
ellipse(posX[i],posY[i]-50,30,50);
fill(234,143,5);
ellipse(posX[i],posY[i]+10,30,50);
fill(0);
ellipse(posX[i],posY[i]+10,25,40);

fill(0);
ellipse(posX[i]-20,posY[i]-20,15,25);
ellipse(posX[i]+20,posY[i]-20,15,25);
fill(255);
ellipse(posX[i]-20,posY[i]-20,10,10);
ellipse(posX[i]+20,posY[i]-20,10,10);
fill(5,190,234);
ellipse(posX[i]-20,posY[i]-8,10,10);
ellipse(posX[i]-22,posY[i]+10,10,10);
ellipse(posX[i]-20,posY[i]+40,10,10);
ellipse(posX[i]+23,posY[i]+45,10,10);
ellipse(posX[i]+23,posY[i]+15,10,10);
ellipse(posX[i]+23,posY[i]-8,10,10);
ellipse(posX[i],posY[i]+60,80,20);
fill(255,0,0);
rect(posX[i]-60,posY[i]-90,10,50);
ellipse(posX[i]-55,posY[i]-25,15,15);


//huevo y sarten

fill(255);
stroke(0);
strokeWeight(1);
ellipse(mouseX,mouseY,40,60);
fill(72,72,72);
rect(mouseX+40,mouseY+20,40,5,5);
rect(mouseX-30,mouseY+20,80,12,2);
fill(129,87,1);
rect(mouseX+75,mouseY+20,40,7,7);



  }

}
//funcions amb el mause
void mousePressed(){
  fill(255,0,0);
  //aparecen más exclamaciones en la gallina madre
rect(posX[i]+60,posY[i]-90,10,50);
ellipse(posX[i]+55,posY[i]-25,15,15);

rect(posX[i]+40,posY[i]-90,10,50);
ellipse(posX[i]+35,posY[i]-25,15,15);

rect(posX[i]-40,posY[i]-90,10,50);
ellipse(posX[i]-35,posY[i]-25,15,15);

}



