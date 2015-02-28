

//Dibuix de varios peixos random walker (tants com es vulgui)
//rebota a les parets pels seus extrems
//el peix pot ser més gran o més petit en funció del parámetre a
//quan fas clik el peix que tu vulguis (esculls quin num. és)
//va al punt on has clicat (excepte si fas click massa prop del 
//extrem que es separa una mica per a capiguer-hi)
//en funció de la posició del peix escollit el fons canvia de color 

//Max Milà (programa realitzat en col·laboració amb Nil Vidal)




int numDibuixos = 5;

int a1,b,c,d;
//variable per a controlar la mida del peix
int a=10;
//variable que controla el nombre de peixos (posada aquí per a que es pugui fer servir fora del for)
int i;

//valor de i del peix controlat (ha de ser entre 0 i "i") i el valor del color de fons
int peixControlat;
color colorback;


//matriu

float[] posicionsX =new float[numDibuixos];
float[] posicionsY= new float[numDibuixos];
float[] velocitatsX= new float[numDibuixos];
float[] velocitatsY= new float [numDibuixos];

void setup(){
  size(1000,600);
  colorback=color(0,116,255);
   //inicialitzem posicions i la i
  for(int i = 0; i<numDibuixos; i++){
    posicionsX[i] = width/2;
    posicionsY[i] = height/2;
    velocitatsX[i]= random(-a1,b);
    velocitatsY[i]= random(-c,d);
         //determinem a, b, c i d 
  a1= 10;
  b= 10;
  c=10;
  d=10;  
  
  peixControlat=2;
  
    

  }
}



void draw(){
  background(colorback);
 

  //iniciem un bucle perquÃ¨ faci les mateixes accions
  //a tots els valors de les matrius
  for(i = 0; i<numDibuixos; i++){
 

    //actualitzem posicions
     posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];
    
   
    //comprobem limits X
    if(((posicionsX[i]-8*a)<=0)||((posicionsX[i]+6*a)>=width)){
      velocitatsX[i]= -velocitatsX[i];
    } 
    else{
     velocitatsX[i]= random(-a1,b);
    }
    
    //comprobem limits Y
  
    if(((posicionsY[i]-4*a)<=0)||((posicionsY[i]+4*a)>=height)){
      velocitatsY[i] = -velocitatsY[i];
    }
   else{
     velocitatsY[i]= random(-c,d);
   }
    
  

 
  
   //i dibuixem
   // ellipse(posicionsX[i],posicionsY[i],5,7);
//control de la mida dels peixos
   
  
  fill(0,255,249);
  
    
   triangle(posicionsX[i]-8*a,posicionsY[i]-3*a,posicionsX[i]-8*a,posicionsY[i]+3*a,posicionsX[i]-5*a,posicionsY[i]); //aleta posterior
 
   triangle(posicionsX[i],posicionsY[i]-3*a,posicionsX[i]-2*a,posicionsY[i]-2*a,posicionsX[i]-2*a,posicionsY[i]-4*a); //aleta dorsal
    
    
   ellipse(posicionsX[i],posicionsY[i],12*a,6*a); //cos
    
   triangle(posicionsX[i],posicionsY[i]+a,posicionsX[i]-2*a,posicionsY[i],posicionsX[i]-2*a,posicionsY[i]+4*a); //aleta lateral
    
   arc(posicionsX[i]+3*a,posicionsY[i],4*a,4*a,3*PI/5,PI); //branquia
   arc(posicionsX[i]+3*a,posicionsY[i],3*a,3*a,3*PI/5,PI); //branquia petita
    
    
   fill(255,255,0); //ull
   ellipse(posicionsX[i]+3*a,posicionsY[i]-a,a,a);
   fill(0); //pupila
   ellipse(posicionsX[i]+3*a,posicionsY[i]-a,a/3,a/3);
   }
   
    //canvi color fons en funció del quadrant
if((posicionsY[peixControlat]<=height/2)&&(posicionsX[peixControlat]<=width/2)){
  colorback=color(0,116,255);
  }
    
  if((posicionsY[peixControlat]<=height/2)&&(posicionsX[peixControlat]>=width/2)){colorback=color(0,249,255);
  }
   
  if((posicionsY[peixControlat]>=height/2)&&(posicionsX[peixControlat]<=width/2)){colorback=color(0,255,142);
  }
   
  if((posicionsY[peixControlat]>=height/2)&&(posicionsX[peixControlat]>=width/2)){colorback=color(0,168,255);
  }
}



void mousePressed()
{
  posicionsX[peixControlat] = mouseX;
  posicionsY[peixControlat] = mouseY;
  
  if(mouseX<8*a){
     posicionsX[peixControlat] = mouseX+8*a;
   }
   if (mouseY<4*a){
     posicionsY[peixControlat] = mouseY+4*a;
    }  
   if (mouseX>width-8*a){
     posicionsX[peixControlat] = mouseX-8*a;
   }
   if (mouseY>height-4*a){
     posicionsY[peixControlat] = mouseY-a*a;
   }

}

