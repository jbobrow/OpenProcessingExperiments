
void setup(){
  size ( 500,500 );
}
/* Enes Baskaya ( author). Hi, i´m a elephant baby */

void draw (){
background(255);
fill(88,126,153);
smooth();
noStroke();
rect(200,200,200,150);

fill(88,126,153);
smooth();
noStroke();
rect(100,150,100,100);

fill(88,126,153);
smooth();
noStroke();
ellipseMode(CENTER);
ellipse(210,150,80,80);

/*stroke(88,126,153);
strokeWeight(10);
strokeJoin(ROUND);
smooth();
line(50,200,100,200);

stroke(88,126,153);
strokeWeight(10);
strokeJoin(ROUND);
smooth();
line(50,200,50,300); */

fill(88,126,153);
smooth();
noStroke();
rectMode(CORNER);
rect(200,350,50,100);

fill(88,126,153);
smooth();
noStroke();
rectMode(CORNER);
rect(350,350,50,100);

stroke(88,126,153);
strokeWeight(10);
strokeJoin(ROUND);
smooth();
line(410,210,410,300);

curve(50, 330, 40, 300, 100,200, 200,200);
stroke(88,126,153);
strokeWeight(10);
strokeWeight(10);
strokeJoin(ROUND);

fill(255);
smooth();
noStroke();
ellipseMode(CENTER);
ellipse(130,180,15,15);

fill(0);
smooth();
noStroke();
ellipseMode(CENTER);
ellipse(135,185,5,5);

stroke(115,67,20);
strokeWeight(10);
strokeJoin(ROUND);
smooth();
line(450,450,500,450);

stroke(115,67,20);
strokeWeight(10);
strokeJoin(ROUND);
smooth();
line(480,440,450,440);

stroke(115,67,20);
strokeWeight(10);
strokeJoin(ROUND);
smooth();
line(460,430,450,430);
}

void keyPressed() {
   saveFrame("elefant.png");
}

