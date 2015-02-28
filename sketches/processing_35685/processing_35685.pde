
//Miles Thomas, Computational Methods
void setup() {
  size(300, 300);
}



void draw() {
  background(mouseX,mouseY,width);

  fill(mouseX,0,mouseY);
  triangle(mouseX,mouseY,300,300,0,300);
  
  fill(0, mouseX, mouseY);
  ellipse(mouseX, mouseY, mouseX, mouseY);


  //rectangle will stay centered from its center point but the width will change as the ellipse passes around it's front and back
  fill(255, 255, 0);
  rectMode(CENTER);
  rect(150, 150, mouseX, 40);
  
  //ellipse will occur in front of the rectangle but stay centered with the changing values of the other ellipse
  fill(255, mouseY, 0); 
  ellipse(mouseX, mouseY, 40, 40);
  
  fill(255,0,0);
  ellipse(100,100,mouseX/2,mouseY/2);
  ellipse(200,100,mouseY/4,mouseX/4);
  ellipse(100,200,mouseX/8,mouseY/8);
  ellipse(200,200,mouseY/10,mouseX/10);
  
}


