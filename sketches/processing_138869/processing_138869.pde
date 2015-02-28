
void setup(){
  size(340,360);
  background(0,200,500);
rectMode(CENTER);
fill(400,400,400);
rect(100,100,20,100);
ellipse(100,70,60,60);
fill(225,0,0);
ellipse(81,70,20,32);
fill(255,0,0);
ellipse(119,70,26,32);
line(90,150,96,160);
line(110,150,120,160);
line(1,250,116,166);
line(300,100,100,170);
line(50,100,90,100);
line(150,100,110,100);
stroke(225);
rectMode(CENTER);
fill(0);
rect(220,500,150,700);
fill(250,100,0);
rect(220,200,100,70);
rect(100,100,10,10);
fill(250,200,0);
ellipse(300,00,100,100);
fill(0,250,0);
triangle(40,200,200,70,300,100);
}
void draw(){
 fill(8000);
 ellipse(mouseX,height/1,mouseY/1+10,mouseY/1+10);
 fill(8000);
 int inverseX = width-mouseX;
 int inverseY = height-mouseY;
ellipse(inverseX, height/1, inverseY/1+10, inverseY/1+10);
}

