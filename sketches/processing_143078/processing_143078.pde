


void setup(){
  size(800,800);
  background(242,171,233);

}

void draw(){
  
  background(242,171,233);
  
  //Elipses que representen els monyetes
  stroke(0);
  fill(0);
  ellipse(mouseX-36,mouseY-22,32,32);
  ellipse(mouseX+36,mouseY-22,32,32);
  
  //Elipses que fan de gomes
  stroke(0);
  fill(255,0,0);
  ellipse(mouseX-24,mouseY-13,27,27);
  ellipse(mouseX+24,mouseY-13,27,27);
  
  //Piernas
  fill(0);
  rect(mouseX-14,mouseY+50,12,16);
  rect(mouseX+2,mouseY+50,12,16);
  ellipse(mouseX-8,mouseY+66,12,12);
  ellipse(mouseX+8,mouseY+66,12,12);
  
  //Manos
  strokeWeight(3);
  fill(252,244,222);
  ellipse(mouseX-25,mouseY+46,11,11);
  ellipse(mouseX+25,mouseY+46,11,11);
  
  //Vestido 
  stroke(0);
  strokeWeight(3);
  fill(255,0,0);
  triangle(mouseX,mouseY+10,mouseX-20,mouseY+50,mouseX-30,mouseY+42);
  triangle(mouseX,mouseY+10,mouseX+20,mouseY+50,mouseX+30,mouseY+42);
  triangle(mouseX,mouseY-20,mouseX+20,mouseY+50,mouseX-20,mouseY+50);
 
  //Elipse que representa el cabell.
  stroke(0);
  fill(0);
  ellipse(mouseX,mouseY-3,70,55);
  
  //Elipse que representa la cara blanca.
  stroke(0);
  strokeWeight(3);
  fill(252,244,222);
  ellipse(mouseX,mouseY,65,50);
  
  //Arcos que representan las cejas
  strokeWeight(2);
  stroke(0);
  fill(252,244,222);
  arc(mouseX-20,mouseY-8, 20, 20,PI+8*PI/18, 2*PI-PI/4); 
  arc(mouseX+20,mouseY-8, 20, 20,PI+PI/4,PI+9*PI/18); 
  
  //Lineas que representan los ojos
  line(mouseX-25,mouseY-5,mouseX-10,mouseY);
  line(mouseX+25,mouseY-5,mouseX+10,mouseY);
  
  //Arco que hace de boca
  fill(252,244,222);
  arc(mouseX,mouseY+12,7,7,0,PI);
  
  //Elipses mejillas sonrojadas
  stroke(240,155,155);
  strokeWeight(1);
  fill(240,155,155);
  ellipse(mouseX-17,mouseY+11,7,7);
  ellipse(mouseX+17,mouseY+11,7,7);  
  
}
