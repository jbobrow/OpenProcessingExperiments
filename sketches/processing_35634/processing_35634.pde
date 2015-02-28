
void setup(){	
size(300,300);
background(18,131,250);	
   }	

void draw(){
  background(18,131,250);
  
  //beak
  fill(255,204,0);
  triangle(220,35,240,20,235,45);
  fill(255,0,0);
  
  //head
  ellipseMode(CENTER);
  ellipse(218,55,40,40);
  
  //body
  beginShape();
  vertex(205,70);
  vertex(215,75);
  vertex(230,105);
  vertex(210, 170);
  vertex(145,265);
  vertex(130,275);
  endShape();
  
  //wing	
  triangle(mouseX,mouseY,197,90,168,170);
  
  //eye
  fill(0,0,0);
  ellipse(215,45,5,5);
}

void mousePressed() {	
  background(18,131,250); 	
}


