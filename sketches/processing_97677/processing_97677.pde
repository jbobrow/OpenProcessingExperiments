

//numero d abelles en el dibuix
int numAbella = 10; 
 
//Matriu de posicionsX amb el numero d elements
float[] posicionsX = new float[numAbella];
float[] posicionsY = new float[numAbella];
float[] velocitatsX = new float[numAbella];
float[] velocitatsY = new float[numAbella];
//definim la inicialitzacio part del dibuix 
void setup(){
  size(600,600);
  frameRate(50);
  
  //definim les  posicions i les velocitats
  for(int i = 0; i<numAbella; i++){
    posicionsX[i] = int(random(width));
    posicionsY[i] = int(random(height));
    velocitatsX[i] = random(10,10);
    velocitatsY[i] = random(10,10);
  }noStroke();}
// definim la part que esta en moviment del dibuix
void draw(){
  
  
  //definicio del fons del dibuix per evitar que quedi marcada la trajectoria dels elements
 background(64,183,255);
noFill();
smooth();
noStroke();





// Quadrats del fons del dibuix
int total= 22;
float m=width/total;float d=width/total;
float mida = m/2;float cx=mida;float cy=mida;boolean b = true;

//inicialitzacio de la abella
for(int j=0; j<total; j++){
   
//quadrats del fons amb la funcio rectangle
for(int i=0; i<total; i++){ if(b == true){
    fill(4,113,142);
    b = false;}rect(cx,cy,m,m);cx = cx + d + 50; }cy= cy + d + 50;cx = mida;}
 
 
 //per tal que es repeteixi el mateix a cada element
   
  //actualitzacio de les posicions de les abelles
  for(int i = 0; i<numAbella; i++){
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];

    if((posicionsX[i]<10)||(posicionsX[i]>width-100)){
      velocitatsX[i] = -velocitatsX[i];
    }

    if((posicionsY[i]<51)||(posicionsY[i]>width-45)){
      velocitatsY[i] = -velocitatsY[i];
    }
 
 
 
 
 
 

 
  //dibuix i forma de l element:


fill(10,60,130,80); noStroke();
  ellipse(posicionsX[i]-27,posicionsY[i]-5,width/15,height/15);ellipse(posicionsX[i]+25,posicionsY[i]-5,width/15,height/15);
  ellipse(posicionsX[i]-27,posicionsY[i]+10,width/15,height/15);ellipse(posicionsX[i]+25,posicionsY[i]+10,width/15,height/15);


  fill(223,255,18);
  ellipse(posicionsX[i],posicionsY[i],width/12,height/9);

  stroke(1);
   
  //forma de la punta de les antenes
  ellipse(posicionsX[i]-19,posicionsY[i]-45,width/90,height/80);ellipse(posicionsX[i]+16,posicionsY[i]-45,width/90,height/80);
   
   
  //color dels ulls i i forma de les antenes
  line(posicionsX[i]-11,posicionsY[i]-33,posicionsX[i]-19,posicionsY[i]-45);
  line(posicionsX[i]+10,posicionsY[i]-33,posicionsX[i]+16,posicionsY[i]-45);
  fill(255);ellipse(posicionsX[i]-5,posicionsY[i]-18,width/80,height/80);
  ellipse(posicionsX[i]+5,posicionsY[i]-18,width/80,height/80);
   
   
  // marques del cos
  strokeWeight(2);
  line(posicionsX[i]-25,posicionsY[i],posicionsX[i]+25,posicionsY[i]);
  line(posicionsX[i]-24,posicionsY[i]+10,posicionsX[i]+23,posicionsY[i]+10);
  line(posicionsX[i]-21,posicionsY[i]+20,posicionsX[i]+20,posicionsY[i]+20);
  }
}

 
//reinici de les funcions
void mousePressed(){
  //reinici de les velocitats:
  for(int i = 0; i<numAbella; i++){
    velocitatsX[i] = random(7,10);
    velocitatsY[i] = random(7,10);
  }
}



