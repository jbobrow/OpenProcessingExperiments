


int coloresTotal = 9;

color [] colores = new color[coloresTotal];

void setup(){
  
  size(600,600);
  background (0);
  
  frameRate(2);
  
  colores[0]=color( 219,210,210);
  colores[1]=color(144,140,140);
  colores[2]=color(219,44,44);
  colores[3]=color(231,23,232);
  colores[4]=color(231,23,232);
  colores[5]=color(23,232,206);
  colores[6]=color(148,232,23);
  colores[7]=color(232,184,23);
  colores[8]=color(232,90,23);
  
}
  void draw(){
    noStroke();
    
   

  
 
  
   
    
   fill(colores[0]);
   
  rect(10,100,50,400);
  
  fill(colores[1]);
  
  rect(70,100,50,400);
  
  fill(colores[2]);
  
  rect(130,100,50,400);
  
  fill(colores[3]);
  
  rect( 190,100,50,400);
  
  fill(colores[4]);
  
  rect (240,100,50,400);
  
  fill(colores[5]);
  
  rect (300,100,50,400);
  
  fill(colores[6]);
  
  rect (360,100,50,400);
  
  fill(colores[7]);
  
  rect (420,100,50,400);
  
  fill(colores[8]);
  
  rect (490,100,50,400);
  
  
  
  
   
if( mousePressed==true) { 
  fill(255);
   rect(10,100,600,400);
   
   
  
}
/*
if(mousePressed==false){
 
  fill(100,100,100,255);
  rect(10,100,600,400);
  
}
  
*/
  }

  

