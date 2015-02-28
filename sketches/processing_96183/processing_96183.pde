

void setup()//configuració de pàgina
{
  size(1500, 400); //mides generals
}

void draw()//iniciem la funció dibuix
{
  background(mouseX-240,mouseX-100, 200); //per fer que el color del background variï amb el moviment del ratolí i simuli el dia.
  stroke(5, 5,5);
  strokeWeight(1);
  fill(256, 256, 256);//figures dels núvols respecte les mesures incials
  ellipse(5*width/5.5, height/9.5, width/6, height/6.5);
  ellipse(5*width/6, height/10, width/8, height/8);
  ellipse(width/4, height/4, width/5, height/7);
  ellipse(width/3, height/3, width/3.5, height/6.5);
  ellipse(width/1.25, height/2, width/2, height/4);
  ellipse(width/0.5, height/2.75, width/1.5, height/3);
  //la figura de l'avió refernciada amb el ratolí
  arc(mouseX+100, mouseY+12, 50, 24, -3*PI/2, PI/2);
  triangle(mouseX-20, mouseY+4, mouseX-8, mouseY, mouseX-20, mouseY-20); 
  arc(mouseX, mouseY+12, 70, 24, -3*PI, PI/2);
  
  strokeWeight(1);
  rect(mouseX, mouseY, 100, 24);
  stroke(10, 100, 150);
  strokeWeight(5);
 // line(mouseX+5, mouseY+22, mouseX+20, mouseY+2);
 // stroke(247, 2, 11);
  //strokeWeight(5);
  line(mouseX+50, mouseY+22, mouseX+80, mouseY+2);
  strokeWeight(1);
  stroke(5);
  fill(2); //detalls de les finestretes de l'avió
  rect(mouseX+24, mouseY+8, 5, 5);
  rect(mouseX+32, mouseY+8, 5, 5);
  rect(mouseX+40, mouseY+8, 5, 5);
  rect(mouseX+48, mouseY+8, 5, 5);
  rect(mouseX+56, mouseY+8, 5, 5);
  rect(mouseX+64, mouseY+8, 5, 5);
  rect(mouseX+72, mouseY+8, 5, 5);
  rect(mouseX+80, mouseY+8, 5, 5);
  rect(mouseX+105, mouseY+5, 7.5, 9.5);
  fill(256); //ales en perspectiva
  rect(mouseX+48, mouseY+18, 26, 4);
  rect(mouseX-20, mouseY+6, 14, 5);
  
  noCursor(); //per tal que no aparegui la fletxeta del cursor
  
    
}



