
void setup() {
  size(200, 200);
}

void draw() {
  //lichaam
  background(255);
  rectMode(CENTER) ;
  stroke(0);
  fill(22,84,186);
  ellipse(mouseX-25,mouseY+35,30,15);
  ellipse(mouseX+25,mouseY+35,30,15);
  
  //gezicht
  fill(22,84,186);
  ellipse(mouseX,mouseY,100,75);

  //ogen
  fill(255);
  ellipse(mouseX-25, mouseY-25,25,40);
  
  fill(255);
  ellipse(mouseX+25, mouseY-25,25,40);
  
   //binnenogen
  fill(0,255,0);
  ellipse(mouseX-25, mouseY-25,15,15);
  
  fill(0,255,0);
  ellipse(mouseX+25, mouseY-25,15,15);
  
  //pupillenogen
  fill(0);
  ellipse(mouseX-25, mouseY-25,5,5);
  
  fill(0);
  ellipse(mouseX+25, mouseY-25,5,5);

  //mond
  fill(255);
  rect(mouseX, mouseY+15,50,1);
  
  //tand
  fill(255);
  triangle(mouseX+5, mouseY+15, mouseX+15, mouseY+15, mouseX+10, mouseY+25);
  
  fill(255);
  triangle(mouseX-15,mouseY+15,mouseX-5,mouseY+15,mouseX-10,mouseY+25);
  }
  
