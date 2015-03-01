


float mida = 50;

void setup() {

  size(255, 255);
}


void draw() {
  
  background(20,40,mouseY);
  
  
  //SOL
  fill(255,mouseY,3);
  
  ellipse(mouseY,mouseX,mouseX,mouseX);
    
  //Terra
  fill(7,random(224),random(224));
  
  ellipse(mouseX,mouseY,mida,mida);
  
  
  //Lluna
  fill(mouseX);
  
  ellipse(mouseX-30,mouseY-30,mida/2.5,mida/2.5);
  
 
}

