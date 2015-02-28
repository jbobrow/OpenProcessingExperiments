
void setup()
{
size(400, 400);
noStroke();
background(0);
rectMode(CENTER);
}
//angulos de rotacion para cada cuadrado - rojo, amarillo, blanco
float angulo = 0.0;
float angulo2 = 0.0;
float angulo3 = 0.0;

void draw()
{
  fill(0, 15);
  rect(width/2, height/2, width, height);//para que de transparencia

  pushMatrix();
    angulo = angulo + 0.05;
    translate(mouseX,mouseY);//que siga al mouse
    rotate(angulo);
    fill(255, 0, 0, 50);
    noStroke();
    rect(-25, -25, 50, 50);//sigue al mouse
    rect(width + (-mouseX - 150), height + (-mouseY - 150), 50, 50);// gira alrededor
    stroke(255, 0, 0);
    line(-25, -25, width + (-mouseX - 150), height + (-mouseY - 150)); //une los 2 cuadrados
  popMatrix();

  pushMatrix();
    angulo3 = angulo3 - 0.03;
    translate(mouseX,mouseY);
    rotate(angulo3);
    fill(255, 255, 0, 50);
    noStroke();
    rect(-25, -25, 40, 40);
    rect(width + (-mouseX - 180), height + (-mouseY - 180), 40, 40);
    stroke(255, 255, 0);
    line(-25, -25, width + (-mouseX - 180), height + (-mouseY - 180)); 
  popMatrix();


  pushMatrix();
    angulo2 = angulo2 + 0.0175;
    translate(mouseX, mouseY);
    rotate(angulo2);
    fill(255, 200);
    noStroke();
    rect(0, 0, 30, 30);
  popMatrix();

}

