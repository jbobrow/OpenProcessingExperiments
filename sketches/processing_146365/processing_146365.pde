
//Pràctica 4
//Gemma MIER - Grup 02 GEDI
//25 Smileys de diferents colors reboten per tot arreu
//A més, cada cop que fem "click" sobre la pantalla, les cares canvien de mida fins a un cert punt, la velocitat varia i el fons canvi de color sempre i quan cliquem el cursor



//Declarem les variables del programa "a", "b" i "numCaretes"
int a = 20;// "a" = diàmetre de les caretes
int b = 5; // "b" = diàmetre dels ulls
int numCares = 25; // "numCares" = numero de caretes que volem que apareguin a la pantalla

//Es crea una matriu per les posicions X i Y amb "numCares" elements
float [] posX = new float[numCares];
float [] posY = new float[numCares];

//Fem el mateix per les velocitats X i Y
float [] velX = new float [numCares];
float [] velY = new float [numCares];

//Fem que les caretes tinguin el seu propi color 
color [] colorcares = new color [numCares];


//Inicialització del programa
void setup (){
  size (400,400);
  background (79,77,224);
  
  //Determinem les posicions i velocitats de les cares utilitzant abreviatures i++ per i = i+1
  for (int i = 0; i<numCares; i++){
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random (1,2);
    velY[i] = random (1,2);
    colorcares[i] = color(random(255), random (255), random(255));
  }
  
}


void draw(){
  
  if(mousePressed){background(245,45,80);}
  else {background(79,77,224);}
  //cada cop que es cliqui amb el mouse dins la pantalla, el fons canvi de color sempre i quan l'aguantem
  //si el deixem anar, es torna negre
 
  
  //Inicialització del bucle perquè repeteixi les mateixes accions en tots els valors integrats dins la matriu
  for(int i = 0; i<numCares; i++){
    
    posX[i] += velX [i];
    posY[i] += velY [i];
  
    
    //determinem els limits de X i de Y (les caretes no han de sortir de la pantalla)
    if((posX[i] < a/2 ) || (posX[i] > width - (a/2) )){
      velX[i] = -velX[i];
    } 
    if((posY[i] < a/2 ) || (posY[i] > height - (a/2) )){
      velY[i] = -velY[i];
    }
    
    //Dibuixem: Smileys
    fill(colorcares[i]);
    noStroke();
    ellipse(posX[i],posY[i],a,a);
    fill(0);
    ellipse(posX[i]-5,posY[i]-5,3,3);
    ellipse(posX[i]+5,posY[i]-5,3,3);
    arc(posX[i],posY[i],10,10,0,PI);
    
}
}

   
    
void mousePressed(){ //cada cop que farem "click" en el ratolí, les cares canviaren de mida i la velocitat variarà
  for(int i = 0; i<numCares; i++){
    velX[i] = random(2,8);
    velY[i] = random(2,8);
  }
  
  if(a<60){
    a = a+5;
  }
  
  if(a>=60){
    a = 30;
  }
}
    
    




