

void setup()
{
  size(600, 600);
  background(0);
}


void draw()
{
  {  

    ellipse(mouseX, mouseY, 100, 100);

    //circulo afuera
    ellipse(0, 0, width/1, height/1);

    // este fill queda para todos los circulos.¿colores no concuerdan? y porque los de afuera igual color a los pequeños?
    fill(0, 0, 0);  
    ellipse(mouseX, mouseY, 90, 90);

    fill(172, 77, 175);
    //circulo afuera
    //stroke es color linea
    stroke(0, 0, 0);
    ellipse(width, 0, width/1, height/1);



    ellipse(mouseX, mouseY, 75, 75);

    fill(172, 77, 175);//MORADO
    //circulo afuera
    ellipse(width/1, height/1, width/1, height);

    fill(0, 0, 0);//NEGRO

    ellipse(mouseX, mouseY, 65, 65);

    fill(172, 77, 175);
    //circulo afuera
    ellipse(width/150, height/1, width/1, height);
    
    //último circulo pequeño
    fill(172, 77, 175);
    ellipse(mouseX, mouseY, 30, 30); // 20 tamaño circulo

  
  }
}

