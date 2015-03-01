
/*Dibuix animat amb moviment de cursor*/

  
void setup() {

background(255,245,219);
size(500,500);


}

void draw() {
 

  //TORTUGA 1

noStroke();
background(255,245,219);

fill(0);
  text(" ("+ mouseX+","+mouseY+ " ) ",20,20);

if (mousePressed == true) {
  fill(56,111,62);
  ellipse(mouseX,mouseY,100,140); //closca
  
  fill(151,206,81);
  ellipse(mouseX,mouseY,85,125); //panxa
  
  ellipse(mouseX, mouseY-70,60,45); //boca
  ellipse(mouseX,mouseY-90,45,45); //ulls
  ellipse(mouseX-47,mouseY+20,25,25); //mà dreta
  ellipse(mouseX+47,mouseY+20,25,25); //mà esquerra  
  rect(mouseX-25,mouseY+50,20,50); //peu dret
  rect(mouseX+5, mouseY+50,20,50); //peu esquerra
  
  fill(242,241,210);
  rect(mouseX-20,mouseY-20,40,30); //panxa2
  ellipse(mouseX,mouseY+15,40,40); //panxa3
  
  fill(131,115,94);
  rect(mouseX+45,mouseY-100,10,200); //pal
  
  fill(193,192,191);
  rect(mouseX+45,mouseY,10,40); //cinta gris
  
  fill(101,45,126); //lila
  rect(mouseX-22,mouseY-95,45,10); //Cinta ulls
  rect(mouseX-25,mouseY+75,20,8); //cinta cama dreta
  rect(mouseX+5, mouseY+75,20,8); //cinta cama esquerra
  
}


  
  //TORTUGA 2
if (mousePressed == false ) {

  fill(56,111,62);
  ellipse(mouseX,mouseY,100,140); //closca
  
  fill(151,206,81);
  ellipse(mouseX,mouseY,85,125); //panxa
  
  ellipse(mouseX,mouseY-70,60,45); //boca
  ellipse(mouseX,mouseY-90,45,45); //ulls
  ellipse(mouseX-47,mouseY+20,25,25); //mà dreta
  ellipse(mouseX+47,mouseY+20,25,25); //mà esquerra  
  rect(mouseX-25,mouseY+50,20,50); //peu dret
  rect(mouseX+5,mouseY+50,20,50); //peu esquerra
  
  fill(242,241,210);
  rect(mouseX-20,mouseY-20,40,30); //panxa2
  ellipse(mouseX,mouseY+15,40,40); //panxa3
  
  
  fill(193,192,191);
  rect(mouseX+45,mouseY,10,30); //espasa
  rect(mouseX+35,mouseY,30,5); //espasa2
  triangle(mouseX+45,mouseY,mouseX+55,mouseY,mouseX+50,mouseY-35); 
  
  
  fill(255,43,5); //Vermell
  rect(mouseX-22,mouseY-95,45,10); //Cinta ulls
  rect(mouseX-25,mouseY+75,20,8); //cinta cama dreta
  rect(mouseX+5, mouseY+75,20,8); //cinta cama esquerra
  rect(mouseX+45,mouseY+10,10,5); //espasa
  
  
}


  
}



