
int x;
int y;
void setup(){ 
  size(500, 500);
}
void draw(){
background(255);
x=mouseX;
y=mouseY;
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
fill(150);
rect(x,y,20,100);
stroke(0);
fill(255);
ellipse(x,y-30, 60,60);
fill(0);
ellipse(x-19,y-30,16,32);
ellipse(x+19,y-30,16,32);
stroke(0);
line(x-10,y+50,x-20,y+60);
line(x+10,y+50,x+20,y+60);
}



