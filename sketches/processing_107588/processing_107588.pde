
//gatito dinamico

//variables
float posX =0;
float posY = 0;
float prevposX = 0;
float prevposY = 0;
float tailposX = 0;
float tailposY = 0;



//gato pudin interactivo 1
void setup() {
  size(500, 500);
  smooth();
  frameRate(38);
  ellipseMode(CENTER);
  rectMode(CENTER);
}
//gato pudin
void draw() {
  background(0);
  //cuerpo del gatito
  fill(230);
  noStroke();
  rect(posX, posY, 60, 80);
  triangle(posX-30, posY-40, posX, posY-40, prevposX-30, prevposY-70);
  triangle(posX+30, posY-40, posX, posY-40, prevposX+30, prevposY-70);
  //boca de gatito
  strokeWeight(1);
  stroke(0);
  noFill();
  arc(posX, posY-15, 10, 10, 0, PI);
  //patas del gatito
  stroke(230);
  strokeWeight(3);
  line(posX-29, posY+40, prevposX-29, prevposY+60);
  line(posX+28, posY+40, prevposX+28, prevposY+60);
  //brazos del gatito
  line(posX-30, posY-10, prevposX-40, prevposY+20);
  line(posX+29, posY-10, prevposX+40, prevposY+20); 
  //cola de gatito
  strokeWeight(8);
  line(posX, posY+35, tailposX, tailposY+100);
  //ojos gatito
  noStroke();
  fill(129, 183, 180);
  ellipse(posX-15, posY-25, 20, 20);
  ellipse(posX+15, posY-25, 20, 20);
  //movimiento gatito
  if (dist(mouseX, mouseY, posX, posY)<50) {
    //ojos grandotes
    fill(129, 183, 180);
    ellipse(posX-15, posY-25, 25, 25);
    ellipse(posX+15, posY-25, 25, 25);
    //boca abierta
    strokeWeight(1);
    fill(0);
    arc(posX, posY-15, 10, 10, 0, PI);
  }
  if (dist(mouseX, mouseY, posX, posY)<50 && mousePressed) {
    //ojos de velocidad
    fill(230);
    ellipse(posX-15, posY-25, 26, 26);
    ellipse(posX+15, posY-25, 26, 26);
    fill(129, 183, 180);
    ellipse(posX-15, posY-25, 25, 10);
    ellipse(posX+15, posY-25, 25, 10); 
    //boca feliz
    strokeWeight(1);
    fill(0);
    arc(posX, posY-15, 40, 15, 0, PI);
    //lenguita
    strokeWeight(6);
    stroke(214, 132, 132);
    line(posX, posY-9, prevposX, prevposY-9);
    //asignación de variables
    posX = mouseX;
    posY = mouseY;
    prevposX = pmouseX;
    prevposY = pmouseY;
    tailposX = (tailposX * 0.8)+(mouseX*0.2);
    tailposY = (tailposY * 0.8)+(mouseY*0.2);
  }
}
