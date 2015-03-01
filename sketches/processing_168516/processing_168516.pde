
float pX = 300;
float pY = 300;
float vX = random(-2,7);
float vY = random(-2,7);
int tam = 25;
float radio = tam/2;
void setup(){
  size(600,600);
}

void draw(){
 fill(255,3);
  rect(0,0,600,600);

  pX = pX + vX;
  pY = pY + vY;

  if ((pX >= width - radio)|| (pX < + radio)) { 
    vX = -vX;
  } 
  if ((pY >= height - radio)|| (pY < + radio)) { 
    vY = -vY;
  } 
  fill(random(255),random(255),50);

  ellipse(pX, pY, tam, tam);
  ellipse(pY, pX, tam, tam);
  
  
  
  
}

void mousePressed(){
  fill(random(255),random(255),random(255));
  
  
  
  vX = random(-20,20);
  vY = random(-20,20);
  //fill(random(255),random(255),random(255));
 pX = mouseX;
 pY = mouseY; 
  
}


