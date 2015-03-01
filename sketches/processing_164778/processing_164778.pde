
void setup() {
size(500, 500);
stroke(10,22,29, 13);
noLoop();
}
void draw() {
background(300);
chair(25,3);
chair(175,3);
chair(325,3);
}
void chair(int ypos, int units) {
pushMatrix();
translate(PI, ypos);
for (int i = units; i > 0; i--) {
strokeWeight(4);
stroke(202,25*i,10-i*3, 200);
line(50, 20, 50, 70);
line(50, 70, 20, 100); 
line(20, 100, 80, 100); 
line(80, 100, 90, 70); 
line(90, 70, 95, 20); 
line(95, 20, 50, 20); 
line(90, 70, 50, 70);
line(90, 70, 90, 100); 
line(80, 100, 80, 140); 
line(20, 100, 20, 140); 

translate(100, TWO_PI);
}
popMatrix();
}
/*
size(500, 500); 
background(100, 200, 10);



strokeWeight(5); 
line(50, 20, 50, 70);
line(50, 70, 20, 100); 
line(20, 100, 80, 100); 
line(80, 100, 90, 70); 
line(90, 70, 95, 20); 
line(95, 20, 50, 20); 
line(90, 70, 50, 70);
line(90, 70, 90, 100); 
line(80, 100, 80, 140); 
line(20, 100, 20, 140); 

line(100, 70, 100, 120);
line(100, 120, 70, 150); 
line(70, 150, 130, 150); 
line(130, 150, 140, 120); 
line(140, 120, 145, 70); 
line(145, 70, 100, 70); 
line(140, 120, 100, 120);
line(140, 120, 140, 150); 
line(130, 150, 130, 190); 
line(70, 150, 70, 190);
*/ 






