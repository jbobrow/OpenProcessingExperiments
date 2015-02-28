
PImage b;
void setup() 
{ 
size (620, 456);
smooth ();
b = loadImage("monalisa.png");
background(b);
}
void draw () { 
  scale (3);
  fill (255);
  ellipse (83.5,66, 11,6);
  ellipse (116,65, 11,6);
  fill (11,90,5);
  ellipse (map(mouseX,0,width,81.25, 86.25), map(mouseY,0,width,65.5,67.5), 3,2);
  ellipse (map(mouseX,0,width,113.75,118.75), map(mouseY,0,width,64.5,66.5), 3,2);
}

