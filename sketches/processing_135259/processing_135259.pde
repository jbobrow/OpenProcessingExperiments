
int aumenta = 0;

void setup()
{
  size(600, 600);
  background(0);
  colorMode(HSB);
  noCursor(); 
}
 
 
void draw()
{
   
   
 
    //circulo afuera
    fill(aumenta, 500, 500);
    ellipse(0, 0, aumenta * 1.5, aumenta * 1.5);
 
    // este fill queda para todos los circulos.¿colores no concuerdan? y porque los de afuera igual color a los pequeños?
    fill(0, 0, 0); 
    
 
    
    //circulo afuera
    //stroke es color linea
    fill(aumenta, 500, 500);
    ellipse(width, 0, aumenta * 1.5, aumenta * 1.5);
  
 
    ellipse(mouseX, mouseY, 75, 75);
 
    fill(aumenta, 500, 500);//MORADO
    //circulo afuera
    ellipse(width, height, aumenta * 1.5, aumenta * 1.5);
//  *1.5 para agrandar el circulo en aumenta 
    fill(0, 0, 0);//NEGRO
 
    ellipse(mouseX, mouseY, 65, 65);
 
    fill(aumenta, 500, 500);
    //circulo afuera
     
    ellipse(0, height, aumenta * 1.5, aumenta * 1.5);
     
    //último circulo pequeño
    fill(172, 77, 175);
    ellipse(mouseX, mouseY, 25, 25); // 20 tamaño circulo
    
   
    aumenta += 2;
  if(aumenta > 255) {
    aumenta = 0;} 
   
}

