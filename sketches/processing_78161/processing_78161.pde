
// Echo por: Marc Cabañas Garcia 1ºASIX(TARDA)
// Tauler de Dibuix

// "q" = HACER QUADRADOS
// "w" = HACER REDONDAS
// "e" = LIMPIAR LA PANTALLA
// "z" = HACER UN MARCO
// "clic con el raton" = HACER REDONDAS DE OTRO COLOR I ARCOS
// "+" = AUMENTAR DE TAMAÑO LAS REDONDAS
// "-" = DISMINUIR DE TAMAÑO LAS REDONDAS

int tamany=32;

void setup()
{
  random (50,100);
  background(#FFFFFF);
 size(500,500);
 smooth();
 noStroke();
}
void draw(){

  if (key == 'e'){
  background(#FFFFFF);  
 
  }
 stroke(#000000);
 strokeWeight(1);
  fill(random(0,255),random(0,255),random(0,255));
  if (key=='q'){
    if (mousePressed == true){
    fill(random(0,255),random(0,255));
    rect(mouseX,mouseY,random(0,30),random(0,50));
    }
}
  
    else {
      
    if (key=='w');  
    if (mousePressed == true){
      fill(random(0,255),random(0,255));
      ellipse(mouseX,mouseY,tamany,tamany);
      ellipse(width-mouseX,height-mouseY,tamany,tamany);
      stroke(#4F206C);
      fill(random(0,255),random(0,255),random(0,255));
      bezier(mouseX,mouseY,mouseX+5,mouseY+5,width/5,height/5,255,tamany);
      bezier(width-mouseX,height-mouseY,mouseX+10,mouseY+10,width/5,height/5,255,tamany);
}
    
      
    if (mousePressed == false){
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(mouseX,mouseY,tamany,tamany);
      
    }    
//Aumentar tamaño de los ellipses
  if (keyPressed && key=='+'){
    tamany=tamany+1;
//Disminuir tamaño de los ellipses
  }else if (keyPressed && (key=='-')){
    tamany=tamany-1;
  }
      
    }
      
 // Marco
      
      if (key=='z'){
      stroke(random(0,255),random(0,255),random(0,255));
      strokeWeight(4);
      line(random(550,550),random(450,550),random(-650,650),random(450,450));
      line(random(-50,50),random(-50,50),random(50,550),random(0,50));
      line(random(-50,50),random(-50,50),random(-50,50),random(550,50));
      line(random(450,550),random(450,550),random(450,450),random(-650,550));
      
     
     
     
 }
 }


