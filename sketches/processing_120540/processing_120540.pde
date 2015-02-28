
size(400,565);
background(255,255,204);
stroke(0);
smooth();

int eSize = 1;
/*line no hensu sengen*/ 
int a = 0;
int b = 0;
int c = 0;
int d = 0;

/*line red black*/
while(a < 400){
  strokeWeight(8);
line(0, 0, a, 565);
a = a + 50;
}
while(b < 400){
  strokeWeight(8);
line(400, 565, b, 0);
b = b + 50;
}
while(c < 400){
  strokeWeight(10);
line(400, 0, c, 565);
c = c + 50;
}
while(d < 400){
  strokeWeight(10);
line(0, 565, d, 0);
d = d + 50;
}

/*atama*/
fill(204,0,0);
triangle(200,200,0,0,400,0);
triangle(200,100,0,0,400,0);

/*gurade*/
for( int x=0;x<=width;x++){ 
  stroke(x,0,0,10);
 line(0,0,x,height);
 
   stroke(x,0,0,10);
  line(width,0,x,height);
}
/*sankaku*/
triangle(201,332,125,454,277,454);
triangle(200,580,125,454,277,454);




