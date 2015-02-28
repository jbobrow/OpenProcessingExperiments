
//Bryan Lee, Penguin, Block 7

size(500,500);
noStroke();
strokeWeight(1);
int x =0;
while(x<500)
{
  stroke(85+x,197+x,255);
  line(0,x,500,x);
  x=x+1;
};
fill(237,178,60);
beginShape();
vertex(0,500);
vertex(500,500);
vertex(500,250);
vertex(450,200);
vertex(380,250);
vertex(200,190);
vertex(150,240);
vertex(100,210);
vertex(0,270);
endShape(CLOSE);
fill(255,247,93,255);
ellipse(0,0,140,140);

beginShape();
stroke(255,247,93,255);
vertex(180,280);
vertex(300,240);
vertex(325,300);
vertex(355,390);
vertex(325,490);
vertex(335,390);
vertex(300,330);
vertex(220,330);
vertex(225,390);
vertex(200,490);
vertex(210,390);
vertex(180,280);
endShape(CLOSE);

quad(300,240,350,100,350,130,330,330);
ellipse(368,117,55,35);
triangle(350,105,350,90,360,100);
bezier(180,280,100,280,200,400,140,400);

fill(149,95,29);
ellipse(200,290,15,15);
ellipse(210,315,15,15);
ellipse(225,295,15,15);
ellipse(240,315,15,15);
ellipse(240,275,15,15);
ellipse(255,295,15,15);
ellipse(270,270,15,15);
ellipse(295,280,15,15);
ellipse(280,300,15,15);
ellipse(265,315,15,15);
ellipse(300,310,15,15);
ellipse(315,290,15,15);
ellipse(325,270,15,15);
ellipse(305,255,15,15);
ellipse(320,240,15,15);
ellipse(317,220,10,10);
ellipse(333,225,10,10);
ellipse(327,210,10,10);
ellipse(320,330,15,15);
fill(0,0,0);
ellipse(360,110,10,10);

stroke(0,0,0);
strokeWeight(3);
line(360,125,393,125);
