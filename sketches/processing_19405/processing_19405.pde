
size(250,250);
smooth();
background(144,227,225);
 
for(int y=5; y<=height; y+=30){
for(int x=5; x<=width; x+=35){
noStroke();
fill(75,72,63, 105);
ellipse(x, y, 40, 40);
}
}
 
for(int x = 0; x < height; x += 10){
for(int y = 0; y < width; y += 10){
noFill();
stroke(28,67,66, 240);
strokeWeight(0.5);
ellipse(x, y, 55, 55);}
 
}
 
for(int c = 10; c < 250; c += 50){
for(int b = 10; b < 250; b += 30){
stroke(255, 100);
strokeWeight(0.5);
ellipse(c, b, 250, 250);
}
}
 
float x = 125;
float y = 205;
float m = 45;
 
stroke(255, 200);
fill(255, 20);
ellipse (x,x, 50,50);
ellipse (x,x, 85,85);
ellipse (x,x, 145,145);
ellipse (x,x, 200,200);
ellipse (x,x, 220,220);
ellipse (y, m, 30,30);
ellipse (y,m, 55,55);
ellipse (y, m, 90,90);
ellipse (y,m, 115,115);
ellipse (m, m, 30,30);
ellipse (m,m, 55,55);
ellipse (m, m, 90,90);
ellipse (m,m, 115,115);
ellipse (m,y, 30,30);
ellipse (m,y, 55,55);
ellipse (m, y, 90,90);
ellipse (m,y, 115,115);
ellipse (y,y, 30,30);
ellipse (y,y, 55,55);
ellipse (y, y, 90,90);
ellipse (y,y, 115,115);

