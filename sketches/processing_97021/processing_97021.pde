
// Marta Fernández Turu, Grup 02

//Definim variables
float angle;
float distancia;
int posX, posY, velX, velY;
boolean ismousepressed;
int radi=25;
PImage fons;

 
void setup()
{
 size(1000,500);
 fons=loadImage("fons.jpg"); // Insertem imatge de fons.
 stroke(0);
 strokeWeight(3);
 smooth();
 posX = width/2;
 posY = height/2;
 velX = int(random(4,11));
 velY = int(random(2,7));
}
 
 
void mousePressed(){
    ismousepressed=ismousepressed==false;  //Aconseguim que al apretar sigui true, al tornar apretar sigui false i així succecivament.
    if(ismousepressed){  // Definim que passa en el cas true.
      radi=round(random(20,70));  // EL radi de la pilota varia de forma random entre 20 i 70.
      
    }else{  // Definim que passa en el cas false.
      radi=25;  // La pilota torna al radi inicial.
    }
  } 
  
void draw()
{
 image(fons,0,0,width,height);
  
 //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  
angle=atan2(posX,posY);   // Determinem un angle arbitrari que varia a partir del ratolí (un angle dinàmic).
 
 
pushMatrix(); // Amb aquesta comanda obrim una nova matriu que acceptarà les diferents accions que definim.
 
distancia=dist(posX,posY,0.98*width-65,0.3*height); // Donem valor a la variable "distancia", per mitjà de la posició del mouse i del centre de la cistella.
 
 
translate(posX,posY); // Canviem les referències per tal que l'origen sigui el mouse.
fill(203+distancia/5,86+distancia/5,34+distancia/5); ellipse(0,0,2*radi,2*radi); // Dibuixem la pilota en l'origen (mouse). El seu color variarà en funció de la posició del mouse, passant gradualment del color blanc a taronja desitjat a mesura que el cursor s'aporopa a la cistella.
rotate(6*angle);  // Amb aquesta comanda aconseguim rotar el que dibuixem a continuació. Per tal que la rotació sigui apreciable multipliquem per 6 l'angle de rotació.
fill(0); line(0,-radi,0,radi);
noFill(); bezier(cos(0.96)*radi,sin(0.96)*radi,radi/5,radi/2.5,radi/5,-radi/2.5,cos(0.96)*radi,-sin(0.96)*radi); // Dibuixem les dues corbes de la pilota utilitzant la funció bezier.
bezier(-cos(0.96)*radi,sin(0.96)*radi,-radi/5,radi/2.5,-radi/5,-radi/2.5,-cos(0.96)*radi,-sin(0.96)*radi);
 
popMatrix();  // Amb aquesta comanda tanquem la matriu iniciada amb pushMatrix(). Les comandes definides a continuació no patiran cap de les accions definides en la matriu anterior.

fill(0); rect(0.98*width,height,0.5*width,-475);  //Pal de la cistella.
fill(0); rect(0.98*width,0.30*height,-15,5); //Unió cistella.
fill(0); rect(0.98*width-15,0.30*height,-95,10); //Cistella.
 


fill(0); line(0.98*width-110,0.30*height+10,0.98*width-100,0.30*height+85); //Xarxa cistella E-D.
 
fill(0); line(0.98*width-100,0.30*height+10,0.98*width-90,0.30*height+85);
 
fill(0); line(0.98*width-90,0.30*height+10,0.98*width-80,0.30*height+85);
 
fill(0); line(0.98*width-80,0.30*height+10,0.98*width-70,0.30*height+85);
 
fill(0); line(0.98*width-70,0.30*height+10,0.98*width-60,0.30*height+85);
 
fill(0); line(0.98*width-60,0.30*height+10,0.98*width-50,0.30*height+85);
 
fill(0); line(0.98*width-50,0.30*height+10,0.98*width-40,0.30*height+85);
 
fill(0); line(0.98*width-40,0.30*height+10,0.98*width-30,0.30*height+85);
 
fill(0); line(0.98*width-30,0.30*height+10,0.98*width-20,0.30*height+85);
 
 
 
 
fill(0); line(0.98*width-15,0.30*height+10,0.98*width-25,0.30*height+85); //Xarxa cistella E-D.
 
fill(0); line(0.98*width-25,0.30*height+10,0.98*width-35,0.30*height+85);
 
fill(0); line(0.98*width-35,0.30*height+10,0.98*width-45,0.30*height+85);
 
fill(0); line(0.98*width-45,0.30*height+10,0.98*width-55,0.30*height+85);
 
fill(0); line(0.98*width-55,0.30*height+10,0.98*width-65,0.30*height+85);
 
fill(0); line(0.98*width-65,0.30*height+10,0.98*width-75,0.30*height+85);
 
fill(0); line(0.98*width-75,0.30*height+10,0.98*width-85,0.30*height+85);
 
fill(0); line(0.98*width-85,0.30*height+10,0.98*width-95,0.30*height+85);
 
fill(0); line(0.98*width-95,0.30*height+10,0.98*width-105,0.30*height+85);


if((posX-radi<0)||(posX+radi>width)){   // Fem que la pilota reboti amb els límits de la finestra, no amb el seu centre, sinó amb els seus límits (a la dreta i a l'esquerra, com si tingués entitat física, per dir-ho així).
    velX = -velX;                     
  } 
    
if((posY-radi<0)||(posY+radi>height)){  // Fem que la pilota reboti amb els límits de la finestra, no amb el seu centre, sinó amb els seus límits (a dalt i a baix, com si tingués entitat física, per dir-ho així).
    velY = -velY;
  }
 
 
}



