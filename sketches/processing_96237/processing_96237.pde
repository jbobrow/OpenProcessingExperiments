
//Alexandre Acsensi Valiente
//Dibuix del pingu que torna a casa i es fa de nit.
int y;
void setup()
{
  size(500,500);
}
void draw()
{
  //indico el color de fons que vull, així cada cop es borrarà la imatge anterior.
  background(10,260-mouseX,260);
  //dibuixo el paisatge.
  noStroke();
  fill(250);
  ellipse(width,height-50,200,200);
  rect(width,height,-125,-100);
  fill(230,230,230);
  rect(0,height,width,-50);
  strokeWeight(5);
  line(width,height-10+0,width-200,height-50);
  //dibuix del pingu que seguirà el cursor.
  fill(245,50,5);
  triangle(mouseX,310,mouseX,340,mouseX+40,325);
  fill(0);
  ellipse(mouseX,400,75,100);
  fill(250);
  ellipse(mouseX,325,50,50);
  ellipse(mouseX+30,400,15,50);
  fill(0);
  ellipse(mouseX+5,320,5,5);
  //dibuixo el sol en funció de mouseX, així quan fem avançar el pingu cap a casa el sol desapareix.
  fill(250,250,0);
  ellipse(50,50,width-mouseX,width-mouseX);
  //dibuixo la lluna en funció de mouseX, així quan fem avançar el pingu la lluna es fa gran.
  fill(250,250,180);
  ellipse(450,50,mouseX,mouseX);
  fill(10,260-mouseX,260);
  ellipse(width,50,mouseX,mouseX);
  //faig pluja en funció de la variable y.
  stroke(0,0,200);
  strokeWeight(1);
  line(10,10+y,10,20+y);
  line(50,10+y,50,20+y);
  line(100,10+y,100,20+y);
  line(150,10+y,150,20+y);
  line(200,10+y,200,20+y);
  line(250,10+y,250,20+y);
  line(300,10+y,300,20+y);
  line(350,10+y,350,20+y);
  line(400,10+y,400,20+y);
  line(450,10+y,450,20+y);
  line(500,10+y,500,20+y);
  y=y+1;
  //col·loco el nom a la part inferior del dibuix.
  fill(0);
  textSize(10);
  text ("Alexandre Acsensi",375,480);
}




