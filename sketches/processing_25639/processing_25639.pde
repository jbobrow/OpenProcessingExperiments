
//buttons

boolean red = false;
boolean blue = false;
boolean green = false;

void setup (){
size (800,500);
background(255);


}


void draw (){
rectMode(CENTER);
noStroke();
fill(255,0,0);
rect(100,460,80,60);

fill(0,255,0);
rect(400,460,80,60);

fill(0,0,255);
rect(700,460,80,60);

//boton rojo
if (red) {

if (keyPressed == true ) {
  strokeWeight(4);
  stroke(255,0,0,50);
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( random(255), random(255), random(255)   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( random(255), random(255), random(255)   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( random(255), random(255), random(255)   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) ); 


}
}

else {


fill( random(255), random(255), random(255)   );



}

//boton verde
if (green) {

if (keyPressed == true ) {
  strokeWeight(4);
  stroke(0,255,0,50);
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( random(255), random(255), random(255)   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( random(255), random(255), random(255)   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( random(255), random(255), random(255)   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) ); 


}
}

else {


fill( random(255), random(255), random(255)   );



}


//boton azul
if (blue) {

if (keyPressed == true ) {
  strokeWeight(4);
  stroke(0,0,255,50);
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( 0,0,255,50 );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( 0,0,255,50   );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) );
fill( 0,0,255,50 );
line (mouseX, mouseY, mouseX+random(-50,50), mouseY+random(-50,50) ); 


}
}

else {


fill( random(255), random(255), random(255)   );



}

}

void mousePressed () {

if ((mouseX > 60) && (mouseX < 140) && (mouseY > 430 )&& (mouseY < 490 )) {

red =!red;
green = false;
blue= false;

}

if ((mouseX > 360) && (mouseX < 440) && (mouseY > 430 )&& (mouseY < 490 )) {

green =!green;
red = false;
blue= false;
}



if ((mouseX > 660) && (mouseX < 740) && (mouseY > 430 )&& (mouseY < 490 )) {

blue =!blue;
red = false;
green= false;
}

}


