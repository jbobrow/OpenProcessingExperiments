
size (300, 300);
background (#1A0D52);


noStroke();
smooth();


for (int d = 250; d>=10 ; d-=20) {
  stroke(255,255,255,15);
  strokeWeight(3);
  fill(236, 255, 31, 15);
  ellipse (30, 70, d, d);
} 

for (int d = 340; d>=10 ; d-=20) {
  noStroke();
  fill(20, 55,d,20);
  ellipse (170, 100, d, d);
} 

for (int d = 400; d>=10; d-=23) {
  stroke(255,255,255,20);
  strokeWeight(3);
  fill(d-40,143,31,20);
  ellipse (70,310,d,d);
}

for (int d = 300; d>=10; d-=25) {
  stroke (255,255,255,20);
  strokeWeight (3);
  fill(91,d-50,153,16);
  ellipse (320, 30,d,d);
}

int x=150;
int y=150;

//head and body
fill(255);
stroke(10);
strokeWeight(6);
ellipse (x,y,81,100);
rect (x-40,y+3,81,80);
arc (x+40, y+82, 161, 161, radians(45), radians(180));
fill (50);
ellipse (x+148, y+82, 220, 220);

fill(252,233,82);
stroke(255,255,255,30);
ellipse (x,y,81,100);
rect (x-40,y+3,81,80);
arc (x+40, y+82, 161, 161, radians(45), radians(180));
fill (50);
ellipse (x+148, y+82, 220, 220);

//eyes
stroke(20);
strokeWeight(3);
fill(255);
ellipse (x-18, y-10, 20, 20);
ellipse (x+15, y-8, 30, 30);
strokeWeight(1);
fill(85,50,17);
ellipse (x-16, y-10, 12,12);
ellipse (x+11, y-8, 18,18);
fill (29,85,17);
ellipse (x-16, y-10,5,5);
ellipse (x+8, y-9, 9,9);

//mouth
stroke(0);
strokeWeight(7);
rect (x-23,y+16, 45, 35);

stroke(255,0,0);
strokeWeight(6);
fill(255);
rect (x-20, y+18, 40, 30);

stroke(129,0,0);
strokeWeight(6);
fill(255);
rect (x-15, y+30, 30, 5);


//horn(left)
stroke(10);
strokeWeight(2);
fill(#BC742C);

beginShape();
vertex(x-37, 135);
vertex(x-90,90);
vertex(x-68,40);
vertex(x-65,45);
vertex(x-82,89);
vertex(x-34,127);
endShape(CLOSE);

quad (x-70,99,x-58,80,x-53,83,x-64,103);
quad (x-82,73,x-100,60,x-95,55,x-80,66);
quad (x-47,125,x-100,100,x-95,96,x-50,121);
quad (x-60,119,x-79,137,x-82,128,x-65,116);

//horn(right)
beginShape();
vertex(x+37, 135);
vertex(x+90,90);
vertex(x+68,40);
vertex(x+65,45);
vertex(x+82,89);
vertex(x+34,127);
endShape(CLOSE);

quad (x+70,99,x+58,80,x+53,83,x+64,103);
quad (x+82,73,x+100,60,x+95,55,x+80,66);
quad (x+47,125,x+100,100,x+95,96,x+50,121);
quad (x+60,119,x+79,137,x+82,128,x+65,116);

//shell
stroke (20);
strokeWeight (4);
fill(250,0,80,60);
for (int r = 220; r>=10 ; r-=30) {
  ellipse (x+148, y+82, r, r);
}


