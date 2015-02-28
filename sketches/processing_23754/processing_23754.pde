

void setup() {
  size(200,200);
}

void draw() { 
  background(0);
  fill(255,0,0);

ellipseMode(CENTER);
rectMode(CENTER);


//head
rect(mouseX,mouseY-50,65,65);

//mouth

  rect(mouseX,mouseY,100,100);
  fill(255);
  
  rect(mouseX,mouseY,70,70);

//eyes
  smooth();
  fill(0,200,255);
  ellipse(mouseX-20,mouseY-70,20,20);
  ellipse(mouseX-15,mouseY-70,5,5);  
  
  ellipse(mouseX+15,mouseY-70,20,20);
  ellipse(mouseX+20,mouseY-70,5,5);
  
//teeth
  fill(225,255,mouseY);
  triangle(mouseX-35,mouseY-35,mouseX-25,mouseY+35,mouseX-15,mouseY-35);
  triangle(mouseX-15,mouseY-35,mouseX-5,mouseY+35,mouseX+5,mouseY-35);
  triangle(mouseX+5,mouseY-35,mouseX+15,mouseY+35,mouseX+25,mouseY-35);
  triangle(mouseX+25,mouseY-35,mouseX+35,mouseY+35,mouseX+35,mouseY-35); 

//legs
fill(150,mouseX,mouseY,255);
  rect(mouseX-15,mouseY+65,10,30);
  rect(mouseX+15,mouseY+65,10,30);
  
}              
