
int pos=20;
void setup(){
  size(255,255);
}
void draw(){
  background(74,88,86);
strokeWeight(3);
  
 line(mouseX-30,mouseY-30,mouseX+30,mouseY+30); 
 line(mouseX-30,mouseY+30,mouseX+30,mouseY-30);

 ellipse(mouseX+30,mouseY-30,10,10);
 ellipse(mouseX-30,mouseY-30,10,10);
 ellipse(mouseX,mouseY,15,15);

//Hasta aqui tenemos la figura
//Movimiento vertical
pos=mouseY+1;
//Ellipse del centro
ellipse(mouseX,mouseY,pos/2,pos/2);
 //Ellipses laterales
 ellipse(mouseX+30,mouseY-30,pos/4,pos/4);
 ellipse(mouseX-30,mouseY-30,pos/4,pos/4);
  
  //Movimiento horizontal
  pos=mouseX-1;

  fill((pos*255)/4,pos/4,pos/4); 
  
}


