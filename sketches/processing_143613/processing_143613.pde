
// Victor sarroca. P2b). Automòbil (Pick up) que es mou amb el mouse.
int a; //Definim a i b per tal de simplificar els paràmetres width i height.
int b;
void setup(){
  size(600,600);
  a=(width/14);
  b=(height/14);
}
void draw(){
  background(150,250,245);
 rectMode(CENTER);
 rect(a*7,12*b,14.6*a,5*b);

// Rodes
strokeWeight(4);
fill(180,180,180);
ellipse(mouseX-2*a,mouseY+b,a,b);
ellipse(mouseX+1.5*a,mouseY+b,a,b);

//cos principal
strokeWeight(2); 
stroke(0);
fill(30,227,16);
rectMode(CENTER);
rect(mouseX,mouseY,6*a,1*b);

rect(mouseX-0.5*a,mouseY-0.1*b,2*a,0.75*b); //porta
line(mouseX,mouseY-0.25*b,mouseX+0.25*a,mouseY-0.25*b); //mànec porta

fill(210,250,240); //cabina
rectMode(CENTER);
rect(mouseX-0.5*a,mouseY-b,2*a,1*b);

triangle(mouseX-1.5*a,mouseY-0.5*b,mouseX-2*a,mouseY-0.5*b,mouseX-1.5*a,mouseY-1.46*b); //finestra

line(mouseX+1.5*a,mouseY-0.5*b,mouseX+0.5*a,mouseY-1.5*b); 

fill(250,135,18); //llums
rectMode(CENTER);
rect(mouseX-2.85*a,mouseY-0.35*b,0.25*a,0.25*b);







  
}


