
foat x,y,r,_r;
void setup(){
size(450,450);
x=width/2;
y=height/2;
r=40;
_r=30;
}

void draw(){
background(255);
fill(255);
ellipse(x,y,r,r);
ellipse(mouseX,mouseY,_r,_r);
if(dist(x,y,mouseX,mouseY) < (r/2)+(_r/2)) fill(255);
}

//very simple circle collision detection

