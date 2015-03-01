
float mida = 100;
float radi = 50;



void setup () {
  size(800, 800);
}

void draw () {
  background (0);
  radi = mouseY;
  stroke(255, 0, 0);
  strokeWeight(5);

  fill(mouseX/5, mouseX/10, 50);
  ellipse (mouseX, mouseY, 0.5*radi, 0.5*radi);

  
  fill(mouseX/5, mouseX/5, mouseX);
  ellipse (mouseX-mida, mouseY-mida, 0.3*radi, 0.3*radi);



  ellipse (mouseX+mida, mouseY+mida, 0.3*radi, 0.3*radi);

 
 fill(mouseX/3, mouseX/4, 50);
 
 stroke (0, 230, 25);
  
  ellipse (mouseX-mida, mouseY+mida, 0.3*radi, 0.3*radi);

  ellipse (mouseX-mida, mouseY+mida, 0.2*radi, 0.2*radi);

  ellipse (mouseX-mida, mouseY+mida, 0.1*radi, 0.1*radi);

  ellipse (mouseX-mida, mouseY+mida, 0.07*radi, 0.07*radi);

  ellipse (mouseX+mida, mouseY-mida, 0.3*radi, 0.3*radi);


  ellipse (mouseX+mida, mouseY-mida, 0.2*radi, 0.2*radi);

  ellipse (mouseX+mida, mouseY-mida, 0.1*radi, 0.1*radi);

  ellipse (mouseX+mida, mouseY-mida, 0.07*radi, 0.07*radi);
  
  fill(230, mouseX/3, mouseX/3);
 
  ellipse (mouseX, mouseY, 0.2*radi, 0.2*radi);
  
 }
