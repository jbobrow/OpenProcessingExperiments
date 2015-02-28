
int Colores = color(0, 0, 0); 

void setup() {
  size(400, 400);
  background(20,110,250);
  
}
 
void draw() {
  
  fill(255,0,0); //rectangulo de color rojo
  rect (0,0,20,20);
  
  fill(0,0,0); // rectangulo de color negro
  rect(20, 0, 20, 20);
  
  fill(0,255,0); //ellipse de color verde
  ellipse(60,10,20,20);
  
  fill(20,110,250); //rectangulo Azul k sirve para borrar
  rect(80, 0, 20, 20);
  
  //aqui determino k cuan tu apretis sobre un color et pintara del color desitjat.
  if(mousePressed == true) {
     
    if(mouseX < 20 && mouseX > 0 && mouseY < 20 && mouseY > 0) {
      Colores = color(255,0,0);
    }
    if(mouseX < 40 && mouseX >20 && mouseY <20 && mouseY >0){
      Colores = color(random(0),random(0),random(0));
    }
    if(mouseX < 70 && mouseX >40 && mouseY <20 && mouseY >0){
      Colores = color(0,255,0);
    } 
     if(mouseX < 100 && mouseX >80 && mouseY <20 && mouseY >0){
      background(20,110,250);
    }
    
   
  
    //Aquest if es perk quan surti la ellipse nomes surti color pel borde de l'ellipse
    stroke(Colores);
    if(mouseY > 30) {
    ellipse(mouseX,mouseY, random(3,15),random(3,15));
    }
  }
 
}



