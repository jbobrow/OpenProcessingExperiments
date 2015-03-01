
float mida=30;
//size (255,255);
 
void setup() {
  size (255, 255);
}

void draw()  {
  background (0);
  strokeWeight(3);

//rodones
  stroke(0);
  ellipse(mouseX,mouseY,mouseY,mouseY);
  ellipse(mouseX,mouseY,mouseY/2,mouseY/2);
  ellipse(mouseX,mouseY,mouseY/4,mouseY/4);
  ellipse(mouseX,mouseY,mouseY/8,mouseY/8);
  
  fill(15,150,mouseX);
  ellipse(mouseX+mida,mouseY+mida,mouseY/2,mouseY/2);
  ellipse(mouseX-mida,mouseY-mida,mouseY/2,mouseY/2);
  ellipse(mouseX+mida,mouseY-mida,mouseY/2,mouseY/2);
  ellipse(mouseX-mida,mouseY+mida,mouseY/2,mouseY/2);
  
  fill(180,230,mouseX);
  ellipse(mouseX+mida,mouseY+mida,mouseY/4,mouseY/4);
  ellipse(mouseX-mida,mouseY-mida,mouseY/4,mouseY/4);
  ellipse(mouseX+mida,mouseY-mida,mouseY/4,mouseY/4);
  ellipse(mouseX-mida,mouseY+mida,mouseY/4,mouseY/4);
  
  fill(200,20,mouseX);
  ellipse(mouseX+mida,mouseY+mida,mouseY/8,mouseY/8);
  ellipse(mouseX-mida,mouseY-mida,mouseY/8,mouseY/8);
  ellipse(mouseX+mida,mouseY-mida,mouseY/8,mouseY/8);
  ellipse(mouseX-mida,mouseY+mida,mouseY/8,mouseY/8);
  
//linies
  line(mouseX+mida,mouseY-mida,mouseX-mida,mouseY-mida);
  line(mouseX-mida,mouseY+mida,mouseX-mida,mouseY-mida);
  line(mouseX-mida,mouseY+mida,mouseX+mida,mouseY+mida);
  line(mouseX+mida,mouseY-mida,mouseX+mida,mouseY+mida);
 
}
