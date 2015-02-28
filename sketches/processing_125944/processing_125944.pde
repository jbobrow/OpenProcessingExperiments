
PImage foto;

void setup() {
  size(1024,614);
  foto =loadImage ("sfondo.jpg");
  background(foto);
  noSmooth();
  
}

void draw(){
  
  fill (222,192,192);  
  ellipse(mouseX,mouseY-25,40,40);
  fill (5);
  ellipse(mouseX-10,mouseY-26,8,16); 
  ellipse(10+mouseX,mouseY-26,8,16);
  line(mouseX-7,mouseY-13,mouseX+7,mouseY-13);
  fill (229,72,72);
  rectMode(CENTER);
  rect(mouseX,10+mouseY,40,40);
  fill (255);
  ellipse(mouseX,mouseY,10,10);
  ellipse(mouseX,20+mouseY,10,10);
  line(mouseX-20,mouseY,mouseX-40,20+mouseY);
  line(mouseX+20,mouseY,40+mouseX,mouseY-20);
  line(mouseX+10,mouseY+30,20+mouseX,mouseY+60);
  line(mouseX-10,mouseY+30,mouseX-20,mouseY+60);

  float posX=random(width);
  float posY=random(height);
 
  ellipse (posX,posY, random(0,10),random(0,10));
}


