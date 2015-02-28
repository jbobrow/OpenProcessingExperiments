
void setup(){
size(400, 400);
noStroke();
smooth();
background(#B0E2FF);
fill(#8E388E, 80);
rect(50, 150, 200, 200);
fill (225,20,20);
rect(125, 300, 70, -100);
fill(#FAFAD2);
ellipse(180, 260, 10, 10);
fill(0);
triangle(50, 150, 250, 150, 150, 10);
fill(255);
rect (0,299,400,400);
ellipse(350,285,50,50);
ellipse(350,253,40,40);
ellipse(350,230,30,30);
}

void draw(){}

void mousePressed(){
  float r = random (10-33);
ellipse(mouseX,mouseY,r,r);
}




