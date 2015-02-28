
//AUTOR: ARANTXA PAVIA LOPEZ DE FELIPE
//TABLA DE DIBUJO

void setup(){
size(400,300);
smooth();
background(250,5,140);
}

void draw(){
   
  
// background(250,5,140);
 
 //linia
 fill(5,27,250);
 stroke(5,27,250);
ellipse(mouseX-25,mouseY-15,15,15);

  //cambio de colores
  //color aleatorio
if(key=='n'||key=='N'){
  fill(random(255),random(255),random(255));
  rect(mouseX,mouseY,random(15,30),random(15,30));
}
  //CON LETRA W
if(key=='w'||key=='W'){
  fill(249,250,5);
stroke(249,250,5);
rect(mouseX-25,mouseY-15,15,15);
}
//letra s
if(key=='s'||key=='S'){
fill(250,17,5);
stroke(250,17,5);
ellipse(mouseX-25,mouseY-15,15,15);
}
//letra h
if(key=='h'||key=='H'){
fill(61,250,5);
stroke(61,250,5);
rect(mouseX-25,mouseY-15,15,15);
}


 //Goma de Borrar
if (mousePressed){
fill(250,5,140);
  stroke(250,5,140);
  ellipse(mouseX-25,mouseY-15,50,50);  
} }

 

void mousePressed(){
}

