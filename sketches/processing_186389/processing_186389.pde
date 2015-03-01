

//declaració variables
int cX;
int cY;
float segons;
float minuts;
float hores;

int totalGelats = 59;
float[] bolesX = new float[totalGelats];
float[] bolesY = new float[totalGelats];
float [] midaBoles = new float[totalGelats];
color [] colorBoles = new color [totalGelats];


 
void setup() {
  size(700, 400);
  for (int i = 0; i< totalGelats; i++) {
    bolesX[i] = int(random(width));
    bolesY[i] = int(random(height));
    midaBoles[i] = int(4);
    colorBoles[i] = color(random(0, 255), random(0, 255), random(0, 255));

  cX = width / 2;
  cY = height / 2;
   
  int radi = min(width, height) / 2;  
  segons = radi * 0.45;         
  minuts = radi * 0.5;
  hores = radi * 0.85;
          
  }
}
 
void draw() {
  background(110);
  
  fons();
  funcioHores();
  funcioMinuts();
  funcioSegons();
  
} 
 
 
 

///////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////FUNCIONS//////////////////////////////////////////////////
 
void fons (){
  
  noStroke();
   
  boolean sortidaSol = ((hour()>=6)&&(hour()<=8));
  boolean mati = ((hour()>8)&&(hour()<13));
  boolean tarda = ((hour()>13)&&(hour()<18));
  boolean postaSol = ((hour()>=18)&&(hour()<=20)); 

   
  //Cambio color fondo
  if (sortidaSol){
    background(#FFD089);
  }
 
  if (mati){
    background(#F5FFB4);
  }
 
 if (tarda){
    background(#FAE992);
  }
  
  if (postaSol){
    background(#FCBB52);
  }
    
  if ((!sortidaSol)&&(!tarda)&&(!mati)&&(!postaSol)) {
    background(#6689F0);
  }
}

  //HORES
void funcioHores (){

   int horaBase12=hour();          
   if (horaBase12>12) {
      horaBase12 = horaBase12-12; 
   }
   
  boolean amanecer = ((hour()>=6)&&(hour()<=8));
  boolean dia = ((hour()>8)&&(hour()<19));
  boolean atardecer = ((hour()>=19)&&(hour()<=20));
}

  //MINUTS
void funcioMinuts (){
  float minuts= minute();
  for (int i = 0; i< minuts; i++) {
    
   //gelats
    noStroke();
    fill(#B27B32);
    triangle(bolesX[i]-10, bolesY[i]+8,bolesX[i], bolesY[i]+40,bolesX[i]+10, bolesY[i]+8);
    stroke(#89693F);
    strokeWeight(1.5);
    line(bolesX[i]-10, bolesY[i]+8,bolesX[i]+4, bolesY[i]+23);
    line(bolesX[i]-6, bolesY[i]+22,bolesX[i]+2, bolesY[i]+31);
    line(bolesX[i]-2, bolesY[i]+8,bolesX[i]+6, bolesY[i]+16);
    line(bolesX[i]+8, bolesY[i]+8,bolesX[i]-5, bolesY[i]+26);
    
    noStroke();
    fill(colorBoles[i]);
    ellipse(bolesX[i], bolesY[i], midaBoles[i]+20, midaBoles[i]+20);
 
  }
 }

  //SEGONS
void funcioSegons (){
  
  float segundos =second()*segons/60; 

//figura nino
fill(#FA716D);
ellipse(cX, cY, 3*segundos, 2*segundos); 
ellipse(cX, cY+40, 3*segundos, 2*segundos);
fill(00);
ellipse(cX-20, cY, 3*segundos/8, 2*segundos/4);
ellipse(cX+20, cY, 3*segundos/8, 2*segundos/4);

}




