
float angulo = 0.0;
PImage imagen;
PImage imagen2;

void setup(){
  size(600, 600);
  frameRate(20);
  smooth();
    noStroke();
    imagen = loadImage ("22 de enero 047.jpg"); 
   imagen2=loadImage("22 de enero 096.jpg"); 
}

void draw(){
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  
  angulo = angulo + 0.5;
  translate(300, 300);
  rotate(angulo);
  //rect(0, 0, 100, 100);
   image (imagen, 10, 10, 60, 60 );
  angulo=angulo+0.1;
 // translate(250, 200); //probar sin translate
  fill(250, 189, 189, 100);
  rotate(angulo);
  image(imagen2,0, 0, 80, 80);
  angulo = angulo + 0.10;
  translate(150, 150);
  rotate(angulo);
  //rect(0, 0, 100, 100);
   image (imagen, 10, 10, 60, 60 );
  angulo=angulo+0.1;
 // translate(250, 200); //probar sin translate
  fill(250, 189, 189, 100);
  rotate(angulo);
  image(imagen2,10, 10, 80, 80);
}

