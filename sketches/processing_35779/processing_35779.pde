
//HW2 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/01/2011 - CMU

//Setup
size (400, 400);
background(157,253,255);

//Variables
float x, y, w, h;
x = 50;
y = 50;
w = 300;
h = 300;
//ellipseMode(CORNER);
//ellipse(x, y, w, h);
//point(x, y);

//Background

for(int i = 0; i < 30 ; i++)
{
  noStroke();
  fill(74,161,229,200 - i * 10);
  rect(0,0, 400 ,5 * 2 * i);
  rect(0,0,5 * 2 * i, 400);
}

fill(252, 200, 3, 220);
stroke(252,180,20);
strokeWeight(6);
beginShape();

curveVertex(0,400);
curveVertex(0,400);
curveVertex(0,370);
curveVertex(50,350);
curveVertex(100,370);
curveVertex(150,330);
curveVertex(200,350);
curveVertex(300,330);
curveVertex(350,350);
curveVertex(400,370);
curveVertex(400,400);
curveVertex(400,400);

endShape();

noStroke();
for(int i = 5; i > 0; i--)
{
  fill(255,233 - i * 20,23 - i * 10);
  ellipse(0,0,50 + i * 20,50 + i * 20);
}

stroke(252,180,20);
strokeWeight(6);
line(0,85,0,95);
line(20,80,22,90);
line(40,73,45,80);
line(60,60,68,68);
line(75,40,82,45);
line(80,20,90,22);
line(85,0,95,0);
//Shapes
//Z
stroke(255,177,52);
strokeWeight(w/50);
fill(255,0,0);
beginShape();

//ref point
curveVertex(x , y + .1 * h);
curveVertex(x , y + .1 * h); 
curveVertex(x + .15 * w, y + .12 * h);
curveVertex(x + .3 * w, y + .1 * h);
curveVertex(x + .4 * w, y + .12 * h);
curveVertex(x + .3 * w, y + .25 * h);
curveVertex(x + (1.0 / 6) * w, y + .6 * h);
curveVertex(x + .11 * w, y + .9 * h);
curveVertex(x + .40 * w, y + .9 * h);
curveVertex(x + .42 * w, y + .95 * h);
curveVertex(x + .40 * w, y + h);
curveVertex(x + .05 * w , y + h);
curveVertex(x - .05 * w , y + .92 * h);
curveVertex(x + .20 * w , y + .25 * h);
curveVertex(x + (1.0 / 6) * w , y + .22 * h);
curveVertex(x  , y + .22 * h);
curveVertex(x , y + .1 * h);
curveVertex(x , y + .1 * h); 


endShape();

//E

fill(255,100,50);
beginShape();

curveVertex(x + .65 * w , y + .1 * h);
curveVertex(x + .65 * w , y + .1 * h);
curveVertex(x + .8 * w , y + .15 * h);
curveVertex(x + w, y + .1 * h);
curveVertex(x + 1.05 * w , y + .4 * h);
curveVertex(x + .8 * w , y + .3 * h);
curveVertex(x + .8 * w , y + .5 * h);
curveVertex(x + .9 * w , y + .5 * h);
curveVertex(x + .95 * w , y + .45 * h);
curveVertex(x + .95 * w , y + .65 * h);
curveVertex(x + .8 * w , y + .6 * h);
curveVertex(x + .8 * w , y + .8 * h);
curveVertex(x + .8 * w , y + .9 * h);
curveVertex(x + w , y + .8 * h);
curveVertex(x + 1.05 * w , y + .9 * h);
curveVertex(x + w , y + h);
curveVertex(x + .7 * w , y + h);
curveVertex(x + .65 * w , y +  .85 * h);
curveVertex(x + .65 * w , y + .1 * h);
curveVertex(x + .65 * w , y + .1 * h);

endShape();

//H

fill(255,255,0);
beginShape();

curveVertex(x + .3 * w , y);
curveVertex(x + .4 * w , y);
curveVertex(x + .4 * w , y + .5 * h);
curveVertex(x + .6 * w , y + .5 * h);
curveVertex(x + .6 * w , y);
curveVertex(x + .7 * w , y);
curveVertex(x + .7 * w , y + h);
curveVertex(x + .6 * w , y + h);
curveVertex(x + .6 * w , y + .7 * h);
curveVertex(x + .4 * w , y + .7 * h);
curveVertex(x + .4 * w , y + h);
curveVertex(x + .3 * w , y + h);
curveVertex(x + .3 * w , y);
curveVertex(x + .4 * w , y);
curveVertex(x + .4 * w , y);


endShape();



