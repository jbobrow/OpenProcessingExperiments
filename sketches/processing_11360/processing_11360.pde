
//Trabajo experimental de Programación, combinación de códigos//

void setup()
  {
  size (400,400);
  background (40,40,40,40); 
  frameRate(80);  
  
  }



void draw ()
  {
  if(mousePressed) {
  fill(80, 169, 0);
  }
  else{
  fill (380,0,30);
  }

   line (pmouseY, pmouseX, mouseY, mouseX);//dirección de las lineas//
   stroke(mouseY,190 , mouseX); //tonalidad de la lineas//
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 250;//Grosor de las lineas//
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
  
  
void mouseClicked(){
//dibuja un rectangulo donde el mouse fue clickeado
ellipseMode(UP);
fill(mouseY, 0, mouseX);
noStroke();
ellipse(mouseY, mouseX, 40, 40);
}
void keyPressed(){
//presiona tecla para borrar el Background
background(30,30,30,30);
}

