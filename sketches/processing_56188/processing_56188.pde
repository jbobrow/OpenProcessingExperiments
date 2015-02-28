
// T0POGRAFIA ALGORITMICA
// MARZO 14 
float t = 0, rx = 200, ry = 200;
//_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
//_ _ _ _ _ _ _ _ _ SETUP_ _ _ _ _ _ _ _ _ _ _ _ _ 
void setup() {
  size(700, 700); 
  smooth();
  background(120);
}



//_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
//_ _ _ _ _ _ _ _ _ DRAW_ _ _ _ _ _ _ _ _ _ _ _ _ 
void draw() {

  fill(120, 10);
  rect(0, 0, width, height);
  
  stroke(0);
  noFill();
  
  ellipse(width/4, height/2, rx*sin(radians(3*t)), ry*sin(radians(2*t)));
  ellipse(3*width/4, height/2, rx*sin(radians(5*t)), ry*sin(radians(4*t)));
  
  ellipse(width/2, height/4, rx*sin(radians(7*t)), ry*sin(radians(3*t)));
  ellipse(width/2, 3*height/4, rx*sin(radians(3*t)), ry*sin(radians(5*t)));


  t += 1;
}




//_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
//_ _ _ _ _ _ _ _ _ INTERACCION_ _ _ _ _ _ _ _ _ _ _ _ _ 

void mousePressed() {
  save("capturas/Imagen.png"); //.jpg.bmp.tga
}


