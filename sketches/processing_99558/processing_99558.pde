
int count;


void setup(){
  size(500,500);
    background(30,144,250);
  smooth();
   count=0;
}
void draw(){

  //invoquem la función, que definim més endavant:
   
}

 //Cada vegada que cliquem aparaixera l'abella i contara 30 cops fins que la pantalla es torni a netejar y començi la conta de nou

void mousePressed (){
  Abella(mouseX, mouseY);
  count+=1;
  if(count==30){
  background(30,144,250);
  count=0;
  }
  
}
//Heus ací una funció que dibuixa un Elipse, posem posX y posY per a que l'abella apareixi on cliquem.
void Abella(int posX, int posY){
  fill(#F5FFFA);
  ellipse(posX,posY-20,25,50);

  fill(#FFD700);
  ellipse(posX,posY,50,30);

  fill(0);
  rect(posX-10,posY-15,20,30,7);

}


