
void setup(){
size(300,300);
}
void draw(){
int x=120;
smooth();
background(255,255,255);
noStroke();
fill(255,100,100);
ellipse(x,height/2,50,50);
fill(255,255,0);
ellipse(x+50,height/2,50,50);
fill(0,100,255);
ellipse(x*2,height/2,50,50);
fill(200,255,100);
ellipse(width-x,height/2,50,50);
fill(255,170,0);
ellipse(x/2,height/2,50,50);
fill(255,100,255);
ellipse(mouseX,height/2,50,50);
}


