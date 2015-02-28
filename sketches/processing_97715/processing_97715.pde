
//declaració variables
int i,x;
int sz = 20; //mida pilota
int numMarieta = 10; //número de pilotes que reboten

//creem una matriu de posicionsX con "numMarieta" elements:
float[] posicionsX = new float[numMarieta];
//el mateix per posicionsY:
float[] posicionsY = new float[numMarieta];
//i per velocitatsX:
float[] velocitatsX = new float[numMarieta];
//i velocitatsY:
float[] velocitatsY = new float[numMarieta];


void setup(){
  background(176,240,20);
  strokeWeight(2);
  size(600,600);
  frameRate(30);
  //inicialitzem posicions i velocitats:
  for(int i = 0; i<numMarieta; i++){
    posicionsX[i] = int(random(width));
    posicionsY[i] = int(random(height));
    velocitatsX[i] = 10;
    velocitatsY[i] = 10;
  }

  //Línies verticals
  for(i=0; i<width; i+=width/10){
    stroke(0);
    line(i,0,i,height);
}

//Línies horitzontals
for(i=0; i<height; i+=height/10){
  stroke(0);
  line(0,i,width,i);
}

//Determinem un patro en l'eix Y i després en l'eix X per tal que quedi la pantalla plena de rectangles.
for(i=width/12; i<width; i+=width/5){
  for(x=height/12; x<height; x+=height/5){
    stroke(0);
    fill(random(150),random(250),random(20)); //cada cop que executi el programa canvia el color dels rectangles dins el random establert
    rect(i,x,width/30,width/30); //Figura de repetició
  }
}
}


void draw(){
  background(176,240,20); //repetim tot el fons perque no es repeteixin les pilotes.
  
  //Línies verticals
  for(i=0; i<width; i+=width/10){
    stroke(0);
    line(i,0,i,height);
}

//Línies horitzontals
for(i=0; i<height; i+=height/10){
  stroke(0);
  line(0,i,width,i);
}

//Determinem un patro en l'eix Y i després en l'eix X per tal que quedi la pantalla plena de rectangles.
for(i=width/12; i<width; i+=width/5){
  for(x=height/12; x<height; x+=height/5){
    stroke(0);
    fill(mouseX/2,random(250),random(20)); //cada cop que executi el programa canvia el color dels rectangles dins el random establert
    rect(i,x,width/30,width/30); //Figura de repetició
  }
}
  //iniciem un bucle perque faci les mateixes accions
  //a tots els valors de les matrius
  
  //actualitzem posicions
  for(int i = 0; i<numMarieta; i++){
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];


    //comprobem limits X
    if((posicionsX[i]<0)||(posicionsX[i]>width)){
      velocitatsX[i] = -velocitatsX[i];
    } 
    //comprobem limits Y
    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
    
  //dibuixem les pilotes
    
    fill(mouseX,mouseY,200); //canvia de color al moure el mouse
    ellipse(posicionsX[i],posicionsY[i],sz,sz);
  }
  
}


