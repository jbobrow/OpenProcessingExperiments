
//circle position
int cx=int(random(0,200));
int cy=int(random(0,200));
//square position
int sx=int(random(0,200));
int sy=int(random(0,200));
//triangle position
int tx=int(random(0,200));
int ty=int(random(0,200));

void setup()
{
size(200,200);//window size

//grid horizontal lines
line(20,0,20,200);
line(40,0,40,200);
line(60,0,60,200);
line(80,0,80,200);
line(100,0,100,200);
line(120,0,120,200);
line(140,0,140,200);
line(160,0,160,200);
line(180,0,180,200);

//grid vertical lines
line(0,20,200,20);
line(0,40,200,40);
line(0,60,200,60);
line(0,80,200,80);
line(0,100,200,100);
line(0,120,200,120);
line(0,140,200,140);
line(0,160,200,160);
line(0,180,200,180);

//draw circle
ellipse(cx,cy,10,10);
// draw square
rect(sx,sy,10,10);
//draw triangle
triangle(tx-5,ty+5,tx,ty-5,tx+5,ty+5);

}

