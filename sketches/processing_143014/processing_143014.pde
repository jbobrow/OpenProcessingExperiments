
//programa de Queralt Trepat. 
//es mou el personatge seguint el cursor (el cursor està al nas de la kitty)



void setup(){
 size(400,400);
 background(255);
noCursor();

  
}

void draw(){
  background(255);
  
  //cara
  stroke(0);
  strokeWeight(4); 
  fill(255,255,255);
  ellipse(mouseX,mouseY-25,160,120);
  
  //nas
  stroke(0);
  strokeWeight(3); 
  fill(255,255,0);
  ellipse(mouseX,mouseY,15,10);
  
  //ull esquerre
  stroke(0);
  strokeWeight(2); 
  fill(0);
  ellipse(mouseX-42,mouseY-12,10,15);
  
  //ull dret
  stroke(0);
  strokeWeight(2); 
  fill(0);
  ellipse(mouseX+42,mouseY-12,10,15);
  
  //bigoti
   stroke(0);
  strokeWeight(4); 
  line(mouseX+70,mouseY-20,mouseX+98,mouseY-18);
  line(mouseX+69,mouseY-9,mouseX+93,mouseY-5);
  line(mouseX+62,mouseY+2,mouseX+85,mouseY+8);
  
  line(mouseX-70,mouseY-20,mouseX-98,mouseY-18);
  line(mouseX-69,mouseY-9,mouseX-93,mouseY-5);
  line(mouseX-62,mouseY+2,mouseX-85,mouseY+8);
  
  //orelles
  fill(255);
  arc(mouseX-15, mouseY-75, 100, 80, PI*0.9,PI*1.2); 
  arc(mouseX+15, mouseY-75, 100, 80,PI*-0.2,PI*0.1); 
 noFill();
  arc(mouseX-175, mouseY-75, 300, 80,PI*-0.2,-0.15); 
  arc(mouseX+175, mouseY-75, 300, 80,PI*0.9,PI*1.2);
  
   
   
  //llaç
  stroke(0);
  strokeWeight(3); 
  fill(255,0,0);
  ellipse(mouseX+32,mouseY-80,40,40);
  ellipse(mouseX+52,mouseY-60,40,40);
   ellipse(mouseX+32,mouseY-80,15,15);
  ellipse(mouseX+52,mouseY-60,15,15);
  ellipse(mouseX+42,mouseY-70,30,30);
  
  
  
}


