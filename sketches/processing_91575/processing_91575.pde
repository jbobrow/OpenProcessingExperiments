
class Burbuja 
{  
  //--------------------------------------------------------------
  // Atributos
  //--------------------------------------------------------------
  float x;
  float y;
  float vel;
  float diametro;
  float acel;
  float alfa;
PImage img3;
  Burbuja ()
  {
    
    y=random (height);
    x=random (width);
    vel=-0.5;
    acel=-0.02;
    diametro=random(15,80);
    
    img3 = loadImage("lata2.jpg");
    

alfa =random(50,200);


}
  


  void dibujame()
  {
    // TODO: Pintar la burbuja según los atributos y los colores que deseen. Hay que utilizar transparencia.
 
  noStroke();
    fill(255,22);
    image(img3,x,y); 
    ellipse (x, y-5, 50,50);
    ellipse (x, y-5, 50,50);
    
  }

  /**
   * Modifica la posición de la burbuja
   */
  void flotar ()
  {
    // TODO: Sumarle a la posición en y la velocidad
    
      y=y+vel;
    vel=vel+acel;
    
    

    // TODO: Sumarle a la velocidad, la aceleración.
    if ((y-50)<=0)
    {
      y=800;  
      vel=-0.5;
    }
    //TODO: Cuando la burbuja cuando salga de la ventana, reiniciar la posición en y en height y la
    //      velocidad en -0.5.

  }
}


