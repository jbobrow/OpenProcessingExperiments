
 /*Nil Pastor G3: Pràctica2*/
 /*En Primer lloc definim les 3 variables que utilitzarem per a definir el els colors*/
 int color1;
 int color2;
 int color3;
 /*A continuació en el setup definim els valors que no variaran que en aquest cas és la mida de la
 pantalla i el color del fons*/
void setup(){
  size(500,500);
  background(0);
}
/*Tot seguit definirem les variables del dibuix*/
void draw(){
/*En primer lloc afegim la opció background per que el dibuix es vagi esborrant a mida que
el movem per la pantalla i així s'evita que es quedi copiat, i despres definim les linies
del fons de la pantalla amb els seus colors*/
  background(0);
  stroke(color1,color2,color3);
  line(100,0,100,500);
  stroke(color2,color1,color3);
  line(150,20,150,480);
  stroke(color1,color2,color3);
  line(250,10,250,490);
  stroke(color2,color1,color3);
  line(350,20,350,480);
  stroke(color1,color2,color3);
  line(400,0,400,500);
/*Un cop dibuixat el fons de la pantalla ens disposem a dibuixar la cara que
que seguira el mouse, la qual definim a partir de la referencia del mouse*/
  fill(233,255,0);
  stroke(255,255,255);
  strokeWeight(3);
  ellipse(mouseX,mouseY,100,100);
  fill(0);
  ellipse(mouseX-20,mouseY-20,20,20);
  ellipse(mouseX+20,mouseY-20,20,20);
  fill(0);
  stroke(0);
  ellipse(mouseX,mouseY+10,40,40);
  fill(233,255,0);
  stroke(233,255,0);
  rect(mouseX-25,mouseY-12,50,20);
  color1=0+mouseX;
  color2=0+mouseY;
  color3=0+mouseX+mouseY;
}


