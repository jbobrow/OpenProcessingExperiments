

float px,py,x,y;
size(200,200);
background(255);
x=px=0;
y=py=100;
for( float i=0; i<200; i++ ) {
x = i;
y =(sin(radians(i*10))+sin(radians(i*4)))*50+100;
line(px,py,x,y);
px = x;
py = y;
}

