
// Set background color and size
background(147,131,131);
size(400,400);

//Multiple layers of ellipses'
for (int cSide = 25; cSide < 400; cSide += 25) {  
  for (int cLength = 25; cLength < 400; cLength += 100){
    fill(random(150,200), random(100,125), random(1,55));
ellipse(cSide,cLength,50,50);
  }
    }
    
// First row of quads
stroke(255,10,0);

fill(99,101,209);
int x1 = 25;
int x2 = 25;
int x3 = 50;
int x4 = 50;
int stroke = 1;
for (int quadCounter = 1; quadCounter <=13; quadCounter += 1){
strokeWeight(stroke);
quad(x1,60,x2,75,x3,95,x4,75);
x1 += 25;
x2 += 25;
x3 += 25;
x4 += 25;
stroke +=1;
}

//First row of triangles
noStroke();
fill(196,92,57);
x1 = 25;
x2 = 25;
x3 = 75;
for (int triCounter = 1; triCounter <= 6; triCounter += 1){
triangle (x1,150,x2,200,x3,200);
x1 += 30;
x2 += 30;
x3 += 30;
}

//Next row of triangles
fill(170,63,27);
x1 = 175;
x2 = 225;
x3 = 225;
for (int triCounter2 = 1; triCounter2 <=6; triCounter2 +=1){
  triangle (x1,150,x2,200,x3, 150);
  x1 += 30;
  x2 += 30;
  x3 += 30;
}

//Row of squares with shifting colors
x1 = 0;

for (int sqCounter = 1; sqCounter <= 7; sqCounter +=1){
if (sqCounter == 1){
  fill(255,0,0);
}
if (sqCounter == 2){
  fill (255,128,0);
}
if (sqCounter == 3){
  fill (255,255,0);
}
if (sqCounter == 4){
  fill (0,255,0);
}
if (sqCounter == 5){
  fill (0,0,255);
}
if (sqCounter == 6){
  fill (50,20,103);
}
if (sqCounter == 7){
  fill (155,27,242);
}
  
rect(x1, 250, 75, 50);
x1 += 60;

}

//Last row of lines
stroke(1);
x1 = 0;
x2 = 50;
for (int lineCounter = 1; lineCounter <= 15; lineCounter +=1){
line(x1, 350, x2, 400);
x1 +=25;
x2 +=25;
}












