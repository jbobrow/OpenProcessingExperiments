
//La diferenciem com a variable
int posX;

//Inicialitzacions del programa
void setup(){
  size(400,400);
  background(230,255,255);
  posX = 0;
  rectMode(CENTER);
}

//S'executa sempre
void draw(){
  background(230,255,255);
  
  //estructura principal  
  strokeWeight(1);
  stroke(20,220,55);
  fill(20,220,55);
  rect(mouseX,mouseY,9*width/20,4*height/20);  
  
  //porta
  stroke(16,170,39);
  fill(20,220,55);
  rect(mouseX+50,mouseY-50,4*width/20,7*height/20);
  
  //taulada
  stroke(100,40,40);
  fill(100,40,40);
  rect(mouseX+40,mouseY-130,5*width/20,1*height/20);
  strokeWeight(0);
  
  //finestra
  stroke(60,108,108);
  fill(93,255,255);
  rect(mouseX+50,mouseY-80,2*width/20,2*height/20);
  
  //xamaneia
  stroke(20,220,55);
  fill(20,220,55);  
  rect(mouseX-60,mouseY-50,1*width/20,1*height/20);  
  triangle(mouseX-82,mouseY-70,mouseX-60,mouseY-50,mouseX-40,mouseY-70);
  
  //rodes
  stroke(0);
  fill(0);
  ellipse(mouseX-50,mouseY+50,3*width/20,3*height/20);
  fill(110,110,110);
  ellipse(mouseX-50,mouseY+50,1*width/20,1*height/20);
  
  fill(0);
  ellipse(mouseX+50,mouseY+50,3*width/20,3*height/20);
  fill(110,110,110);
  ellipse(mouseX+50,mouseY+50,1*width/20,1*height/20);
  
  //pany
  fill(0);
  ellipse(mouseX+25,mouseY-20,0.5*width/20,0.5*height/20);
  
}


