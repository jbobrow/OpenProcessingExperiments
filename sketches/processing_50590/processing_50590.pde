
//Homework 2
//copyright 2012 Alex Fischer ajfische
void setup()
{
  size(400,400);
  smooth();
  background(39,33,35);
  frameRate = 2;
}

void draw()
{
  fill(39,33,35, 150);
  rect(0, 0, width, height);
//a
float xa, ya, wda, hta;
xa=100;
ya=150;
wda=150;
hta=150;

xa = xa + random(0);
ya = ya + random(0);
wda = wda + random(25);
hta = hta + random(25);
//ellipse(xa,ya,wda,hta);

noFill();

stroke(118,161,154);
strokeWeight(5);

beginShape();
  curveVertex(xa-.3*wda,ya-.1*hta);
  curveVertex(xa-.2*wda,ya-.2*hta);
  curveVertex(xa,ya-.3*hta);
  curveVertex(xa+.2*wda,ya-.2*hta);
  curveVertex(xa+.19*wda,ya);
  curveVertex(xa+.2*wda,ya+.2*hta);
  curveVertex(xa+.3*wda,ya+.19*hta);
  curveVertex(xa+.4*wda,ya+.1*hta);
endShape();
beginShape();
  curveVertex(xa+.19*wda,ya);
  curveVertex(xa+.19*wda,ya);
  curveVertex(xa+.04*wda,ya-.1*hta);
  curveVertex(xa-.14*wda,ya-.05*hta);
  curveVertex(xa-.15*wda,ya+.1*hta);
  curveVertex(xa,ya+.21*hta);
  curveVertex(xa+.195*wda,ya+.15*hta);
  curveVertex(xa+.195*wda,ya+.15*hta);
endShape();

//j
float xj, yj, wdj, htj;
xj=200;
yj=250;
wdj=150;
htj=150;

xj = xj - random(10);
yj = yj - random(15);
//ellipse(xj,yj,wdj,htj);

stroke(217, 89, 61);
strokeWeight(5);
beginShape();
  vertex(xj, yj);
  bezierVertex(xj, yj-100, xj, yj, xj, yj);
  vertex(xj, yj+25);
  bezierVertex( xj, yj+50, xj-15, yj+100, xj-50, yj+50);
endShape();

//f
float xf, yf;
xf = 300;
yf = 300;

xf = xf - random(10);
yf = yf + random(20);
noFill();
stroke(227,207,185);
bezier(xf + 50, yf - 150, xf, yf - 250, xf, yf, xf, yf - 50);
line(xf + 35, yf - 100, xf - 15, yf - 100);
}

