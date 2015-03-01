
color c;
void setup(){
size(300,300);
noStroke();
c=color(random(0,255),random(0,255),random(0,255));
}
void draw(){
background(250);
noStroke();
fill(140,207,0);
triangle(70,160,150,100,230,160);
triangle(100,110,150,70,200,110);
triangle(20,220,150,140,280,220);
fill(72,32,8);
rect(120,220,60,100);
fill(0);
rect(40,220,1,20);
rect(80,220,1,20);
rect(260,220,1,20);
rect(220,220,1,20);
rect(90,160,1,20);
rect(210,160,1,20);
rect(120,110,1,20);
rect(180,110,1,20);
fill(255,255,0);

translate(150,80);
beginShape();
vertex(-20,10);
vertex(-60,-20);
vertex(-10,-10);
vertex(0,-50);
vertex(10,-8);
vertex(60,-20);
vertex(20,10);
vertex(40,50);
vertex(0,22);
vertex(-40,50);
vertex(-20,10);
endShape(CLOSE);
resetMatrix();

fill(c);
ellipse(40,240,25,25);
ellipse(80,240,25,25);
ellipse(220,240,25,25);
ellipse(260,240,25,25);
ellipse(90,180,25,25);
ellipse(210,180,25,25);
ellipse(120,130,25,25);
ellipse(180,130,25,25);
}

void mousePressed(){
    c=color(random(255),random(255),random(255));
}


