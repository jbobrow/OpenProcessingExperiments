
void setup(){
  size(300,300);
  background(255,255,255);
}

void draw(){
  
int x=120;
noStroke();
ellipseMode(CENTER);
ellipse(x,height/2,50,50);
fill(255,255,0);
ellipse(x+50,height/2,50,50);
fill(0,0,255);
ellipse(x*2,height/2,50,50);
fill(0,255,0);
ellipse(width-x,height/2,50,50);
fill(255,128,0);
ellipse(x/2,height/2,50,50);

fill(128,0,128);
ellipse(mouseX,height/2,50,50);
}

