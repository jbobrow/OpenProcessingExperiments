
void setup () {
  size (400,400);// tamaño
  smooth ();
  background (0);//fondo
  frameRate(50);// cantidad de cuadrosque se dibujaran por segundo
 
}

void draw () {
  stroke(mouseX, 0, mouseY);
  float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
  float maxStroke = 15;
  strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
 fill (62,255,250);
 fill(mouseX,255,mouseX);
 ellipse(200, 200, mouseX, mouseY);//circulo al centro
 line (pmouseX,pmouseY, mouseX, mouseY);//linea que se dibuja con el movimiento del mouse
}

void mouseClicked(){
  rectMode(CENTER);
  fill(mouseX, 255, mouseY );
  noStroke();
  rect(mouseX, mouseY, 30, 0);
}

void keyPressed() { // siaprieto una tecla el fondo sera blanco
  background(255);
}
  
  void mousePressed (){ // si aprieto el mouse el fondo sera negro
  background (0);
}


