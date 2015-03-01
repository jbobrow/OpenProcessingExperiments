
float Diam=30;
float Increment=8;

void setup ()
{
  size (600, 600);
  smooth ();
  frameRate(60);
 //Quantes vegades repetiré el draw(animació) cada segon.
}

void draw ()
{
  //Instruccions que es repeteixen 10 vegades cada segon.
 background(#FF43B1);
                                               //BOMBOLLA
 fill(#75C408);
 Diam=Diam+Increment;
 
 if (Diam>400)
   {
     Increment=Increment*(-1);
   }
 if (Diam<30)
   {
    Increment=Increment*(-1);
   }
 //Canviem la direcció de l'increment.
 float x=mouseX;
 float y=mouseY;
 stroke(#75C408);
 strokeWeight(30);
 ellipse (mouseX,mouseY,Diam,Diam);
                                                 //PERSONATGE:
  stroke (0);
  //Cabell_1
  strokeWeight (8);
  fill(0);
  beginShape();
  vertex(mouseX-180,mouseY-50);
  bezierVertex(mouseX-50,mouseY-10,mouseX,mouseY,mouseX+180,mouseY-50);
  bezierVertex(mouseX+165,mouseY+180,mouseX-150,mouseY+180,mouseX-180,mouseY-50);
  endShape();
  //Cara
  strokeWeight (8);
  fill (#FFF2D1);
  ellipse (mouseX,mouseY,300,245);
  strokeWeight (4);
  arc(mouseX,mouseY+60,40,55,0,PI);
  //Ulls
  strokeWeight (4);
  fill(255);
  ellipse (mouseX-83,mouseY,130,145);
  ellipse (mouseX+83,mouseY,130,145);
  strokeWeight(0);
  fill (#75C408);
  ellipse (mouseX-77,mouseY,115,115);
  ellipse (mouseX+77,mouseY,115,115);
  fill(0);
  ellipse (mouseX-75,mouseY-3,86,86);
  ellipse (mouseX+75,mouseY-3,86,86);
  fill(255);
  ellipse (mouseX-71,mouseY-7,36,36);
  ellipse (mouseX+71,mouseY-7,36,36);
  //Cabell_2
  fill(0);
  arc(mouseX,mouseY-35,310,190,PI,TWO_PI);
  fill(#FFF2D1);
  stroke(#FFF2D1);
  triangle(mouseX-17,mouseY-35,mouseX,mouseY-100,mouseX+17,mouseY-35);
  
  
}
