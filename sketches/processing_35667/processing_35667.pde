
void setup()  {
size(300,300);
}
int x=300;

void draw()  {
    background (225,225,0);
    fill(225,225,0);
    rect(0,0,x,x);
    strokeWeight(3);
    ellipse(x*1/2,x*1/2,150,150);
    strokeWeight(3);
    line(0,0,x,x);
    line(0,x,x,0);
    x--;
}


