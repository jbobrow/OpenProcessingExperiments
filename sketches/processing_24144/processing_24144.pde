
void setup() {
//run once
size(200,200);
smooth();
}

void draw() {
int x = mouseX;
int y = mouseY;

//sky
fill(148,215,253);
rect(0,0,200,80);
noFill();

//grass
fill(94,186,27);
rect(0,80,200,120);
noFill();

//body and ears
fill(255);
rect(x,y,80,40);
triangle(x-13,y-30,x-21,y-10,x-5,y-15);
triangle(x+5,y-25,x,y+0,x+20,y-10);
noFill();

//head
fill(255);
beginShape();
vertex(x-21,y-20);
vertex(x-20,y+20);
vertex(x-5,y+25);
vertex(x+20,y-10);
endShape(CLOSE);
noFill();

//eyes
fill(51);
ellipse(x-14,y-6,2,2);
ellipse(x+4,y-1,2,2);
noFill();

//legs
fill(255);
rect(x,y+40,5,30);
rect(x+10,y+40,5,20);
rect(x+55,y+40,5,30);
rect(x+65,y+40,5,20);
noFill();

//tail
fill(51);
line(x+80,y,x+110,y+20);
triangle(x+100,y+20,x+105,y+10,x+110,y+20);
noFill();

//black circles on the body
fill(51);
ellipse(x+20,y+25,18,18);
ellipse(x+43,y+12,18,18);
ellipse(x+62,y+27,18,18);
noFill();

println(mousePressed);
if (mousePressed==true) {
  ellipse(x-14,y-6,10,10);
  ellipse(x+4,y-1,10,10);
  fill(255);
  beginShape();
  vertex(x-15,y+17);
  vertex(x-20,y+25);
  vertex(x-10,y+28);
  vertex(x-7,y+20);
  endShape(CLOSE);
  noFill();
}
}

