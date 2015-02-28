
/*ALEATORI
 Autor: Rut Diaz Palacios
Elisava GEDI - 3r trimestre
Grup 03
 */

//Començo donant-li nom i definint les variables.
int posX, posY, velX, velY;
int sz = 20;
int estat =1 ;
color value= color(203, random(183),random(183),random(10-35)); //el color serà aleatori i amb últim número defineixo la transparència, aleatòria també.

void setup(){
  size(500,300); //mida de l'espai on es treballarà
  posX = width/2; //la posició x i la y, es trobaran en el centre indepenentment de la mida del l'espai on es treballa
  posY = height/2;
  velX = 4; //la velocitat en X serà sempre a 4
  velY = random(1,8); //la velocitat en Y serà variable entre 1 i 8
  smooth(); //perquè els cercles vagin donant voltes
}

void draw(){
//comencem a dibuixar    
quad(0,20,0,30,500,30,500,20);
rect(20,0,10,300); 
line(posX,posY,sz+10,sz+10); //la recta començarà en el quadrat que formen els dos rectangles  
   
   fill(value); //el color està definit per value, així no cal tornar a ficar el valor del color.
  /* Defineixo les posicions, a les quals, les hi afegim les velocitats pertinents */
  posX = posX+velX; 
  posY = posY+velY;
//defineixo el cercle a sota del fill(value) perquè els color siguin en random.
  ellipse(posX,posY,sz+mouseX/8,sz+mouseX/8); //cada vegada que es mou el ratolí en la direcció X, el cercle s'anirà fent més gran (cap a la dreta) o més petit (cap a l'esquerra).
  
//comprovem la posició de X
  if((posX<sz+25)||(posX>width-(sz-sz/2))){ //al ficar la restricció de que quan la posicióX sigui més gran que la meitat menys el radi del cercle, fem que quan reboti a la pared, sigui pel perímetre d'aquest i no per qualsevol punt del cercle.
  velX = -velX; //fem que el cercle reboti ja que al arribar al seu límit, fem que retorni amb la velocitt negativa (és a dir, desfà el camí recorregut).
 } 
//comprovem la posició de Y
  if((posY<30+sz)||(posY>height-(sz-sz/2))){
  velY = -velY;
  ellipse(posX,posY,sz+50,sz+50); //cada vegada que la pilota reboti contra un obstacle, la seva mida variarà 50 vegades x i y
} 
}
//amb la següent funció el que es fa és que quan es cliqui a la pantalla, passin coses (les quals explicaré a continuació) 
void mousePressed() {
  //definim
 posX = mouseX; //ak ficar que la posició "x" i "y" estiguin en funció de mouse X i y respectivament, el que aconsegueixo és que cada vegada que cliqui en qualsevol punt de la pantalla, comenci a executar-se l'acció just en aquell punt.
 posY = mouseY;
 velX = random(1,10); //les velocitats podran estar compreses entre 1 i 10
 velY = random(1,10);
    
  //hi hauran 3 estats
  if (estat == 1) { //pregunto a quin estat estic
    estat = 2; //a quin estat vull estar
    noStroke(); //sense perimetre
    value=color(random(255), 60, random(200), 20 ); // defineixo el color de l'estat 2 (color aleatori + transparència)
    background(random(30-160)); //aquest background elimina tot el que s'ha dibuixat anteriorment a pantalla, és com si comencessim de nou, amb un nou fons de color i nous cercles de color rebotant per la pantalla


  } else { // si lo anerior no es cert, no estarà a l'estat 1, sinó que estarà al 2 o al 3.
   //Definim per l'estat 2 i després per l'estat 3.
   if (estat==2) {  // pregunto a quin estat estic. Estic al 2
   estat = 3; // a quin estat vull anar? al 3
   value=color(211, random(255), random(255), 20); // defineixo el color de l'estat 3
   background(random(80-200));

   } else{ // si lo anterior es fals, no estarà a l'estat 2, estarà o bé al 3 o bé a l'1.  
   if (estat==3) { // pregunto, on soc? a l'estat 3
   estat=1;//vull anar a l'estat 1, a l'inici
   stroke(random(255));
   value= color(203, random(183),random(183),random(10-35)); // defineixo el color de l'estat 1
   background(random(50-100));
}  
}
}
}



