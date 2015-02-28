
void setup () { // definiçao set up
  
  size (700, 700); // tamanho da janela
  background (51, 118, 175); // jundo da janela
  smooth (); // suaviza elementos
  noLoop (); // manter a imagem estatica
  
}

void draw (){ // definiçao elementos composiçao 


noStroke (); // nao existe contorno
fill (0); // preenchimento
ellipse (300, 200, 150, 150); // circunferencia

noStroke (); // nao existe contorno
fill (255); // preenchimento
ellipse (330, 170, 30, 30); // circunferencia

noStroke (); // nao existe contorno 
fill (255); // preenchimento
ellipse (270, 170, 30, 30); // circunferencia

noStroke (); // nao existe contorno 
fill (211, 113, 113); // preenchimento
ellipse (300, 225, 80, 80); // circunferencia

noStroke (); // nao existe contorno 
fill (0); // preenchimento
ellipse (300, 420, 300, 300); // circunferencia

PFont myFont; 
myFont = loadFont("Bauhaus93-48.vlw"); // carregar tipo de letra
textFont(myFont, 50); // tamanho tipo de letra

text("Gotta cath em all!!", 100, 650); // posiçao tipo de letra


}
