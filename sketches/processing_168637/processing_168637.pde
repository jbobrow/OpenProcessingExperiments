
//indiferencia

void setup(){
  //tamaÃ±o ventana
  size(500, 500);
  
  //color del fondo
  background(83,105,126);
  
}

void draw (){
  
  strokeWeight(1);
  
  //rostro
  fill(255,215,166);
  noStroke();
  ellipse(250 , 250 , 250 , 300 );
  
  
  //hojo derecho
  stroke(0,0,0);
  fill(250,250,250);
  ellipse(200 , 210 , 50 , 30 );
  fill(0,0,0);
  ellipse(200 , 210 , 20 , 20 );
  
  //hojo parche
  rect(270, 180, 55, 55);
  noFill();
  arc(375, 235, 100, 50, HALF_PI, PI);
  line(270, 180, 211, 106);

  //sombrero
  line(80, 160, 420, 160);
  fill(0,0,0);
  arc(250, 160, 350, 280, PI, TWO_PI);
  
  //calavera
  fill(250,250,250);
  ellipse(250 , 80 , 50 , 50 );
  noStroke();
  ellipse(250 , 100 , 35 , 35 );
  
  //boca calavera
  stroke(0,0,0);
  line(240, 100, 260, 100);
  line(240, 105, 260, 105);
  line(240, 110, 260, 110);
  line(240, 100, 240, 110);
  line(245, 100, 245, 110);
  line(250, 100, 250, 110);
  line(255, 100, 255, 110);
  line(260, 100, 260, 110);
  
  //ojos calavera
  fill(0,0,0);
  ellipse(240 , 80 , 15 , 15 );
  ellipse(260 , 80 , 15 , 15 );
  
  //huesos
  stroke(250, 250, 250);
  strokeWeight(5);
  line(225, 115, 275, 145);
  line(225, 145, 275, 115);
  
  //barba
  strokeWeight(1);
  stroke(0, 0, 0);
  beginShape();
  
      vertex(127,287);
      vertex(370,287);
      vertex(370,400);
      vertex(347,386);
      vertex(347,435);
      vertex(315,415);
      vertex(315,455);
      vertex(250,500);
      vertex(195,455);
      vertex(195,415);
      vertex(170,435);
      vertex(170,386);
      vertex(127,400);
    
  endShape();
  
  
  //boca
  strokeWeight(5);
  stroke(250, 250, 250);
  line(180, 325, 315, 325);
  
  
  //oreja izquierda
  strokeWeight(1);
  fill(255,215,166);
  noStroke();
  ellipse(370 , 222 , 50 , 70 );
  fill(255,255,0);
  ellipse(383 , 247 , 10 , 10 );
  
  //oreja derecha
  strokeWeight(1);
  fill(255,215,166);
  noStroke();
  ellipse(130 , 222 , 50 , 70 );
  
  //nariz
  strokeWeight(1);
  fill(203,040,033);
  noStroke();
  ellipse(250 ,260 , 50 , 50 );
  
  //cicatriz
  stroke(0,0,0);
  fill(0,0,0);
  line(146, 238, 190, 270);
  line(146, 248, 166, 237);
  line(160, 263, 185, 252); 
}




