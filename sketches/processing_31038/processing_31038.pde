
PImage penguin;

void setup() {
  size(500,500);
  smooth();
  penguin=loadImage("beach.jpg");
}
  void draw() 
  {
    background(penguin);
    
    smooth();
 
  fill(64,252,251);
//rect(0,0,500,380);

fill(2,2,3);
ellipse(250,300,150,200);
ellipse(250,190,80,70);
triangle(220,150,240,150,250,160);
triangle(260,150,240,160,250,160);
line(250,160,240,140);
rect(0,380,500,120);
//line(130,310,130,140);
triangle(220,210,130,310,210,300);
triangle(290,220,360,320,320,320);

fill(247,233,65);
bezier(200,380,170,410,230,440,260,380);
bezier(270,380,280,420,340,420,310,370);

fill(250,249,240);
ellipse(250,310,130,170);
ellipse(230,180,20,20);
ellipse(270,180,20,20);

fill(255,142,3);
triangle(240,200,270,200,250,190);
triangle(240,200,270,200,250,210);

fill(103,89,72);
ellipse(230,180,10,10);
ellipse(270,180,10,10);

fill(255,245,152);
rect(40,440,50,10);
rect(140,440,50,10);
rect(240,440,50,10);
rect(340,440,50,10);
rect(440,440,50,10);

//balloon
fill(250,109,243);
line(130,310,mouseX,mouseY);
ellipse(mouseX,mouseY,60,60);

fill(255,54,78);
ellipse(350,230,10,10);
ellipse(360,230,10,10);

fill(200,149,234);
ellipse(360,250,40,40);

fill(149,84,14);
triangle(360,320,380,260,340,260);


fill(10,9,7);
line(355,230,350,210);
line(345,270,375,270);
line(348,280,370,280);
line(350,290,365,290);
line(353,300,360,300);
 }


