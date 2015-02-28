
/*Marta Donoso_Informàtica. Exercici que utilitza les funcions per tal de dibuixar un objecte*/

 int x;
 int y;
 int i; 
 int posx;
 int posy;
 
void setup() { //inicialitzem el setup
  size(300, 300);
  smooth();
  background(89,188,118);


 
}

void draw() //defineixo les funcions que més endevant vull representar en el dibuix, la de dibuixar el fons estàtic, i la figura que s'anirà movent.
{
  dibuixaelfons();
  posiciona_element();
  
}

void dibuixaelfons() //dibuixo el fons estàtic mitjançant bucles.
{
   
for(int x=10; x<width; x+=30) //he creat tantes ellipses com hi caben en el dibuix.
{
   for(int i=10; i<height; i+=30){
    noStroke();
    fill(179,227,193);
    ellipse (x,i,15,12);

  }
}
}

void posiciona_element(){ //per dibuixar els cercles en funció de posx i posy
noStroke();
    
  fill(116, 67, 156);
  ellipse(posx,posy,30,30);
 
}
  
  

void mousePressed() {  //funció perquè apareixi el cercle quan vas apretan el mouse. 

  dibuixar(mouseX, mouseY);//funciona a partir del mouse
}


void dibuixar(int x, int y) { //dibuixem els cercles que apareixeran al apretar el mouse.
  strokeWeight(4);
  noStroke();
  fill(116, 67, 156);
  ellipse(x, y, 40, 40);
}




