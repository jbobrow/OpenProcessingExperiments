


int posicionX;

void setup(){
smooth();
size(900,700);

posicionX=6;
 
}

void draw(){
  
  //FondoNaranja
background(243,146,0);
//FondoAzul
fill(0,186,238);
noStroke();
rect(0,350,900,700);

//Sol
fill(255,237,0);
ellipse(700,100,100,100);


//recV
noFill();
stroke(0);
fill (0,19,252);
rect(posicionX+200,150,-10,150);

//TRian
fill(0);
triangle(posicionX+200,150,posicionX+290,200,posicionX+200,250);

//Lineas
fill(188,188,188);
noStroke();
rect(posicionX+50,370,50,3);
rect(posicionX+60,385,40,3);
rect(posicionX+30,400,63,3);


//BArc
strokeWeight(4);
fill(230,0,126);
quad(posicionX+70,300,posicionX+400,300,posicionX+300,400,posicionX+150,400); 

posicionX=posicionX+1;
 
 
posicionX=posicionX+1;
 
}
