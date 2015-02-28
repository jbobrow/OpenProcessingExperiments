
float tam;
float colR;
float colG;
float colB;


void setup() {
  size(400,400);
  smooth();
  background(255);
  noStroke();
  
  fill(0);
  text("click = dots", 15, 30); 
  text("press 'c' = clear canvas", 15, 50);
}

void draw () {  
  tam=random(10,100);
  colR=random(0,255);
  colG=random(0,255);
  colB=random(0,255);

  if (keyPressed && key == 'c') { // si apreto "c" clear+cambio fondo
    background(colR,colG,colB);
  } 

}

void mousePressed() {
  fill(colR,colG,colB);
  ellipse(mouseX,mouseY,tam,tam);
}









