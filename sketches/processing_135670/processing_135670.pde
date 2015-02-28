
void setup(){
size(500,500);
smooth();
noStroke();
}

void draw(){
background(204, 255, 255);


int x;
int y;
x = 250;
y = 10;
 
noStroke();
fill(255, 228, 181);
ellipse(x,y*3,(x*2)+50,(x*2)+220);
 
noStroke();
fill (255, 10, 19);
ellipse (215,120,80,80);
ellipse (285, 120, 80, 80);

noStroke();
fill(255, 182,193);
rectMode(CENTER);
rect(x,x-45,y*18,y*13);
ellipse(x,x+15,y*18,y*10);

 
noStroke();
fill (255, 10, 19);
triangle(x,y*14,x+(y*5),y*8+4, x+x-30, y*14);
triangle(y+20,y*14,x-(y*5),y*8+4,x-20,y*14);

if(mouseY<200){ 

stroke(0);
strokeWeight(8);
line(x, y*20,x, y*50);

ellipseMode(CENTER);
noStroke();
fill (51, 0, 153);
ellipse (x, y*20, 16*y, 16*y);
fill(255);
ellipse (x, y*20, 14*y, 14*y);
fill (51, 0, 153);
ellipse (x, y*20, 12*y, 12*y);
fill(255);
ellipse (x, y*20, 10*y, 10*y);
fill (51, 0, 153);
ellipse (x, y*20, 8*y, 8*y);
noStroke();
fill(255);
ellipse (x, y*20, 6*y, 6*y);
strokeWeight(3);
stroke(51, 0, 153);
fill (51, 0, 153);
ellipse (x, y*20, 4*y, 4*y);
}
else
{
stroke(0);
strokeWeight(8);
line(x, y*30,x, y*50);

ellipseMode(CENTER);
noStroke();
fill (51, 0, 153);
ellipse (x, y*30, 16*y, 16*y);
fill(255);
ellipse (x, y*30, 14*y, 14*y);
fill (51, 0, 153);
ellipse (x, y*30, 12*y, 12*y);
fill(255);
ellipse (x, y*30, 10*y, 10*y);
fill (51, 0, 153);
ellipse (x, y*30, 8*y, 8*y);
noStroke();
fill(255);
ellipse (x, y*30, 6*y, 6*y);
strokeWeight(3);
stroke(51, 0, 153);
fill (51, 0, 153);
ellipse (x, y*30, 4*y, 4*y);
}
}
