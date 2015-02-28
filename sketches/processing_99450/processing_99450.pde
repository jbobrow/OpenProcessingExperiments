
void setup(){
size(400,400);
background(255);
}

void mike(int x){
noStroke();
fill(0,238,118);
ellipse(x,x,50,50);
fill(255);
ellipse(x,173,20,20);
fill(0,134,139);
ellipse(x,173,13,13);
fill(0);
ellipse(x,173,5,5);
ellipse(x,193,20,10);
fill(238,230,133);
triangle(160,155,165,160,159,165);
triangle(197,155,193,160,200,165);
strokeWeight(6);
stroke(0,238,118);
//legs//
line(190,200,190,220);
line(170,200,170,220);
line(190,221,198,221);
line(170,221,162,221);
//arms//
line(165,190,140,160);
line(195,190,215,160);
}

void draw()
{
mike(180);
frameRate(3);
  float r=random(400);
  float m=random(400);
  float p=random(100);
  float q=random(255);
  float b=random(255);
  float o=random(255);
  float j=random(255);
  noStroke();
  fill(q,b,o,j);
  rect(r,m,p,150);
  
}
