

void setup(){
size(300,300);
background(0,0,0);
}

void draw(){
int x=120;
fill(255,0,0);
ellipse(x,100,50,50);
fill(255,255,0);
rect(x+50,100,20,30);
fill(0,0,255);
triangle(x*2,100,250,150,200,150);
fill(0,255,0);
rect(0,0,width-x,60);
fill(255,128,0);
ellipse(x/2,60,150,10);
fill(178,0,255);
ellipse(mouseX,200,50,50);
}






