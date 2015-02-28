
size(800,500);

int w=100;//circle width
int h=100;//circle height
int s=5;//stroke
int rx=int(random(0,height));//x-cordinate
int ry=rx;//y-cordinate
color cb=color(0,0,0);//black
color cw=color(255,255,255);//white

fill(cb);
ellipse(rx,ry,w,h);
fill(cw);
ellipse(rx+25,ry+25,w/2,h/2);
strokeWeight(s);
line(rx-15,ry-15,rx-15,ry+100);
strokeWeight(s-3);
line(rx-15,(ry-15)+6,(rx-15)+6,ry+106);
strokeWeight(s+2);
line(rx-15,(ry-15)-4,(rx-15)-4,ry+96);

/* Self Reference Model Robot 
//fill(0,0,0);
//ellipse(100,100,100,100);
//fill(255,255,255);
//ellipse(125,125,50,50);
//strokeWeight(5);
//line(85,85,85,200);
//strokeWeight(5-3);
//line(85+3,85+6,85+6,200+6);
//strokeWeight(5+2);
//line(85,85-4,85-4,200-4);
*/



