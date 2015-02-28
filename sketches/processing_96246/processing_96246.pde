
float angle;
float distancia;


void setup()
{
 size(500,500);
 background(255);
 stroke(0);
 strokeWeight(3); 
 noCursor();
}


void draw()
{
background(255); 
angle=atan2(mouseX, mouseY);   // Determinem un angle arbitrari que varia a partir del ratolí (un angle dinàmic).


pushMatrix(); // Amb aquesta comanda obrim una nova matriu que acceptarà les diferents accions que definim.

distancia=dist(mouseX,mouseY,0.98*width-65,0.3*height); // Donem valor a la variable "distancia", per mitjà de la posició del mouse i del centre de la cistella.


translate(mouseX,mouseY); // Canviem les referències per tal que l'origen sigui el mouse.
fill(198+distancia,86+distancia,34+distancia); ellipse(0,0,50,50); // Dibuixem la pilota en l'origen (mouse). El seu color variarà en funció de la posició del mouse, passant gradualment del color blanc a taronja desitjat a mesura que el cursor s'aporopa a la cistella.
rotate(6*angle);  // Amb aquesta comanda aconseguim rotar el que dibuixem a continuació. Per tal que la rotació sigui apreciable multipliquem per 6 l'angle de rotació.
fill(0); line(0,-25,0,25); 
noFill(); bezier(14.3,20.05,5,10,5,-10,14.3,-20.05); // Dibuixem les dues corbes de la pilota utilitzant la funció bezier.
bezier(-14.3,20.05,-5,10,-5,-10,-14.3,-20.05);

popMatrix();  // Amb aquesta comanda tanquem la matriu iniciada amb pushMatrix(). Les comandes definides a continuació no patiran cap de les accions definides en la matriu anterior.

fill(0); rect(0.98*width,height,0.5*width,-475);  //Pal de la cistella.
fill(0); rect(0.98*width,0.30*height,-15,5); //Unió cistella.
fill(0); rect(0.98*width-15,0.30*height,-95,10); //Cistella.


fill(0); line(0.98*width-110,0.30*height+10,0.98*width-110+10,0.30*height+10+75); //Xarxa cistella E-D.

fill(0); line(0.98*width-100,0.30*height+10,0.98*width-110+20,0.30*height+10+75);

fill(0); line(0.98*width-90,0.30*height+10,0.98*width-110+30,0.30*height+10+75);

fill(0); line(0.98*width-80,0.30*height+10,0.98*width-110+40,0.30*height+10+75);

fill(0); line(0.98*width-70,0.30*height+10,0.98*width-110+50,0.30*height+10+75);

fill(0); line(0.98*width-60,0.30*height+10,0.98*width-110+60,0.30*height+10+75);

fill(0); line(0.98*width-50,0.30*height+10,0.98*width-110+70,0.30*height+10+75);

fill(0); line(0.98*width-40,0.30*height+10,0.98*width-110+80,0.30*height+10+75);

fill(0); line(0.98*width-30,0.30*height+10,0.98*width-110+90,0.30*height+10+75);




fill(0); line(0.98*width-15,0.30*height+10,0.98*width-15-10,0.30*height+10+75); //Xarxa cistella E-D.

fill(0); line(0.98*width-25,0.30*height+10,0.98*width-15-20,0.30*height+10+75);

fill(0); line(0.98*width-35,0.30*height+10,0.98*width-15-30,0.30*height+10+75);

fill(0); line(0.98*width-45,0.30*height+10,0.98*width-15-40,0.30*height+10+75);

fill(0); line(0.98*width-55,0.30*height+10,0.98*width-15-50,0.30*height+10+75);

fill(0); line(0.98*width-65,0.30*height+10,0.98*width-15-60,0.30*height+10+75);

fill(0); line(0.98*width-75,0.30*height+10,0.98*width-15-70,0.30*height+10+75);

fill(0); line(0.98*width-85,0.30*height+10,0.98*width-15-80,0.30*height+10+75);

fill(0); line(0.98*width-95,0.30*height+10,0.98*width-15-90,0.30*height+10+75);


}



