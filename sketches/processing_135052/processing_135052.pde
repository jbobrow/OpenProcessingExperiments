
/**
Yingying Yang
Creative Computing Section B
Wk 3 Assignment - Interactivity
*/

int bx = 300;
int by = 400;

void setup() {
  size(500, 600);
}


void draw() {

  float c = map(mouseX, 0, width, 0, 255);
  float d = map(mouseY, 0, height, 0, 255);
  background(c, c, 100);

//rays
noStroke();
color from = color(d+150,c+175,random(150,200));
color to = color(c+175,d+200,d+225);
color interA = lerpColor(from, to, .1);
color interB = lerpColor(from, to, 1);
fill(interA,c);
triangle(bx,by,width,0,width,by-300);
triangle(bx,by,0,by-200,0,by-100);
fill(interB,c);
triangle(bx,by,width,by-200,width,by-170);
triangle(bx,by,width,by-80,width,by-35);
triangle(bx,by,bx-120,0,bx-80,0);
triangle(bx,by,0,0,0,by-300);
triangle(bx,by,0,by,0,by+20);

//lightbulb
fill(c+100,c+100,200);
ellipse(bx,by,250,250);
rect(bx-50,by+50,100,150);
fill(147,147,147);
rect(bx-50,by+160,100,50);

//filament
noFill();
stroke(c,c,0);
strokeWeight(3);
strokeCap(SQUARE);
line(bx-30,by+160,bx-30,by+60);
strokeCap(ROUND);
line(bx-30,by+60,bx-20,by+60);
arc(bx-15,by+60,5,30,0,PI);
arc(bx-10,by+60,5,30,PI,2*PI);
arc(bx-5,by+60,5,30,0,PI);
arc(bx,by+60,5,30,PI,2*PI);
arc(bx+5,by+60,5,30,0,PI);
line(bx+10,by+60,bx+20,by+60);
strokeCap(SQUARE);
line(bx+20,by+160,bx+20,by+60);




}



