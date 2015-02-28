
//Nil Vidal
//dibuix que es mogui en el seu complet seguint el moviment del ratolí.

void setup(){
  noCursor();
  background(255);
  size(800,800);
  
}

void draw(){
  background(255);
 
//miralls
ellipse(mouseX-55,mouseY-10,15,10);
ellipse(mouseX+55,mouseY-10,15,10);

//vidre
stroke(0);
strokeWeight(4);
fill(182,242,250);
 rect(mouseX-50,mouseY-50,100,60,40,40,0,0);
 
 //parabrises
stroke(0);
strokeWeight(2);
line(mouseX+2,mouseY-5,mouseX+30,mouseY-30);

 
 //rodes
 stroke(0);
 fill(0);
 rect(mouseX-50,mouseY+2,15,50,0,0,5,5);
 
 rect(mouseX+35,mouseY+2,15,50,0,0,5,5);
 
 //part central
 strokeWeight(2);
 fill(255,0,0);
 rect(mouseX-60,mouseY-10,120,50,30,30,15,15);
 
 //llums esquerra
 strokeWeight(1);
 fill(255,247,3);
 ellipse(mouseX-45,mouseY+5,20,20);
 ellipse(mouseX-35,mouseY+20,10,10);
 
 //llums dreta
 strokeWeight(1);
 fill(255,247,3);
 ellipse(mouseX+45,mouseY+5,20,20);
 ellipse(mouseX+35,mouseY+20,10,10);
 
 //matricula
 fill(255);
 rect(mouseX-20,mouseY+25,40,10);
 
 //lletres matricula
textSize(7);
fill(0);
 text("0637 FHP",mouseX-14,mouseY+33);
 
 //mercedes
 fill(200);
ellipse(mouseX,mouseY,12,12);
line(mouseX,mouseY,mouseX,mouseY-6);
line(mouseX,mouseY,mouseX-4.5,mouseY+3);
line(mouseX,mouseY,mouseX+4.5,mouseY+3);

//radiador
line(mouseX-22,mouseY+12,mouseX+22,mouseY+12);
line(mouseX-22,mouseY+14,mouseX+22,mouseY+14);  
line(mouseX-22,mouseY+16,mouseX+22,mouseY+16);
line(mouseX-22,mouseY+18,mouseX+22,mouseY+18);


}


