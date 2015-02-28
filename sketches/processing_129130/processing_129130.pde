
color c1 = #FA871C;
color c2 = #43930A;

size(600,600);
background(0);

stroke(0,0);
fill(0);

int squareSize = 10;
int s = squareSize;

//borders
/*rect(0,0,squareSize,600);
rect(600-squareSize,0,squareSize,600);
rect(0,0,600,squareSize);
rect(0,600-squareSize,600,squareSize);*/

fill(c1);
rect(s,s,s*32,s*11);
fill(c2);
rect(s,s*13,s*32,s*11);
fill(c2);
rect(s*34,s,s*16,s*11);
fill(c1);
rect(s*34,s*13,s*16,s*36);
fill(c2);
rect(s*51,s,s*8,s*11);
fill(c2);
rect(s*51,s*13,s*8,s*41);
fill(c1);
rect(s,s*25,s,s*24);
fill(c2);
rect(s,s*50,s,s*4);
fill(c1);
rect(s,s*55,s,s);
fill(c2);
rect(s,s*57,s,s*2);
fill(c2);
rect(s*3,s*25,s*30,s*24);
fill(c1);
rect(s*3,s*50,s*30,s*4);
fill(c2);
rect(s*34,s*50,s*16,s*4);
fill(c2);
rect(s*3,s*55,s*30,s*4);
fill(c1);
rect(s*34,s*55,s*2,s*4);
fill(c2);
rect(s*37,s*55,s*10,s*4);
fill(c1);
rect(s*48,s*55,s*11,s*4);
