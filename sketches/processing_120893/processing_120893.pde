
//Relació Botó-Funció
    //Nombres
      // 0 --> Tornar a posar el tauler buit, per tal de poder començar de nou el dibuix.
      // 1 --> Posar la rodona de color negre
      // 2 --> Posar la rodona de color blau
      // 3 --> Posar la rodona de color vermell
      // 4 --> Posar la rodona de color taronja
      // 5 --> Posar la rodona de color gris
      // 6 --> Posar la rodona de color verd
          
    //Lletres
      // b --> Tindrem una goma per esborrar (Mantenir apretat el botó i arrossegar el ratolí sense clicar)

int x = 0;

void setup() 
{size(800, 800); background(#F2F5A9);}
  
void draw() {
  if (mousePressed) {
    ellipse(mouseX, mouseY, 50, 50);} //Apareixerà una rodona de mida 50x50
  if (keyPressed) {
    if (key == '0') {
      background(#F2F5A9);
    }
    if (key == '1') {
      stroke(#FFFFFF);
      fill(#000000);
    }
    if (key == '2') {
      fill(#0040FF);
    }
    if (key == '3') {
      fill(#DF0101);
    }
     if (key == '4') {
      fill(#FF8000);
    }
    if (key == '5') {
      fill(#848484);
    }
    if (key == '6') {
      fill(#088A4B);
    }
    if (key == 'b') {
      ellipse(mouseX, mouseY, 25, 25);
      stroke(#F2F5A9);
      fill(#F2F5A9);
    }
    if (key == '+') {
    strokeWeight(x++);
    }
    if (x == 0) {
       x = 0;
    } else if (key == '-'){
      strokeWeight(x--);
    }
  }
}


