
void setup()
{
  smooth();                               //Activar antialiasing para todo evento
  size(480,640);                          //Tamano de la ventana.
  
}

void draw()

{
  background(80,80,80);                    //El fondo. Si lo dejaba en VOID SETUP no se refrescaba
  
  fill(180,100,80);                        //cuello
  rect(220,320,40,150);
  
  fill(200,120,100);                        //primero la cara
  noStroke();
  ellipse(240,320, 100,200);
 
  noFill();                                 //luego las cejas     
  stroke(60,30,20);
  strokeWeight(2);
  arc(240,370,50,mouseY,0,PI);
  
  fill(250,150,150);                        //nariz
  noStroke();
  triangle(mouseX,340,240,305,240,340);
  
  fill(255);                                //ojos
  noStroke();
  ellipse(260,295,  10,10);
  ellipse(220,295,  10,10);
  fill(128,128,0);
  noStroke();
  ellipse(260,295, 4,4);
  ellipse(220,295, 4,4);

}

