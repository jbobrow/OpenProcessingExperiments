
float escala = 1.5;
float variacio = 50.0;
float mida = 100.0;
float quadrat = 10.0;
float posic = 20;


void setup() {
  size(255,255);
  stroke(0);
}

void draw(){
  //dibuix
  background(random(20,150),mouseX,mouseY);
  
    //Estrelles
  fill(random(255));
  stroke(0);
  strokeWeight(0.5);
  rect(width/10,posic,quadrat,quadrat);
  rect(width/10,posic+40,quadrat,quadrat);
  rect(width/10,posic+80,quadrat,quadrat);
  rect(width/10,posic+120,quadrat,quadrat);
  rect(width/10,posic+160,quadrat,quadrat);
  rect(width/10,posic+200,quadrat,quadrat); 
   rect(width/4,posic,quadrat,quadrat);
  rect(width/4,posic+40,quadrat,quadrat);
  rect(width/4,posic+80,quadrat,quadrat);
  rect(width/4,posic+120,quadrat,quadrat);
  rect(width/4,posic+160,quadrat,quadrat);
  rect(width/4,posic+200,quadrat,quadrat);
   rect(width/2.5,posic,quadrat,quadrat);
    rect(width/2.5,posic+40,quadrat,quadrat);
  rect(width/2.5,posic+80,quadrat,quadrat);
  rect(width/2.5,posic+120,quadrat,quadrat);
  rect(width/2.5,posic+160,quadrat,quadrat);
  rect(width/2.5,posic+200,quadrat,quadrat);
  
  
  //estel
  fill(mouseY,mouseX,3,mouseX);
  strokeWeight(2);
  triangle(mouseX,mouseY/5,mouseY/escala,mouseY-variacio,mouseY*escala,mouseY-variacio);
  fill(230,mouseY,mouseX,mouseY);
  triangle(mouseY/escala,mouseY-variacio,mouseX,mouseY,mouseY*escala,mouseY-variacio);
  stroke(0,0,0,mouseY);
  line(mouseX,mouseY,mouseX,mouseY/5);
  line(mouseX,mouseY,120,255);
  
  //Globus1
  stroke(0,0,0,mouseY);
  line(mouseX-60,mouseY,60,255);
  fill(mouseX+50,mouseY-30,36);
  strokeWeight(2);
  ellipse(mouseX-60,mouseY-20,mouseX/2,mouseY/2);
  
  //Globus2
  stroke(0,0,0,mouseY);
  line(mouseX+60,mouseY+30,160,255);
  fill(mouseX,mouseY,mouseX);
  strokeWeight(2);
  ellipse(mouseX+60,mouseY+30,mouseX/6,mouseY/3);
 
  
  
}

 
