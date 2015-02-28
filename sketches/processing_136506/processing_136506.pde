

float r = 0;

void setup(){
size(400,300);
background(0);
frameRate(20);
}

void draw(){
  stroke(0,255,100);
fill(0,0,0,30);
rotate(r);
rect(0,0,width-5,height-5);
fill(0,255,0,50);
ellipse(200,200,5,5);
fill(0,255,0,30);
rect(0,0,300,20);
rotate(0.79);
fill(0,255,0,30);
rect(5,5,width-10,height-10);
fill(255,0,0,150);
ellipse(200,200,20,20);
rotate(r);
fill(0,255,0,30);
rect(5,5,width-10,height-10);
ellipse(200,200,20,20);
ellipse(200,100,20,20);
r=r+0.01;
}


