
void setup() {
  frameRate(10);

size(600, 600);}
void draw(){
background(0,0,75);

noStroke();
fill(250,250,random(230),120);
ellipse(300, 300, 590, 590);
fill(250,250,random(230),130);
ellipse(300, 300, 580, 580);
fill(250,250,random(230),180);
ellipse(300, 300, 570, 570);
fill(250,250,random(230));
ellipse(300, 300, 560, 560);
fill(250,250,random(230));
ellipse(300, 300, 550, 550);
fill(250,250,random(230));
ellipse(300, 300, 540, 540);
fill(250,250,random(230));
ellipse(300, 300, 530, 530);
fill(250,250,random(230));
ellipse(300, 300, 520, 520);
fill(250,250,random(230));
ellipse(300, 300, 510, 510);
fill(250,250,random(230));
ellipse(300, 300, 500, 500);
fill(250,250,random(230));
ellipse(300, 300, 490, 490);
fill(250,250,random(150));
ellipse(300, 300, 480, 480);
fill(245,245,random(250));
ellipse(300, 300, 470, 470);
fill(240,240,random(250));
ellipse(300, 300, 460, 460);
fill(235,235,20);
ellipse(300, 300, 450, 450);
fill(random(240),random(240),random(240));

stroke(1);
arc(300, 320, 300, 300, 0, PI);
fill(255,255,255);
rect(150,300,300,20);

strokeWeight(1);
line(170,300,170,320);
line(170,300,170,320);
line(190,300,190,320);
line(210,300,210,320);
line(230,300,230,320);
line(250,300,250,320);
line(270,300,270,320);
line(290,300,290,320);
line(310,300,310,320);
line(330,300,330,320);
line(350,300,350,320);
line(370,300,370,320);
line(390,300,390,320);
line(410,300,410,320);
line(430,300,430,320);
fill(0,0,0);
ellipse(200,200,20,20);
ellipse(400,200,20,20);
noFill();
rect(150,300,300,20);
noFill();
beginShape();
curveVertex(300,  0);
curveVertex(300, 190);
curveVertex(300,  240);
curveVertex(290,  250);
curveVertex(285, 240);
curveVertex(285, 200);
endShape();
fill(0,0,0);
ellipse(300, 355,15,15);
strokeWeight(5);
line(300,360,300,410);
strokeWeight(2.5);

line(320,365,300,373);
line(280,365,300,373);
line(300,400,310,430);
line(300,400,290,430);
fill(255,0,0);
triangle(300,380,280,410,320,410);
}
