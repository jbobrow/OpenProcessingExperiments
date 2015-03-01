
int ancho = 600;
int alto = 600;


void setup() {
size(ancho, alto);
}
  int valor1 = 1;
  int valor2 = 1;
  
void draw() {


  valor1 = (mouseX * 255 / ancho);
  valor2 = (mouseY * 255 / alto);
  

   stroke(valor2,valor1,valor2);
   
  
   line(mouseX - mouseX/2 , mouseY - mouseY/2, mouseX, mouseY);
 
}

