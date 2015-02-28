
void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER); 
 
  // Body
  stroke(0);
  fill(#67C8FF );
  rect(mouseX,mouseY,60,100);
  fill(250);
  ellipse(mouseX, mouseY, 16, 50);
  ellipse(mouseX,mouseY, 20, 20);
  
  // Head
  fill( #FEE5AC );
  ellipse(mouseX,mouseY-30,90,60); 
  
  // Eyes
  fill(250); 
  ellipse(mouseX-30,mouseY-30,25,25); 
  ellipse(mouseX+30,mouseY-30,25,25);
  fill(0);
  ellipse(mouseX+30,mouseY-30,10,10);
  ellipse(mouseX-30,mouseY-30,10,10); 
  
  // Mouth
  line(mouseX-20,mouseY-10,mouseX+20,mouseY-10);
  
  // Legs
  fill(#2E2E2E);
  rect(mouseX,mouseY+65,60,30);
  fill(0);
  rect(mouseX,mouseY+70,2,20);
  
  // Shoes
  rect(mouseX,mouseY+83,85,4);
  
  //Arms
  fill(#67C8FF);
  rect(mouseX-35,mouseY+18,10,50);
  rect(mouseX+35,mouseY+18,10,50);
  fill(#FEE5AC);
  ellipse(mouseX-35,mouseY+48,15,15);
  ellipse(mouseX+35,mouseY+48,15,15);
}


