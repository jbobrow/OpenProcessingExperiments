
void setup()
{
  size(800,800);
  smooth();
  frameRate (30);
}

void draw()
  {
background (250, 240, 80); 
  fill(0);
  text("("+mouseX+" , "+mouseY+")",15,15); // Escriu el text (Coordenada-X, coordenada-Y) en pantalla en la posició 15,15
  
  //RANA

{

  //Cuerpo
  strokeWeight(2);
  fill(#3BCB29);
  
  //Piernas
  beginShape(); //izquierda
  curveVertex(mouseX+100, mouseY+50); 
  curveVertex(mouseX+100, mouseY+50);
  curveVertex(mouseX-220, mouseY+50);
  curveVertex(mouseX-100, mouseY+250);
  curveVertex(mouseX-100, mouseY+250);
  endShape();
  
  beginShape(); //derecha
  curveVertex(mouseX+90, mouseY+50); 
  curveVertex(mouseX+90, mouseY+50);
  curveVertex(mouseX+210, mouseY+50);
  curveVertex(mouseX+90, mouseY+250);
  curveVertex(mouseX+90, mouseY+250);
  endShape();
  
  //Patas
  ellipse (mouseX-100, mouseY+230, 120, 90); 
  ellipse (mouseX+90, mouseY+230, 120, 90);

  ellipse (mouseX-5, mouseY+90, 300, 240); //barriga
  fill (#91F71E);
  ellipse (mouseX-5, mouseY+90, 200, 220); //centro barriga
  fill (#3BCB29);
  ellipse (mouseX-5, mouseY-100, 300, 200); //cabeza
 
 
 //Nariz
  strokeWeight (5);
  point (mouseX-17, mouseY-130);
  point (mouseX-6, mouseY-130);
 
 
   //Boca

  if (mousePressed == false) //Si el mouse no està apretat la boca és la normal
  { 
  strokeWeight (3);
  noFill();
  curve (mouseX-5, mouseY-300, mouseX-80, mouseY-80, mouseX+55, mouseY-80, mouseX-5, mouseY-300);
  }
 
  if (mousePressed == true)  //Si el mouse està apretat s'obre la boca
  {
  strokeWeight (3);
  fill(#AD0A51);
  curve (mouseX-5, mouseY-300, mouseX-80, mouseY-80, mouseX+55, mouseY-80, mouseX-5, mouseY-300);
  curve (mouseX-5, mouseY+100, mouseX-80, mouseY-80, mouseX+55, mouseY-80, mouseX-5, mouseY+100);
  }
 
 
  //Ojos
  strokeWeight (2);
  fill (255);
  ellipse (mouseX-70, mouseY-200, 100, 100);
  ellipse (mouseX+55, mouseY-200, 100, 100);
  
  fill(0);
    ellipse (mouseX-70, mouseY-200, 30, 30);
    ellipse (mouseX+55, mouseY-200, 30, 30);
  
}

}
