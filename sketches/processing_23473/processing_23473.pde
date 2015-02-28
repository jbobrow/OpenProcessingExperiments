
void setup() {
size(200,200);
smooth();
}
void draw() {
background(126,255,142);
ellipseMode(CENTER);
rectMode(CENTER);

stroke(0);
fill(0);
ellipse(65,70,30,30);
ellipse(135,70,30,30);

stroke(0);
fill(75);
ellipse(65,70,10,10);
ellipse(135,70,10,10);//ears//

stroke(0);
fill(255);
ellipse(100,100,100,80);//head//

stroke(0);
fill(0);
ellipse(80,90,20,20);
ellipse(120,90,20,20);//blackeyes//

stroke(0);
fill(200);
ellipse(83,90,5,10);
ellipse(117,90,5,10);//eyes//

stroke(0);
fill(200);
rect(100,110,9,6);

line(0,100,90,145);
line(0,110,90,145);
line(0,110,75,160);
line(0,120,75,160);
line(0,125,60,175);
line(0,135,60,175);

line(200,10,140,20);
line(200,20,140,20);
line(200,20,155,30);
line(200,30,155,30);
line(200,30,160,45);
line(200,40,160,45);//bamboo leaves//
}

