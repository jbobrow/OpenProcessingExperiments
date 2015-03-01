
float pX = 200;
float pY = 140;
float vX = random(-5, 5);
float vY = random(-5, 5);
float tam =50;


void setup() {
  size(400, 300);
}


void draw() {
  background(16,18,98);
  
 stroke (255);
 line(20,20,20,280);
 line(20,280,380,280);
 line (380,280,380,20);
 line (380,20,20,20);
  

  pX = pX + vX;
  pY = pY + vY;
  tam=pY/3+vY/3;

  if ((pX+(tam/2)+20 >= width)|| (pX-(tam/2)-20 < 0)) { //garantiza que no se salga al lado derecho ni izquierdo
    vX = -vX;
  } 
  if ((pY+(tam/2)+20 >= height)|| (pY-(tam/2)-20 < 0)) { 
    vY = -vY;
  } 
  

noStroke();



if (pX > width/2) {
  ellipse(pX, pY, tam, tam);
}
  else {
    rect (pX-tam/2,pY-tam/2,tam,tam);
  }
  
  

  if (pX < width/3) {
    fill(178, 203, 232);
  } else if (pX < 2*(width/3)) {//dos tercios
    fill(94,155,227);
  } else {
    fill(7, 108, 220);
  }
 }
   

void mousePressed() {
  


  vX = random(-5, 5);
  vY = random(-5, 5);
  
  pX = mouseX;
  pY = mouseY;
  
}

















