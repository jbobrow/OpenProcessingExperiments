
void setup () {
size (720, 576);
strokeWeight (0.1);
noFill();
smooth();
background (255, 210, 0);
smooth ();

for(int i=50; i<height; i+=100) {
for (int a= 50; a<width; a+=100){

}
}

for(int i=0; i<height; i+=10) {
for (int a= 0; a<width; a+=10){
fill(0,random(150));
rect (a, i, 10, 10);
}
}
beginShape();
strokeWeight (4);
noFill();
stroke (20, 240);
curveVertex (0, 0);
curveVertex (00, 00);
curveVertex (50, 200);
curveVertex (50, 300);
curveVertex (200, 200);
curveVertex (300, 400);
curveVertex (400, 500);
curveVertex (500, 600);
curveVertex (200, 400);

endShape();

beginShape();
curveVertex (0, 0);
curveVertex (100, 0);
curveVertex (150, 300);
curveVertex (150, 400);
curveVertex (300, 300);
curveVertex (400, 500);
curveVertex (300, 600);
curveVertex (600, 700);
curveVertex (300, 500);

endShape();

beginShape();

curveVertex (720, 0);
curveVertex (720, 0);
curveVertex (600, 100);

endShape();


line (500, 100, 530, 100);
line (530, 100, 540, 70);
line (540, 70, 560, 150);
line (560, 150, 570, 80);
line (570, 80, 580, 100);

line (580, 100, 605, 100);
line (605, 100, 610, 110);
line (610, 110, 630, 50);
line (630, 50, 650, 130);
line (650, 130, 665, 85);
line (665, 85, 675, 100);
line (675, 100, 690, 100);

}






