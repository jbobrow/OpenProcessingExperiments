
void setup() {
size (600,600);
background (180,95,127);
fill(0);
smooth();
noStroke();
colorMode(HSB); 
}

int col = 0;  
void draw() { 
background(col,255,255,20); 
for (int y = 0; y <= height; y += 40) {
for (int x = 0; x <= width; x += 40) {
fill(12, 140);
ellipse(x, y, 60, 60);
}
}

fill(255);
for (int y = 20; y <= height-20; y += 10) {
for (int x = 20; x <= width-20; x += 10) {
ellipse(x, y, 1, 1);

line(x, y, 240, 60);
}

fill(150,col,col);
ellipse (300,300,300,300);
fill(255,0,255,255);
ellipse (250,250,60,60);
ellipse (350,250,60,60);

fill(45,col,189,col);
triangle (300,275,275,325,325,325);

fill(255);
rect (290,450,20,col);

fill (255);
arc (300,370,140,70,0,PI);

fill (col,col,col);
rect (178,160,250,20);
fill (col,col,col,col);
rect (225,20,150,150);
fill(255);
rect (225,140,150,20);

fill (0);
ellipse (260,266,25,25);
ellipse (340,266,25,25);



endShape();



}}

void mousePressed(){  

col+=20;  

col%=255;  

println(col); 

}






