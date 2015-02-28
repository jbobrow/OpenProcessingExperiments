
int x=20,y=20,dx=5,dy=5;

void setup()
{
    size(300, 250);
}

void draw()
{     
   background(255);
   fill(0,100,255)
   ellipse(x,y,20,20);
   x=x+dx;
   y=y+dy;
   if(y>250||y<0) {dy=-dy;}
   if(x>300||x<0) {dx=-dx;}
   if(mousePressed) {x=mouseX;y=mouseY;}
}
