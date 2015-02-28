
//Carlos Borràs
//Dibuix exercici primer amb moviment mouse

void setup(){
  noCursor();
size(500,500);
  background(0);
stroke(179,216,68);
  
}

void draw(){
  background(0);
  fill(179,216,68);
 
//COS
rect(mouseX-50,mouseY-50,100,100,1,1,20,20);

//PEU DRET
rect(mouseX+10,mouseY+20,30,80,100);
//PEU ESQUERRA
rect(mouseX-40,mouseY+20,30,80,100);

//BRAÇ ESQUERRA
rect(mouseX+55,mouseY-50,30,80,100);
//BRAÇ DRETA
rect(mouseX-85,mouseY-50,30,80,100);

//ANTENA1
strokeWeight(3);
line(mouseX+20,mouseY-120,mouseX+3,mouseY-65);
//ANTENA2
line(mouseX-20,mouseY-120,mouseX+3,mouseY-65);

//CARA
fill(179,216,68);
arc(mouseX,mouseY-55,100,100,PI,2*PI);

//ULL1

fill(0);
arc(mouseX+20,mouseY-80,10,10,PI,4*PI);
//ULL2
arc(mouseX-20,mouseY-80,10,10,PI,4*PI);

//TEXT
fill(179,216,68);
text("ANDROID",mouseX-25,mouseY+125);

}




