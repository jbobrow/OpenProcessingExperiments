
//Lluís Rebull Requena: tauler de dibuix
int posicion=0;
void setup(){
  size(1500,700);
  background(255);
  smooth();
}
void draw(){
//Linia fina
  if (keyPressed){
    //Linia normal
    if(key=='q');
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(posicion);
  posicion=(posicion+10)%10;
  noStroke();
  //Linia alternant
    if(key=='w'){
     line(pmouseX,pmouseY,mouseX,mouseY);
     strokeWeight(posicion);
     posicion=(posicion+1)%90;
    }
    //Linia discontinua
   if(key=='e'){
     line(pmouseX,pmouseY,mouseX,mouseY);
     strokeWeight(posicion);
     posicion=(posicion+5)%10;
    
   }
     //Borrador
     if(key=='r'){
     ellipse(pmouseX,pmouseY,mouseX,mouseY);
     strokeWeight(posicion);
     posicion=(posicion+1)%50;
      }
  }
  if(mousePressed){
      stroke(0);
  }
}


