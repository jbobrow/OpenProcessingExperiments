
// Ainoa Abella Garcia - 2n GEDI- Grup 02

int numBoles = 10; // nombre d'elements que volem a la finestra

//creem una matriu de posicionsX con "numBoles" elements:
float[] posicionsX = new float[numBoles];
//el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//i per velocitatsX:
float[] velocitatsX = new float[numBoles];
//i velocitatsY:
float[] velocitatsY = new float[numBoles];

//definim lo estàtic
void setup(){
  size(500,500);
  frameRate(30);
  //inicialitzem posicions i velocitats:
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = int(random(10,width-100));
    posicionsY[i] = int(random(51,width-45));
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }
  noStroke();
}
// definim lo que té moviment
void draw(){
  //fons estàtic per a que no es vegui el recorregut dels cupcakes al moure's
 background(255,219,247);
noFill();
smooth();
noStroke();
// definim variables per a realitzar el fons quadriculat
int total= 100;
float m=width/total;
float d=width/total;
float mida = m/2;
float cx=mida;
float cy=mida;
boolean rosafort = true;
//si la primera la volem rosa fort true, si no la volem  posem false
for(int j=0; j<total; j++){
  
//creem tota la  fla de rectangles
for(int i=0; i<total; i++){
 
  if(rosafort == true){
    fill(255,142,231);
    rosafort = false;
}
  rect(cx,cy,m,m);
  cx = cx + d + 9;  
}
cy= cy + d + 9;
cx = mida;
}


 //iniciem un bucle perquè¨ faci les mateixes accions a tots els valors de les matrius
  
  //actualitzem posicions
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] += velocitatsX[i];
    posicionsY[i] += velocitatsY[i];


    //comprobem límits de la posició  X
    if((posicionsX[i]<10)||(posicionsX[i]>width-100)){
      velocitatsX[i] = -velocitatsX[i];
    } 
    //comprobem límits de la posició Y
    if((posicionsY[i]<51)||(posicionsY[i]>width-45)){
      velocitatsY[i] = -velocitatsY[i];
    } 



  //dibuixem el cupcake:
   // El cupcake l'he agafat de la companya Alejandra Martí (demanant-li previament).
   //Perfil de la base del cupcake. Lo he hecho a traves de vértices.

  beginShape();
  vertex(posicionsX[i],posicionsY[i]);
  vertex(posicionsX[i]+25,posicionsY[i]+45);
  vertex(posicionsX[i]+75,posicionsY[i]+45);
  vertex(posicionsX[i]+100,posicionsY[i]);
  vertex(posicionsX[i],posicionsY[i]);
  endShape();
//color y forma de la magdalena del cupcake.Elipse.
  fill(155,90,11);
  ellipse(posicionsX[i]+50,posicionsY[i],100,25);
//color y superficie del cupcake.Círculos.
  fill(253,255,173);
  ellipse(posicionsX[i]+10,posicionsY[i]-10,30,30);
  ellipse(posicionsX[i]+25,posicionsY[i]-20,30,30);
  ellipse(posicionsX[i]+25,posicionsY[i]-15,30,30);
  ellipse(posicionsX[i]+40,posicionsY[i]-30,30,30);
  ellipse(posicionsX[i]+90,posicionsY[i]-10,30,30);
  ellipse(posicionsX[i]+75,posicionsY[i]-20,30,30);
  ellipse(posicionsX[i]+60,posicionsY[i]-30,30,30);
  ellipse(posicionsX[i]+50,posicionsY[i]-40,30,30);
  ellipse(posicionsX[i]+50,posicionsY[i]-20,30,30);
  ellipse(posicionsX[i]+40,posicionsY[i]-10,30,30);
  ellipse(posicionsX[i]+60,posicionsY[i]-10,30,30);
//diferentes adornos del cupcake. Círculos.
  fill(252,25,113);
  ellipse(posicionsX[i]+40,posicionsY[i]-40,25,25);
  fill(255);
  ellipse(posicionsX[i]+38,posicionsY[i]-42,8,8);
//bolitas de color verde
  fill(28,252,25);
  ellipse(posicionsX[i]+5,posicionsY[i]-10,5,5);
  ellipse(posicionsX[i]+25,posicionsY[i]-15,5,5);
  ellipse(posicionsX[i]+75,posicionsY[i]-20,5,5);
  ellipse(posicionsX[i]+55,posicionsY[i]-50,5,5);
//bolitas de color azul
  fill(0,250,255);
  ellipse(posicionsX[i]+15,posicionsY[i]-20,5,5);
  ellipse(posicionsX[i]+65,posicionsY[i]-40,5,5);
  ellipse(posicionsX[i]+100,posicionsY[i]-5,5,5);
  ellipse(posicionsX[i]+55,posicionsY[i]-8,7,5);
//bolitas de color rosa
  fill(255,3,230);
  ellipse(posicionsX[i]+85,posicionsY[i]-15,5,5);
  ellipse(posicionsX[i]+50,posicionsY[i]-20,5,5);
  ellipse(posicionsX[i]+17,posicionsY[i],5,5);
//bolitas de color rojo
  fill(255,0,0);
  ellipse(posicionsX[i]+80,posicionsY[i]+3,5,5);
  ellipse(posicionsX[i]+40,posicionsY[i]-8,5,5);
  ellipse(posicionsX[i]+70,posicionsY[i]-30,5,5);
  ellipse(posicionsX[i]+20,posicionsY[i]-32,5,5); 

  }
}

//per reiniciar la funció
void mousePressed(){
  //reinicialitzem les velocitats:
  for(int i = 0; i<numBoles; i++){
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }
}




  





