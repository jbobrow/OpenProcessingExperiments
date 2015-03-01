
int radius;

void setup() {
  background(255, 255, 255);
  size (480,480);
  radius=mouseX;
}

void draw (){
  background(225,225-frameCount,0-225);
  fill(mouseX/4);
  radius=mouseX;
  stroke(255);
line(40,90,100,90);
line(70,90,70,150);
line(130,90,190,90);
line(130,90,130,150);
line(130,150,190,150);
line(160,120,130,120);
line(220,90,250,150);
line(280,90,250,150);
line(310,90,310,150);
line(360,90,360,150);
line(360,90,410,150);
line(410,90,410,150);
fill(131,88,32);
ellipse(240,300,100,100);
fill(255,255,255);
ellipse(mouseX,200,20,20);
ellipse(100,mouseY,20,20);
ellipse(mouseX,400,20,20);
ellipse(200,mouseY,20,20);
ellipse(mouseX,300,20,20);
ellipse(500,mouseY,20,20);
ellipse(mouseX,600,20,20);
ellipse(700,mouseX,20,30);
line(mouseX,mouseY,240,300);


 if (mousePressed) {
fill (random (255), random (255), random (100), random (100));
background(225,225*frameCount,90*frameCount);
size (700,700);

ellipse(240,300,radius,radius);
fill(255,255,255);
ellipse(mouseX,mouseY,radius,radius);

  }
}
