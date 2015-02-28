
float x=0;
float y=0;
int a;
color red;
color yel;
color bl;
color wt;
int i = 0;


void setup() {  
 frameRate(5);
 size(501, 501);
 background(255,255,255);
 red = color(255,0,0);
 yel = color(255,255,0); 
 bl = color(0,0,150); 
 

}
void draw() {
  
  
while (x< width ) {
  rect(x, y,x+2, y+2);
  fill(0);
  x=x+2;
}
while (y<height) {
  rect(x-3, y,x-1, y+2);
fill(0);
y=y+2;
}
while (x>0) {
  rect(x-3, y-3,x-1, y-1);
fill(0);
x=x-2;
}
while (y>0) {
  rect(x, y-3,x+2, y-1);
fill(0);
y=y-2;
}

i=i+1;
if (i<30) {
float r1=int(random(1,10));
float r2=int(random(1,10));
float r3=int(random(1,10));
float r4=int(random(1,10));
int a=int(random(1,4));
line (r1*width/r2, 0, r1*width/r2,height);
strokeWeight(2);
line (0, r2*height/r1, width,r2*height/r1);
strokeWeight(2);

switch(a) {
case 1:
fill (yel);
break;
case 2:
fill (bl);
break;
case 3:
fill (red);
break;
}
rect (r1*width/r2,r3*height/r4,width-r3*width/r4,height-r2*height/r1);
}
else {
  background(255);
  i=0;
}

}
void mouseReleased() {
  background(255);
}
