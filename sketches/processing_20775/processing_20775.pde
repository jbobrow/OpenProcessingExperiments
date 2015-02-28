
void setup(){
  size(450,450);  
}
void draw(){
  //background cielo azul
  background(201,253,255);
 //pasto verde
  noStroke();
  fill(169,248,130);
  rectMode(CENTER);  
  rect(225,438,450,25);
    //nubes
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  smooth();
  //nube grande
  ellipse(225,100,120,60);
  ellipse(249,70,80,60);
  ellipse(280,90,120,60);
  //nube chica der.
  ellipse(449,225,100,60);
  ellipse(430,260,120,60);
  //nube chica izq.
  ellipse(10,200,60,30);
  ellipse(25,225,90,30);
  ellipse(15,210,60,30);
  
  //PANDA>>>>>
  //piernas
  frameRate(50);
  stroke(0);
  strokeWeight(30);
  line(pmouseX-20,pmouseY+50,mouseX-10,mouseY+40);
  line(pmouseX+20,pmouseY+50,mouseX+10,mouseY+40);
  //cuerpo
  strokeWeight(5);
  fill(255);
  ellipse(mouseX,mouseY,120,100);
  //franja negra
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY-40,100,70);
  //brazo izq.
  ellipse(mouseX-60,mouseY-10,30,30);
  //brazo der.
  ellipse(mouseX+60,mouseY-10,30,30);
    //orejas
  fill(0);
  ellipse(mouseX+55,mouseY-100,20,20);
  ellipse(mouseX-55,mouseY-100,20,20);
  //cabeza
  fill(255);
  ellipse(mouseX,mouseY-65,120,110);
 
  //ojos negro
  fill(0);
  ellipse(mouseX-30,mouseY-70,50,50);
  ellipse(mouseX+30,mouseY-70,50,50);
 
  //ojos blanco
  fill(255);
  ellipse(mouseX-25,mouseY-65,25,25);
  ellipse(mouseX+25,mouseY-65,25,25);
    //ojos pupila (negro)
  fill(0);
  ellipse(mouseX-25,mouseY-57,15,15);
  ellipse(mouseX+25,mouseY-57,15,15);
  //nariz/boca
  triangle(mouseX,mouseY-38,mouseX-2,mouseY-40,mouseX+2,mouseY-40);
  
}
  
  

