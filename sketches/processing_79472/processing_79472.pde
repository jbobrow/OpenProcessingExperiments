
void setup()
  {
    size(350,200);
    smooth();
    noFill();
    strokeWeight(3);
     
  }
void draw()
  {
    background(255);
     
  stroke(0,0,255);//Aro Azul.
  ellipse(120,90,70,70);
 
  stroke(255,255,0);//Aro Amarillo.
  ellipse(145,120,70,70);
 
  stroke(0);//Aro Negro
  ellipse(175,90,70,70);
 
  stroke(0,255,0);//Aro Verde.
  ellipse(200,120,70,70);
   
  //Con esta condición se genera el movimiento aleatorio de i a j en los respectivos ejes X y Y.
  int i,j;
    i=int (random(300));//Revoluciones del aro rojo en X.
    j=int (random(250));//Revoluciones del aro rojo en Y.
      if((i!=230) && (j!=90))
      {
        stroke(255,0,0);//Aro Rojo.
        ellipse(i,j,70,70);
      }
      else{
        stroke(250,0,0);//Aro Rojo
        ellipse(230,90,70,70);
        noLoop(); //Detiene las revoluciones de la función random.
      }
  } //Fin.
