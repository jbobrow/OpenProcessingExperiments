
float x;
float y;

void setup(){
 size(250,250);
 background(0);
 smooth();
}
void draw() 
{ 
frameRate(10);
 x=random(width);
 y=random(width);
 
fill(random(100,255));
 noStroke();
 rect(x,y,30,30);
 x++;
 y++;
}



