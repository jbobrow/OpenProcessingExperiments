
void setup(){
size(600,600);
background(255);
strokeWeight(10);
noCursor();
smooth();
}


void draw(){

//tres de arriba

stroke(0);

fill(255);
rect(0,0,250,50);

fill(255,255,0);
if (mouseX >= 0 && mouseX <= 50 && mouseY >= 275 &&  mouseY <= 500){
  fill(255,0,255);
  }
rect(250,0,250,50); //amarillo

fill(0);
rect(500,0,100,100); //negro

//dos de la izquierda
fill(255);
rect(0,50,50,225);

fill(0,0,255); 
if (mouseX >= 500 && mouseX <= 600 && mouseY >= 550 &&  mouseY <= 600){
  fill(0,255,255);
  }
rect(0,275,50,225);//azul

//centro
fill(255);
rect(50,50,450,450); 

//abajo
rect(0,500,500,100);

//dos de la derecha abajo
rect(500,100,100,450);

fill(255,0,0);
if (mouseX >= 250 && mouseX <= 500 && mouseY >= 0 &&  mouseY <= 50){
  fill(0,255,0);
  }
rect(500,550,100,50); //rojo


noFill();

stroke(200);
if (mouseX >= 500 && mouseX <= 600 && mouseY >= 0 &&  mouseY <= 100){
  fill(0);
  }
rect(0,0,600,600);

noStroke();
fill(0);
if (mouseX >= 500 && mouseX <= 600 && mouseY >= 0 &&  mouseY <= 100){
  fill(255);
  }
ellipse(mouseX,mouseY,10,10);

}
