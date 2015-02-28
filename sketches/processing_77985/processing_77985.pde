
void setup (){
  size (400, 400);
  background (0);
}
void draw (){
  noStroke();
  fill (255);
//Per obtenir un nou pulsar la tecla de l'espai 
  if (key == ' ' || key == ' '){
      background(0);}
//Pel color vermell pulsar r
  if (key == 'r'){
      fill (#FF0000);
      rect ( mouseX, mouseY,10,10);}
//Pel color verd pulsar g
  if (key == 'g'){
    fill (#00FF0A);  
    rect (mouseX,mouseY,10,10);}
//Pel color blanc pulsar w
  if (key == 'w'){
    fill (#FAFFFA);  
    rect (mouseX,mouseY,10,10);}
//Pel color groc pulsar y
  if (key == 'y'){
    fill (#FEFF00);  
    rect (mouseX,mouseY,10,10);}
//Pel color blau pulsar b
  if (key == 'b'){
    fill (#0028FF);  
    rect (mouseX,mouseY,10,10);}
//Pel color taronja pulsar o
  if (key == 'o'){
    fill (#FC8403);  
    rect (mouseX,mouseY,10,10);}
//Pel color rosa pulsar p
  if (key == 'p'){
     fill (#FC03C3);
     rect (mouseX,mouseY,10,10);}
//Per esborrar un tros pulsar d
  if (key == 'd'){
    fill (#050505);
    rect (mouseX,mouseY,10,10);}
}
    
    
      
  

