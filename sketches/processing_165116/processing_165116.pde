
void setup()
{
size(400,600);
smooth();
stroke(70);
strokeWeight(3);
}
void draw(){}
void mouseMoved()
{
int px,py;
background(255,225,78);
fill(235);
ellipse(120,200,130,120);
ellipse(280,200,130,120);

fill(255);
noStroke();
ellipse(117,200,118,110);
ellipse(277,200,118,110);

stroke(70);
fill(100);
px=(int)((mouseX-200)*0.2);
py=(int)((mouseY-200)*0.2);
if (py>40){py=40;}
ellipse(120+px,200+py,20,15);
ellipse(280+px,200+py,20,15);

noFill();
beginShape();
curveVertex(200, 250);
curveVertex(200, 250);
curveVertex(150, 255);
curveVertex(145, 290);
curveVertex(190, 300);
curveVertex(190, 300);
endShape();

beginShape();
curveVertex(100, 320);
curveVertex(100, 320);
//curveVertex(150, 255);
curveVertex(45, 350);
curveVertex(180, 363);
curveVertex(350, 360);
curveVertex(350, 360);
endShape();

curve(348,352,348,352,355,365,355,365);
}


