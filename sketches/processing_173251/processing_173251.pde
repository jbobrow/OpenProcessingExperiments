
//cabeza nave
float puntoCe = 247;
float nave = 237;
float rect1 = 295;
float rect2 = 359;
float rect3 = 409;
float aleron1 = 465;
float aleron2 = 526;
float aleron3 = 525;
float foc1 = 536;
float foc2 = 567; 
float foc3 = 581;
float foc4 = 596;
float velocitat = 0.15;
void setup(){
  size(800, 600);
  
}
void draw(){
  background(0);
  println(mouseX + "," + mouseY);
  
  //quadrat
  fill(128,128,128);
  beginShape();
  noStroke();
  rect(nave, 285, 300, 80);
  endShape();
  
  //rodona
  fill(128,128,128);
  noStroke();
  ellipse(puntoCe, 325, 80, 80);
  
  //foc
  fill(255,0,0);
  triangle(foc1, 304, foc4, 319, foc1, 332);
  fill(255,165,0);
  triangle(foc1, 348, foc3, 336, foc1, 325);
  triangle(foc1, 293, foc3, 303, foc1, 314);
  fill (255, 255, 0);
   triangle(foc1, 286, foc2, 291, foc1, 302);
  triangle(foc1, 364, foc2, 355, foc1, 345);
 
  //finestres
  fill(255);
  rect(rect1, 297, 10, 10);
  rect(rect1, 339, 10, 10);
  rect(rect2, 297, 10, 10);
  rect(rect2, 339, 10, 10);
  rect(rect3, 297, 10, 10);
  rect(rect3, 339, 10,10);
  //alerones
  fill(64,224,208);
  triangle(aleron1, 284, aleron2, 235, aleron3, 284);
  triangle(aleron1, 364, aleron2, 421, aleron3, 364);
  //movimiento redonde
    if(puntoCe + 125 > 0 ){
   puntoCe = puntoCe - velocitat;
  }else{
  puntoCe = puntoCe + 1000;
  
  }
  
  //movimiento nave
  if(nave + 120 > 0 ){
   nave = nave - velocitat;
  }else{
  nave = nave + 1000;
  
  }
  //movimiento rectangulo1
  if(rect1 + 149 > 0 ){
   rect1 = rect1 - velocitat;
  }else{
  rect1 = rect1 + 1000;
  
  }
   //movimiento rectangulo2
  if(rect2 + 181 > 0 ){
   rect2 = rect2 - velocitat;
  }else{
  rect2 = rect2 + 1000;
  
  }
  //movimiento rectangulo3
   if(rect3 + 205 > 0 ){
   rect3 = rect3 - velocitat;
  }else{
  rect3 = rect3 + 1000;
  }
  //movimiento aleron1
  if(aleron1 + 232 > 0 ){
   aleron1 = aleron1 - velocitat;
  }else{
  aleron1 = aleron1 + 1000;
  }
  
  //movimiento aleron2
  if(aleron2 + 264 > 0 ){
   aleron2 = aleron2 - velocitat;
  }else{
  aleron2 = aleron2 + 1000;
  }
  //movimiento aleron3
  if(aleron3 + 264 > 0 ){
   aleron3 = aleron3 - velocitat;
  }else{
  aleron3 = aleron3 + 1000;
  }
  //movimiento foc1
  if(foc1 + 264 > 0 ){
   foc1 = foc1 - velocitat;
  }else{
  foc1 = foc1 + 1000;
  }
   //movimiento foc2
  if(foc2 + 285 > 0 ){
   foc2 = foc2 - velocitat;
  }else{
  foc2 = foc2 + 1000;
  }
  //movimiento foc3
  if(foc2 + 292 > 0 ){
   foc3 = foc3 - velocitat;
  }else{
  foc3 = foc3 + 1000;
  }
  //movimiento foc4
  if(foc2 + 299 > 0 ){
   foc4 = foc4 - velocitat;
  }else{
  foc4 = foc4 + 1000;
  }
}


