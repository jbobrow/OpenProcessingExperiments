
int x=0;
int y=0;
int speed=5;
int speedtwo=4;
void setup (){
size(600, 150);
smooth();
strokeWeight(2);
background(#22DCE6);
}
void draw(){
frameRate(30);
fill(#D62D71);
rect(x,50,50,50);
fill(500+x,(250+x*2),x,200);
ellipse(x,50,40,40);
fill(#47D191);
ellipse(50, y, 10, 10);

x=x+speed;
y=y+speedtwo;
if((x>=width)||(x<0))
 { 
   speed=speed*-1;
 }


if((y>=height)||(y<0))
 { 
   speedtwo=speedtwo*-1;
 }
}



