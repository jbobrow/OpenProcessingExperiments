
void setup(){
size(400, 400);
smooth();
}

void draw(){

background(100, 100, 100);
fill(0);
rect(width/2.15, height/1.1, 25, 50);
rect(width/2.95, height/10, 125, 325);
fill(127, 75, 0)
ellipse(width/2, height/2, 100, 100);
fill(127, 0, 0)
ellipse(width/2, height/4, 100, 100);
fill(0, 127, 0)
ellipse(width/2, height/1.33, 100, 100);
{

    if (mousePressed==true)
    {
    fill(255, 150, 0)
    ellipse(width/2, height/2, 100, 100);
    fill(255, 0, 0)
    ellipse(width/2, height/4, 100, 100);
    fill(0, 255, 0)
    ellipse(width/2, height/1.33, 100, 100);
    }
}
}
