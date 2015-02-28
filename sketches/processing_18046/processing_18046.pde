
size(250, 250);
smooth();
background(#594F4F);

//rectangles
for(int a=0; a<=height; a+=100){ 
for (int b=0; b<=width; b+=10){ 
fill(#547980,100); 
strokeWeight(.04);
rect(b,a-b,20,a);}} 

//squares
fill(#45ADA8, 150);
rectMode(CENTER);
rotate(-.72);
strokeWeight(30);
stroke(#9DE0AD, 80);


ellipse(100, 200, 150, 150);
ellipse(-100, 203, 100, 100);
ellipse(-100, 203, 50, 50);
translate(0, -50);
ellipse(-100, 203, 25, 25);
translate(100, 100);
ellipse(-100, 203, 25, 25);
rotate(.72);
translate(0, 50);
translate(-100, -100);
//

//lines
translate(40, 50);
for(int y=0; y<=240; y+=10){ 
for(int x=20; x<=240; x+=5){ 
strokeWeight(.3);
stroke(#9DE0AD, 50);
noFill();
triangle(x, y, 10, x+y, y-x , y);}}



