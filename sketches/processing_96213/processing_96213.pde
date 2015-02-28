

//fons//
void setup()
{
  size(500,500);
  background(#0C19F5);
  rectMode(CENTER);
  colorMode(RGB, height, height, 200);
  noCursor();  
}


//esferes//
void draw() 
{
  background(#2C2C71);
  strokeWeight(3);
  stroke(#FFFFFF);
  
//De la següent manera fem una ellipse inversa a la que centrem el//
//cursor perque surti oposada//

  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  
//unió entre les dues elipses// 

  line(mouseX,mouseY,inverseX,inverseY);
  
  fill(mouseX,50,mouseY);
  ellipse(mouseX,mouseY,mouseX/4,mouseY/4);
  
  fill(mouseX,50,mouseY);
  ellipse(inverseX,inverseY,inverseY/4,inverseX/4);
  
}



