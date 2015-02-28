
//colorMode(RGB, 10, 9, 10, 255);
//stroke(10);
//fill(75);
//background(100);
//rect(75, 2, 32, 100);
//line(1, 0, 4, 50);
//ellipse(50,20,3,2);

void setup(){
smooth();
size(500,450);
frameRate(200);
}
//ears

void draw(){
ellipse(85,100,150,150);
ellipse(415,100,150,150);

//head
ellipse(250,250,350,350);

//eyes
ellipse(180,120,35,35);
ellipse(320,120,35,35);

//mouth
line(100,150,140,350);
line(200,150,140,350);
line(200,150,240,350);
line(300,150,240,350);
line(300,150,340,350);
line(400,150,340,350);

}

void mousePressed() {
fill (mouseX,0,mouseY);
}


