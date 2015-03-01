


void setup() {
  size(510, 510);
}

void draw() {

  float rand = random(2,8);
  
  fill(mouseX, mouseX, mouseX);
  rect(0, 0, width, height); 


  for (int i=0; i<height; i+=10) {//derecha
    stroke(0, i, 0);
    line(mouseX, mouseY, width, i);
  }


  for (int i=0; i<height; i+=10) {//izquierda
    stroke(0, i, 0);
    line(0, i, mouseX, mouseY);
  }


  for (int i=0; i<width; i+=10) {//arriba
    stroke(0, i, 0);
    line(i, 0, mouseX, mouseY);
  }

  for (int i=0; i<width; i+=10) {//abajo
    stroke(0, i, 0);
    line(mouseX, mouseY, i, width);
  }


  for (int i=0; i<height; i+=10) {//prueba1
    stroke(i, i, 0);
    line(width-mouseX, height-mouseY, width, i);
  }

  for (int i=0; i<height; i+=10) {//prueba2
    stroke(i, i, 0);
    line(0, i, width-mouseX, height-mouseY);
  }


  for (int i=0; i<width; i+=10) {//prueba3
    stroke(i, i, 0);
    line(i, 0, width-mouseX, height-mouseY);
  }

  for (int i=0; i<width; i+=10) {//prueba4
    stroke(i, i, 0);
    line(width-mouseX, height-mouseY, i, width);
  }


  
     stroke(0);
  strokeWeight(rand);
   line(width-mouseX, height-mouseY, mouseX, mouseY);
  
  stroke(0, random(255), 0);
  strokeWeight(rand-2);
 
  line(width-mouseX, height-mouseY, mouseX, mouseY);
   strokeWeight(1);
    stroke(0, 0, 0);
    
    fill(255); 
  text(mouseX+"x"+mouseY, mouseX, mouseY);
}



