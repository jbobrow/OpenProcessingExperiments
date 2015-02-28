
int counter;

void setup() {  //setup function called initially, only once
//Heitor Ribas Felix
//30/04
// Código relacionado à música "Pela Internet" de Gilberto Gil, demonstrando um vírus atacando o Japão em si.
size (400,400,0); 
background (0);

rect (115,70,170,120); //Bandeira do japão.
rect (125,80,150,100);
fill (255,0,0);
ellipse (200,130,80,80);

fill (255); //Vírus.
rect (160,300,80,60);
fill (0);
textSize("40"); 
text ("☣",185,335);
textSize ("15");
text ("fire!!!!",185,350);

fill(255); //missil.
noStroke ();
arc (200,235,10,20,180,360); 
rect (195,235,10,30);
}

