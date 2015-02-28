
void setup()
{
size(600,600);

smooth();

}
void draw()
{
  background(2,116,234);
  //noCursor();
  //pushMatrix(); NO CAL
  translate(mouseX-251,mouseY-228);
fill(250,255,0);
rect(105,50,50,60,60,60,60,60);
strokeWeight(3);
rectMode(CENTER);
fill(2,116,234);
rect(250,420,145,190);
//beginShape;
//cara
fill(2,116,234);
ellipse(250,250,250,250);
fill(255,255,255);
ellipse(250,290,190,170);
//ojos
ellipse (219,200,60,70);
ellipse(282,200,60,70);
//nariz
fill(250,5,50);
ellipse(250,228,20,20);
//nineta
fill(0,0,0);
ellipse(265,210,10,10);
ellipse(235,210,10,10);
//bigotis dreta
line(300,275,340,263);
line(300,290,345,290);
line(300,305,345,315);
//bigotis esquerra
line(200,275,160,263);
line(200,290,155,290);
line(200,305,160,315);
//boca
//barriga2
fill(255,255,255);
ellipse(250,430,147,130);
//collar
//rect(250,280,250,265,310,265,310,280);
rectMode(CENTER);
fill(250,5,50);
rect(250,360,145,20);
rectMode(CORNER);
//braç dret
beginShape();
fill(2,116,234);
line(323,360,350,440);
fill(255,255,255);
ellipse(340,450,40,40);
ellipse(355,450,10,10);
endShape();
//cascabell
fill(240,185,68);
strokeWeight(3);
ellipse(250,376,27,27);
strokeWeight(3);
ellipse(250,379,10,10);
line(250,385,250,390);
//piernas
line (250,500,250,515);
//peus
fill(255,255,255);
ellipse (293,520,85,40);
ellipse (208,520,85,40);
//buxaca magika
arc(250,438,80,70,radians(0),radians(180));
line(210,438,290,438);
//boka
arc(230,300,40,50,radians(0),radians(180));
arc(270,300,40,50,radians(0),radians(180));
//ma eskerra
beginShape();
fill(2,116,234);
line(177,420,127,380);
line(177,375,127,380);
fill(250,250,250);
ellipse(137,380,40,40);
//ellipse(140,360,10,20);
//ellipse(130,360,10,20);
//he intentat feru tort pero no ma surtit
endShape();
//popMatrix();
}
