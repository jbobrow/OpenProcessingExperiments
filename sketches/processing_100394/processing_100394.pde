
int x =0;
int y= 0;


void setup(){
background(34,54,65);
size(200,200);
noStroke();
}

void draw(){
fill(34+y,54-x,65);
ellipse(100,100,30,30);
fill(34-x,54,65+y);
arc(90,110,80,80,radians(120),radians(150));
arc(85,100,80,80,radians(175),radians(200));
arc(90,90,80,80,radians(210),radians(240));
arc(102,89,80,80,radians(270),radians(298));
arc(114,96,80,80,radians(310),radians(335));
arc(115,105,80,80,radians(360),radians(385));
arc(105,113,80,80,radians(50),radians(85));
fill(34+y,54,65+(x*y));
arc(86,93,50,50,radians(200),radians(209));
arc(95,85,50,50,radians(250),radians(263));
arc(110,90,50,50,radians(300),radians(310));
arc(109,110,50,50,radians(25),radians(35));
arc(98,114,50,50,radians(90),radians(105));
arc(87,105,50,50,radians(155),radians(167));
arc(115,100,50,50,radians(340),radians(350));
if(mousePressed==true){
y=y+2;
x =x+5;
}


}
