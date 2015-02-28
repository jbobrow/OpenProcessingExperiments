
void setup() {
  size(300,300);
 
  smooth();
}

void draw() {
   background(67,216,66);
  
  //mariquita cuerpo
  
fill(247,8,0);  
ellipse(mouseX,mouseY,65,80);
      //mariquita cabeza
           //antenas
line(mouseX,mouseY,pmouseX-13,pmouseY-70);
line(mouseX,mouseY,pmouseX+13,pmouseY-70);
fill(0);
ellipse(mouseX,mouseY-25,45,45);
           //ojos
fill(255,241,82);
ellipse(mouseX-8,mouseY-37,10,10);
ellipse(mouseX+8,mouseY-37,10,10);



      //mariquita cuerpo, detalles
line(mouseX,mouseY,pmouseX,pmouseY+40);
fill(0);
         //lunares izquierdos
ellipse(mouseX-22,mouseY-3,8,8);
ellipse(mouseX-13,mouseY+25,8,8);
ellipse(mouseX-20,mouseY+13,8,8);
ellipse(mouseX-10,mouseY+15,8,8);
ellipse(mouseX-13,mouseY+3,8,8);
        //lunares derechos
ellipse(mouseX+22,mouseY-3,8,8);
ellipse(mouseX+13,mouseY+25,8,8);
ellipse(mouseX+20,mouseY+13,8,8);
ellipse(mouseX+10,mouseY+15,8,8);
ellipse(mouseX+13,mouseY+3,8,8);
}

void mousePressed(){
  stroke(0);
  fill(33,134,5);
  ellipse(mouseX,mouseY,16,16);
}
void keyPressed(){
  background(255);
}

