
void setup() {
  size(200,200);
}

void draw() {
  background(255);
  
  //cape
  fill(255,0,0);
  triangle(mouseX-70,mouseY+60,mouseX,mouseY-70,mouseX+70,mouseY+60);
  
  //body
  stroke(0);
  //fill(0,12,168);
  fill(58,204,0);
  rectMode(CENTER);
  rect(mouseX,mouseY,56,90);
 
  //head
  //fill(0,200,255);
  ellipse(mouseX,mouseY-40,70,70);
  
  //hear
  line(mouseX,mouseY-75,mouseX-10,mouseY-90);
  line(mouseX,mouseY-75,mouseX-17,mouseY-85);
  line(mouseX,mouseY-75,mouseX+10,mouseY-93);

  //eye
  fill(255);
  ellipse(mouseX,mouseY-45,25,25);
  fill(0);
  ellipse(mouseX,mouseY-45,10,10);

  //mouth
  line(mouseX-17,mouseY-27,mouseX+17,mouseY-27);
  fill(255);
  triangle(mouseX-6,mouseY-27,mouseX,mouseY-18,mouseX+6,mouseY-27);
  triangle(mouseX-14,mouseY-27,mouseX-10,mouseY-21,mouseX-6,mouseY-27); //left tooth
  triangle(mouseX+6,mouseY-27,mouseX+10,mouseY-21,mouseX+14,mouseY-27); //right tooth
  

  //arm left
  fill(0);
  line(mouseX-28,mouseY-5,mouseX-42,mouseY+8);
  line(mouseX-42,mouseY+8,mouseX-30,mouseY+20);
  ellipse(mouseX-30,mouseY+20,10,10);

  //arm right
  line(mouseX+28,mouseY-5,mouseX+42,mouseY+8);
  line(mouseX+42,mouseY+8,mouseX+30,mouseY+20);
  ellipse(mouseX+30,mouseY+20,10,10);
   
  //legs
  line(mouseX-10,mouseY+45,mouseX-10,mouseY+80);
  line(mouseX+10,mouseY+45,mouseX+10,mouseY+80);
}
