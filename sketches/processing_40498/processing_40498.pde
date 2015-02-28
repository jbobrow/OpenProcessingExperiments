
float backran;
float backran2;
int scratchran;

int b=150;
int c=200;
int a=300;


void setup() {
  size(400,700);
  frameRate(10);
  smooth();
}

void draw() {
  
  
  backran=random(1,255);
  backran2=random(1,50);
  background(backran2,0,backran);
  scratchran= int (random(1,20));
  strokeWeight(scratchran);
  stroke(54,252,78);
  line(pmouseX ,pmouseY ,mouseX ,mouseY );
  line(pmouseX+100 ,pmouseY+100 ,mouseX+100 ,mouseY+100 );
  line(pmouseX+50 ,pmouseY+50 ,mouseX+50 ,mouseY+50 );
  line(pmouseX+150 ,pmouseY+150 ,mouseX+150 ,mouseY+150 );
  line(pmouseX+200 ,pmouseY+200 ,mouseX+200 ,mouseY+200 );
  line(pmouseX+250 ,pmouseY+250 ,mouseX+250 ,mouseY+250 );
  line(pmouseX+300 ,pmouseY+300 ,mouseX+300 ,mouseY+300 );
  line(pmouseX-50 ,pmouseY-50 ,mouseX-50 ,mouseY-50 );
  noStroke();
  a=a+1;
  b=b-1;
  c=c+30;
  fill(236,252,217);
  ellipse(300,100,400,a);
  fill(251,217,252,20);
  ellipse(300,150,415,c);
  fill(175,244,255,50);
  ellipse(350,200,c,450);
  rectMode(CENTER);
  rect(100,200,mouseX,300);
  fill(175,244,mouseY,30);
  rect(100,250,mouseX,250);
  
  PImage bg;
 
bg = loadImage("pole.jpg");
 
image(bg,0,500, mouseY,200);
}

void mousePressed() {
  strokeWeight(20);
  rectMode(CENTER);
  fill(0);
  rect(mouseX,mouseY,30,40);
  rect(mouseX+200,mouseY+200,200,50);
  fill(240,148,0);
  ellipse(mouseX-100,mouseY-100,50,500);
  
}

