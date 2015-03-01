
//Paula Buffone
//Monigote girando
// Práctica para Sistemas Interactivos en el Arte
// Profesor Diego Alberti


void setup() {
  //tamaño de lienzo
    size(400, 400);
}
 
void draw() { 
 //color para el fondo
    background(20,100,255);
//ubico las coordendas en el centro     
    translate(width/2, height/2);   
 //gira 360 grados en un segundo
    rotate(millis() * 0.001 * TWO_PI / 10.0);  
 //se corre del centro  
    translate(40, 0); 
  //una revolución por segundo 
  pushMatrix();  
    rotate(millis() * 0.001 * TWO_PI/10.0);    
     
         
//cuerpo
  strokeWeight(20);
    stroke(255, 0, 0);
    line(0,0,75,0);   
    line(15,0,50,50);
    line(15,0,50,-50);
    line(75,0,140,40);
    line(75,0,140,-40);
    
    //cabeza
    fill(255);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0,0,50, 40);
    
    //ojos
    fill(0);
    ellipse (-1,-7,10,10);
    ellipse (-1,7,10,10);   
      popMatrix();
}

