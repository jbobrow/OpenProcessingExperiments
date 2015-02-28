
void setup(){
  size(800,800);
  background(0); //si posem el background a draw cada vegada qeu dibuixi un sputnik, em pintara un fons negre que borrarà l’sputnik i no se’m veurà. Si el poso a setup, defineixo el fons de negre i prou.
}

void draw(){
 
  smooth(); //dibuixa amb més definició. Pot estar a setup
  //invoquem la función, que definim més endavant:

}
//funció que dibuixa un TOPO:
void dibuixaNAU(/*parameteres de la funcio*/ int posX, int posY){
  /*Dibuixem la nau*/
fill(161,165,167);
noStroke();
strokeWeight(2);
triangle(posX-100,posY+75,posX,posY,posX+100,posY+75);/*triangle*/

fill(88,97,103);
stroke(88,97,103);
strokeWeight(2);
line(posX,posY-50,posX,posY);/*line*/

fill(24,103,180); 
stroke(17,60,103);
strokeWeight(2);
ellipse(posX,posY,5,5);/*cercle petit (c)*/

fill(42,255,28); 
stroke(255,255,255);
strokeWeight(4);
ellipse(posX,posY-50,30,30);/*cercle gran (C)*/
}

void mousePressed (){ dibuixaNAU(mouseX,mouseY);}

//void  indica que les fucions que s’executen no retornen res.
int calculsMoltComplexes(int a_, int b_){
  int aRetornar;
  aRetornar = (a_+b_)/2;
  return aRetornar;  
}
// capcalera d’una funcio. Li posem parameters a i b, i retorna un enter. Fa el calcul. Amb return fem que ens torni el resultat



