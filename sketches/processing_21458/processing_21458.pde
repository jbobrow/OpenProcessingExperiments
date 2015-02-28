
ellipse (90,100,60,60);
int x = 50;
void setup(){
size (300,300);
noStroke()
frameRate(15);
}
void draw(){
if (mousePressed == true)
{
if (mouseX <= 150){
fill(random(255),random(255),random(255));
x = random(10,200);
ellipse (mouseX,mouseY,x,x);
}
else {
fill(random(255),random(255),random(255));
x = random(10,200)
rect (mouseX,mouseY,x,x);
}
}
else {
fill(200)
ellipse(width/2,height/2,60,60);
}
}

