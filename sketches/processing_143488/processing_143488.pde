
void setup(){
 noCursor();
  size(500,500);
  background(0);
}

void draw(){
  background(0);
  
  
  //cap_blau
  fill(61,198,244);
  stroke(0);
  ellipse(mouseX,mouseY,150,150);
  
//cos_blanc
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(mouseX,mouseY+10,130,120);
  
  //ull_esquerre
    stroke(0);
  ellipse(mouseX-20,mouseY-40,40,50);
  
  //ull_dret
      stroke(0);
  ellipse(mouseX+20,mouseY-40,40,50);
  
  //ull_negre_esquerre
  stroke(0);
  fill(0);
  ellipse(mouseX-15,mouseY-35,15,20);
  
  
  //ull_negre_dret
    stroke(0);
  fill(0);
  ellipse(mouseX+15,mouseY-35,15,20);
  
  
  //ull_blanc_dret
  stroke(255);
  fill(255);
  ellipse(mouseX+12,mouseY-35,4,7);
  
  
  //ull_blanc_esquerre
  stroke(255);
  fill(255);
  ellipse(mouseX-12,mouseY-35,4,7);
  
  
  //nas
  stroke(0);
  fill(250,76,79);
  ellipse(mouseX,mouseY-16,20,20);
  fill(255);
  stroke(255);
  ellipse(mouseX-2,mouseY-22,4,4);
    
  //boca
  stroke(0);
  arc(mouseX,mouseY+10,100,80,0,PI);
  line(mouseX,mouseY,mouseX,mouseY+50);
line(mouseX,mouseY,mouseX,mouseY-7);
  
  
  //collar
  
   fill(234,59,59);
   stroke(0);
  rect(mouseX-48,mouseY+60,95,7.5);
  fill(0);
  rect(mouseX-50,mouseY+68,120,20,5);
  
  //cascavell
 fill(247,203,40);
  ellipse(mouseX,mouseY+73,28,28);
  stroke(0);
  rect(mouseX-13,mouseY+67,27,2,4);
 fill(198,160,18);
 ellipse(mouseX,mouseY+76,5,5);
 stroke(0);




//bigotis 
line(mouseX-15,mouseY+5,mouseX-60,mouseY+5);
line(mouseX+15,mouseY+5,mouseX+60,mouseY+5);
line(mouseX-14,mouseY+15,mouseX-55,mouseY+25);
line(mouseX+14,mouseY+15,mouseX+55,mouseY+25);
line(mouseX-14,mouseY-1.5,mouseX-54,mouseY-20);
line(mouseX+14,mouseY-1.5,mouseX+54,mouseY-20);


}


