
//bubbleblower

//colour
int r;
int g;
int b;
int a;
//position
int x;
int y;
//diameter
int d;

void setup(){
size(600,600);
smooth();

}

void draw(){
 noStroke();
 fill(255,255,255,10);
 rect(0,0,800,800);
 //wand
 stroke(0);
 strokeWeight(3);
 ellipse(mouseX-15,mouseY-15,40,40);
 line(mouseX,mouseY,mouseX+100,mouseY+100);
    //bubbles
  fill(r,g,b,a);
  noStroke();
  ellipse(x,y,d,d);
  ellipse(x,y,d,d);
  r=int(random(255));
  g=int(random(255));
  b=int(random(255));
  a=int(random(240));
  d = int(random(60));
  y = int(random(mouseY-70,mouseY+30));
  x = int(random(mouseX-70, mouseX+30));
 }


