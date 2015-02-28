
color fons=color(150,200,0);
color verd=color(200,250,0);
void setup(){
  size(500,500);
  
  
}

void draw(){
  
  noCursor();
  fons();
  variacolor();
  dibuix();
  
  
}

void dibuix(){
  
 noStroke();

 //cos
rectMode(CENTER);
rect(mouseX, mouseY, 150, 150, 0, 0, 20, 20);

//potes
rectMode(CORNER);
rect(mouseX+5,mouseY+45, 40, 75, 40, 40, 40, 40);
rect(mouseX-45,mouseY+45, 40, 75, 40, 40, 40, 40);

//braços
rect(mouseX+85,mouseY-90, 40, 125, 60, 60, 60, 60);
rect(mouseX-125,mouseY-90, 40, 125, 60, 60, 60, 60);


//cap
ellipse(mouseX,mouseY-75, 150, 150);
fill(fons);
rectMode(CENTER);
rect(mouseX,mouseY-70, 150, 5);
ellipse(mouseX+35,mouseY-110, 15, 15);
ellipse(mouseX-35,mouseY-110, 15, 15);

//antenes
stroke(verd);
strokeWeight(5);
line(mouseX+60,mouseY-175,mouseX,mouseY-80);
line(mouseX-60,mouseY-175,mouseX,mouseY-80);

}
void fons(){
  background(fons);
  noFill();
  stroke(0);
  ellipse(width/2,height/2,300,300);
  
}

void variacolor(){
fill(verd);
  
}


