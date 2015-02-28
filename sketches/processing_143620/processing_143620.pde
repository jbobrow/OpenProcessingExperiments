
float earX = 70;
float earY = 70;
int a;
int b;

void setup(){
  size(600,600);
  
}

void draw(){
  
  background(7,242,240);
  a=150;
  b=175;
  stroke(0);
  strokeWeight(1.1);
  noCursor();
//boca
  fill(255,0,0);
  beginShape();
  curveVertex(mouseX-25,mouseY+a);
  curveVertex(mouseX-25,mouseY+a);
  curveVertex(mouseX-5,mouseY+a+50);
  curveVertex(mouseX+50,mouseY+a+115);
  curveVertex(mouseX+97.5,mouseY+a+125);
  curveVertex(mouseX+a,mouseY+a+100);
  curveVertex(mouseX+a+20,mouseY+a);
//  curveVertex(mouseX+a+20,mouseY+a);
  endShape(CLOSE);
  
//dientes
  fill(255);
  beginShape();
  vertex(mouseX-25,mouseY+a);
  vertex(mouseX-15,mouseY+a+40);
  vertex(mouseX,mouseY+a);
  vertex(mouseX+15,mouseY+a+40);
  vertex(mouseX+30,mouseY+a);
  vertex(mouseX+45,mouseY+a+40);
  vertex(mouseX+60,mouseY+a);
  vertex(mouseX+75,mouseY+a+40);
  vertex(mouseX+90,mouseY+a);
  vertex(mouseX+105,mouseY+a+40);
  vertex(mouseX+120,mouseY+a);
  vertex(mouseX+135,mouseY+a+40); 
  vertex(mouseX+150,mouseY+a);
  vertex(mouseX+165,mouseY+a+40);
  vertex(mouseX+170,mouseY+a);
  endShape(CLOSE);
//ojos y nariz
  ellipse(mouseX,mouseY,width/5,height/5);
  ellipse(mouseX+width/5,mouseY,width/5,height/5);
  
  fill(mouseX);
  ellipse(mouseX+width/6,mouseY+height/6.25,width/100,height/100);
  ellipse(mouseX+width/12,mouseY+height/6,width/100,height/100);
  
  fill(0);
  ellipse(mouseX,mouseY,width/12,height/12);
  ellipse(mouseX+width/5,mouseY,width/12,height/12);
//orejas 
  beginShape();
  curveVertex(mouseX+10,mouseY-60);
  curveVertex(mouseX-70,mouseY-a+40); 
  curveVertex(mouseX-70-earX,mouseY-b+5+earY); 
  curveVertex(mouseX-70-earX*1.5,mouseY-b+5+earY*1.5);
  curveVertex(mouseX-70-earX*.6,mouseY-a+40+earY*1.6); 
  curveVertex(mouseX+10,mouseY+60);
  endShape();
  
  beginShape();
  curveVertex(mouseX+75,mouseY-60);
  curveVertex(mouseX+b,mouseY-a+40); 
  curveVertex(mouseX+b+earX,mouseY-b+5+earY); 
  curveVertex(mouseX+b+earX*1.5,mouseY-b+5+earY*1.5);
  curveVertex(mouseX+b+earX*.6,mouseY-a+40+earY*1.6); 
  curveVertex(mouseX+75,mouseY+60);
  endShape();
}


