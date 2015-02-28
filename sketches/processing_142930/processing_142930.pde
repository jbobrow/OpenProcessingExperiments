

void setup(){
  size(500,500);
  background(0);

}

void draw(){
  background(0);
  


  stroke(0);
  fill(178,174,174);
  ellipse(mouseX-80,mouseY-200,150,150);//oreja
  
   stroke(0);
  
  fill(237,163,220);
  ellipse(mouseX-80,mouseY-200,90,90);//oreja int
  
    stroke(0);
  fill(178,174,174);
  ellipse(mouseX+80,mouseY-200,150,150);//oreja derecha
  
  fill(237,163,220);
  ellipse(mouseX+80,mouseY-200,90,90);//oreja int
 
    stroke(0);
  fill(178,174,174);
  ellipse(mouseX,mouseY-100,200,300);//Cabeza
  

  stroke(178,174,174);
  fill(178,174,174);
  ellipse(mouseX,mouseY-10,250,310);//boca
   
 
    stroke(0);
   fill(0);
  ellipse(mouseX,mouseY-30,150,310);//boca negro
  
stroke(0);
fill(225);
rect(mouseX,mouseY+50,30,45);
rect(mouseX-32,mouseY+50,30,45);//dientes

  
  stroke(0);
  fill(225);
  ellipse(mouseX-40,mouseY-105,80,150);//pupila
  
    stroke(0);
  fill(0);
  ellipse(mouseX-40,mouseY-105,50,50);//pup 2
  
   stroke(0);
  fill(225);
  ellipse(mouseX+40,mouseY-105,80,150); //pupila derecha
  
  stroke(0);
  fill(0);
  ellipse(mouseX+40,mouseY-105,50,50); //pup2

 stroke(0);
    fill(0);
  ellipse(mouseX,mouseY-8,200,150);//ocico negro
  
  stroke(0);
    fill(225);
  ellipse(mouseX,mouseY-14,200,150);//ocico
  

  fill(237,163,220);
  ellipse(mouseX,mouseY,60,70);//nariz
    
}


