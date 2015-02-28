
void setup(){ 
 size(400,400); 
 smooth(); 
 background(0); 
 frameRate(820); 
} 
 
void draw(){ 
 stroke(mouseX, 0 , mouseY); //puedo hacer esto mejor? 
 float distance = dist(pmouseX, pmouseY, mouseX, mouseY); 
 float maxStroke = 50; 
 strokeWeight(maxStroke - constrain(distance, 0, maxStroke)); 
 rect(pmouseX, pmouseY, mouseX, mouseY); 
} 
 
void mouseClicked(){ 
  //dibuja un rectangulo donde el mouse fue clickeado 
  rectMode(CENTER); 
   fill(mouseY, 255, mouseX); 
   noStroke(); 
  rect(mouseX, mouseY, 30, 30); 
} 
 
void keyPressed(){ 
  //presiona tecla para borrar el Background 
 background(0);  
} 
 

