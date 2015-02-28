
void setup() {
  size(500,500);
}
void draw() {
  frameRate(40);
  int type = frameCount % 20;
  

  println(type);


  if(type == 0 ) {
    background (255);
  } 
  else if (type == 1) {
    background (0);
    smooth ();
   

  }
  


  noStroke();
  fill(255);
  ellipse(mouseX+25,mouseY-25,40,40);
  ellipse(mouseX+100, mouseY-25, 60, 20);
  fill(0);
  ellipse(mouseX+25,mouseY-25,30,30);
  ellipse(mouseX+25,mouseY-25,20,20);
  ellipse(mouseX+100, mouseY-25, 20, 20);
  fill(255);
  ellipse(mouseX+25,mouseY-25,10,10);
  ellipse(mouseX+100, mouseY-25, 10, 10);
  fill(0);
  ellipse(mouseX+25,mouseY-25,5,5);
  ellipse(mouseX+100, mouseY-25, 5, 5);

  
//MOUTH AND NOSE
  stroke(255);
  strokeWeight (8);
  fill(0);
  rect(mouseX +50,mouseY +20,20,50);
  ellipse(mouseX+60,mouseY+115,mouseX-40,mouseY-70);
}



