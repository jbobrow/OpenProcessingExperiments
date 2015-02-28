
//Xavier Espadaler
//practica 4
//2n de GEDI

 
int numBoles = 30;
 
//Fem una matriu de posicionsX amb "numBoles" elements:
float[] posicionsX = new float[numBoles];
//fem el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//fem matriu de velocitatsX:
float[] velocitatsX = new float[numBoles];
//fem el mateix per velocitatsY:
float[] velocitatsY = new float[numBoles];
// i per color
color[]colorpilota=new color [numBoles];
 
void setup(){
  size(400,400);
  
  //Donem posicions i velocitats
  for(int i = 0; i<numBoles; i++){
    posicionsX[i] = random(width/2-150, width/2+150);
    posicionsY[i] = random(width/2-150, width/2+150);
    
  // Les velocitats de les boles al atzar entre 1 i 5
    velocitatsX[i] = random(1,5);
    velocitatsY[i] = random(1,5);
    colorpilota[i] = color(random(250), random(5), random(5));
  }
   
}
 
void draw(){
  background(10,208,255);
  //Bucle
  for(int i = 0; i<numBoles; i++){
    //Noves posicions aleatories, les boles tindran una variació entre 8 i -8
    posicionsX[i] += random(-8,8);
    posicionsY[i] += random(-8,8);
  
    //Comprobem limits

    if((posicionsY[i]<0)||(posicionsY[i]>height)){
      velocitatsY[i] = -velocitatsY[i];
    }
   
   //Donem nom i posició al dibuix del pollet
   
    stroke(0);
    strokeWeight(1);
    
    fill(255,231,8);
    //Cap del pollet
    ellipse(posicionsX[i],  posicionsY[i], 50, 50);
    
    fill(255);
    //Ulls del pollet
    ellipse(posicionsX[i]-15.5,  posicionsY[i]-8, 20, 20);
    ellipse(posicionsX[i]+15.5,  posicionsY[i]-8, 20, 20);
    
    fill(0);
    //Pupil.les del polleet
    ellipse(posicionsX[i]-8.5,  posicionsY[i]-8, 5, 5);
    ellipse(posicionsX[i]+8.5,  posicionsY[i]-8, 5, 5);

    fill(255,126,5);  
    //Bec del pollet
    arc(posicionsX[i],  posicionsY[i]+1, 10, 20, 0.08, 3.06);
    
     
  }
}
 
void mousePressed(){
 

}

