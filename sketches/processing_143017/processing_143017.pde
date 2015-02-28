
//Aixi la defineixes com a variable
int posX;

//Inicialitzacions de pantalla, background, etc.
void setup(){
  background(159,240,250);
size(400,400);
  posX = 0;
  rectMode(CENTER);
}

//S'executa sempre
void draw(){
  background(159,240,250); 

//COS
  stroke (0);
  strokeWeight(2);
  fill(180,0,0); 
  rect(mouseX,mouseY,8*width/20,6*height/20); 
 
 //CABEZA
  stroke (0);
  strokeWeight(2);
  fill(255,0,0); 
  rect(mouseX-110,mouseY+10,3*width/20,5*height/20);

//CRISTAL
  stroke (0);
  strokeWeight(2);
  fill(206,250,255); 
  rect(mouseX-120,mouseY,2*width/20,2*height/20);
  
//LUZ
  stroke (0);
  strokeWeight(2);
  fill(255,158,0); 
  rect(mouseX-135,mouseY+40,width/40,height/20);
  
//RUEDA DELANTE
  stroke (0);
  strokeWeight(2);
  fill(0);
  ellipse(mouseX-80,mouseY+60,2*width/20,2*height/20);

//RUEDA DETRÁS
  stroke (0);
  strokeWeight(2);
  fill(0);
  ellipse(mouseX+40,mouseY+60,2*width/20,2*height/20);

//LLANTA DELANTE
  stroke (185);
  strokeWeight(2);
  fill(185);
  ellipse(mouseX-80,mouseY+60,width/20,height/20);

//LLANTA DETRÁS
  stroke (185);
  strokeWeight(2);
  fill(185);
  ellipse(mouseX+40,mouseY+60,width/20,height/20);

//ESCAPE
  stroke (0);
  strokeWeight(2);
  fill(0);
  line(mouseX+80,mouseY+60,mouseX+90,mouseY+60);

//BRILLO
  stroke (255);
  strokeWeight(5);
  fill(255);
  line(mouseX-135,mouseY,mouseX-120,mouseY-15);

//BRILLO
  stroke (255);
  strokeWeight(5);
  fill(255);
  line(mouseX-135,mouseY+10,mouseX-110,mouseY-15);

}


