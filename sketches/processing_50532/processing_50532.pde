
float inicio1=0;
float fin1=PI*2;
float inicio2=0.63;
float fin2=5.6;
float temp=0.0;

void setup() {
  size(800,400);
  smooth();
  strokeWeight(2);
  noStroke();
  fill(255,255,0);
  frameRate(7);
  ellipseMode(CORNER);
}

void draw() {
  background(128);
  
  //pinky
fill(255,165,243);
ellipse(mouseX-150,mouseY,100,100);
ellipse(mouseX-150,mouseY+50,40,60);
ellipse(mouseX-120,mouseY+60,40,50);
ellipse(mouseX-90,mouseY+55,40,60);
fill(255);
ellipse(mouseX-120,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-110,mouseY+45,20,20);
fill(255);
ellipse(mouseX-80,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-70,mouseY+45,20,20);

//inky
fill(106,179,255);
ellipse(mouseX-300,mouseY,100,100);
ellipse(mouseX-300,mouseY+50,40,60);
ellipse(mouseX-270,mouseY+60,40,50);
ellipse(mouseX-240,mouseY+55,40,60);
fill(255);
ellipse(mouseX-270,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-260,mouseY+45,20,20);
fill(255);
ellipse(mouseX-230,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-220,mouseY+45,20,20);

//clyde
fill(255,161,98);
ellipse(mouseX-450,mouseY,100,100);
ellipse(mouseX-450,mouseY+50,40,60);
ellipse(mouseX-420,mouseY+60,40,50);
ellipse(mouseX-390,mouseY+55,40,60);
fill(255);
ellipse(mouseX-420,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-410,mouseY+45,20,20);
fill(255);
ellipse(mouseX-380,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-370,mouseY+45,20,20);

//blinky
fill(255,93,88);
ellipse(mouseX-600,mouseY,100,100);
ellipse(mouseX-600,mouseY+50,40,60);
ellipse(mouseX-570,mouseY+60,40,50);
ellipse(mouseX-540,mouseY+55,40,60);
fill(255);
ellipse(mouseX-570,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-560,mouseY+45,20,20);
fill(255);
ellipse(mouseX-530,mouseY+40,30,30);
fill(0,149,206);
ellipse(mouseX-520,mouseY+45,20,20);

//mrs.pacman
fill(255,244,155);
arc(mouseX,mouseY,100,100,inicio1,fin1);
fill(0);
ellipse(mouseX+25,mouseY+20,25,25);
fill(0);
ellipse(mouseX+20,mouseY+40,5,5);
fill(140,0,0);
ellipse(mouseX,mouseY+18,20,20);
triangle(mouseX,mouseY+18,mouseX+15,mouseY-5,mouseX+10,mouseY+30);
triangle(mouseX,mouseY+18,mouseX-15,mouseY+5,mouseX-20,mouseY-10);
 
temp=inicio1; 
inicio1=inicio2;
inicio2=temp;
 
temp=fin1;
fin1=fin2;
fin2=temp;
 
}




