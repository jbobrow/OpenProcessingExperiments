
int a=0;
int b=0;
int c=0;
void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(0,191,255);
  fill(0,199,140);
  noStroke();
  rect(0,350,width,50);
  bighead();
}

void bighead(){
  fill(166,128,100);
  rect(125,300,35,50);
  fill(198,93,87);
  rect(125,250,35,50);
  rect(100,250,85,12);
  fill(231-c,198+c,165-c);
  ellipse(98,256,13,13);
  ellipse(187,256,13,13);
  rect(138,245,10,5);
  ellipse(143,233-b,30+b*2,30+b*2);
  fill(250);
  ellipse(138-b,230-b,5+b,5+b);
  ellipse(148+b,230-b,5+b,5+b);
  fill(0);
  ellipse(143,238-a,6+a,6+a);
  ellipse(138-b,230-b,2+a,2+a);
  ellipse(148+b,230-b,2+a,2+a);
  stroke(0);
  strokeWeight(3);
  line(126,300,158,300);
  line(142,320,142,348);
}

void mouseMoved(){
  a=a+1;
  b=b+2;
}

void mousePressed(){
  a=0;
  b=0;
  c=c+20;
}

