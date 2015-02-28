
int s=500;
float x=s/2;
float pos;
float y=s/6;


void setup()
{
    background(255,200);
  smooth();
size(s,s);
x=y;
}

void draw()
{

pos=random(0,s);
scale((x/y)*3);
strokeWeight(0.5);
stroke(0,10);
fill(random(255),20);
ellipse(pos,y,29,29);
fill(0);
ellipse(pos,y,2,2);
y++;


}




void keyPressed(){ 
  saveFrame("screen.png"); 
}

