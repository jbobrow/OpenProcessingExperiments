
//Creado por Tomas de Camino
//Idea tomada del libro Generative Design

PFont font;

String letter = "A";

void setup(){
 size(800,800);
 font = createFont("Arial",12);
 textFont(font);
 textAlign(CENTER,CENTER);
  
}

void draw(){
 background(255);
 fill(0);
 textSize(mouseX-width/2);
 text(letter,width/2,mouseY);
}
