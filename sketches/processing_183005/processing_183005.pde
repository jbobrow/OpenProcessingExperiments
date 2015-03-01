
int xpos;
int xhradi, yhradi;
int ypos;
int xstefna;
int ystefna;

void setup () {
  size(600, 600);
  background(232,26,2229);
  frameRate(10);
  xpos=111;
  ypos=374;
  xhradi=1;
  yhradi=1;
  xstefna=3;
  ystefna=3;
}

void draw() {
  andlit(xpos,300);
  andlit(300, xpos);
 
 xpos = xpos + xhradi*xstefna;
  
  if (xpos>width-22 || xpos <22) xstefna = xstefna*-1;
  if (ypos>height-33||ypos <33)ystefna =ystefna*-1;
  
  xhradi=mouseX/10;
}

void andlit(int x, int y) {

  //har
  fill(243, 243, 21);
  rect(x-75, y, 150, 100);

  //haus
  stroke(1);
  fill(250, 225, 187);
  ellipse(x, y, 150, 180);


  //sol
  noStroke();
  fill(243, 243, 21);
  arc(x, y, 150, 180, PI, PI*2);

  //munnur
  fill(255, 0, 0);
  arc(x, y+50, 50, 50, 0, PI);

  //tennur
  fill(255, 255, 255);
  rect(x+5, y+50, 8, 8);
  rect(x-10, y+50, 8, 8);

  //nef
  fill(0, 0, 0);
  ellipse(x-4, y+40, 2, 2);
  ellipse(x+6, y+40, 2, 2);

  //augu
  fill(random(255), random(255), random(255));
  ellipse(x-25, y+20, 20, 20);
  ellipse(x+25, y+20, 20, 20);
  fill(0, 0, 0);
  ellipse(x-25, y+20, 5, 5);
  ellipse(x+25, y+20, 5, 5);
  stroke (10);
  strokeWeight(3);
  line(x-35, y+5, x-20, y+5);
  line(x+35, y+5, x+20, y+5);
  strokeWeight(1);
}

