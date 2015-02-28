
void setup(){
size(340,540);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);
}

void draw(){

int x = 110;
int y = 90;
fill(#ABACAD);
triangle(160,20,200,80,120,80);
rect(120,80,80,60);
rect(140,140,40,20);
rect(80,160,160,160);
ellipse(160,127,7,7);
line(130,y,150,x);
line(190,y,170,x);
line(150,y,130,x);
line(170,y,100+y,x);
rect(120,320,20,120);
rect(180,320,20,120);







if (mousePressed) {

fill(#EA1C1C);
} else {

fill(255);
}

ellipse(120,200,10,10);
ellipse(140,200,10,10);
triangle(110,203,150,203,130,230);
}




