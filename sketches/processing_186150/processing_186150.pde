
float xIntheBox;
float yIntheBox;
int x , y;
float b ,g ,r;
void setup(){
size(640,480);
frameRate(10);
}
void draw(){
  b = random(255);
  g = random(255);
  r = random(255);
background(255);
fill(b,g,r);
ellipse(320,240, 300,300 );
strokeWeight(5);
fill(#ffffff);
line(230, 310 , 360, 310);
fill(g,b,r);
ellipse(230 , 210,110,110);
ellipse(360 , 210, 110,110);
x = width/2;
y = height/2 ; 
x = mouseX;
y = mouseY;
xIntheBox = map(x,0,639,185,185+90);
yIntheBox = map(y,0,479,165, 165+90);

fill(#000000);
ellipse( xIntheBox+10,  yIntheBox-10,20,20);
ellipse( xIntheBox+138,  yIntheBox-10,20,20);
noFill();
stroke(255);
rect(0,0,700,700);

}
