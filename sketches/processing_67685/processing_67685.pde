


int x,y;
void setup(){
size(500,400);
smooth();
}
void draw(){
  background(255);
stroke(234,2,10);
noFill();
x=mouseX-80;
y=mouseY-80;
ellipse(x,y,80,80);

strokeWeight(8);
stroke(10,34,242);
ellipse(150,150,80,80);

stroke(0);
noFill();
ellipse(245,150,80,80);

stroke(237,255,0);
noFill();
ellipse(200,195,80,80);

stroke(28,139,29);
noFill();
ellipse(300,195,80,80);
}

