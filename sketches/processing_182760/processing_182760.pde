
int x=255,y=134,z=41,a=1,b=1,c=1;
void setup(){
size(600,600);
smooth();
}

void draw(){
  background(a,b,c);
  for(int i=10;i<width;i+=20)
  {
  
    for(int j=5;j<height;j+=10){
 fill(x,y,z);
    ellipse(i,j,20,10);

    }
}
textSize(20);
fill(255);
  text("BACKGROUND",10, width-60);
    text("STARS", 450,width-60);
    fill(255,134,41);
    rect(278,width-50,45,40);
    textSize(12);
    fill(255);
    text("default",281,width-30);

 noStroke();
  fill(242,42,42);
rect(10,width-50,40,40);
fill(42,242,42);
rect(60,width-50,40,40);
fill(42,42,242);
rect(110,width-50,40,40);
fill(235,242,34);
rect(450,width-50,40,40);
fill(35,238,247);
rect(500,width-50,40,40);
fill(245,25,234);
rect(550,width-50,40,40);
if(mousePressed==true){
if(mouseX>10 && mouseX<50 && mouseY>width-50 && mouseY<width-10)
{x=242;
y=42;
z=42;}
if(mouseX>60 && mouseX<100 && mouseY>width-50 && mouseY<width-10)
{
x=42;
y=242;
z=42;
}
if(mouseX>110 && mouseX<150 && mouseY>width-50 && mouseY<width-10)
{
x=42;
y=42;
z=242;
}
if(mouseX>450 && mouseX<490 && mouseY>width-50 && mouseY<width-10)
{a=235;
b=242;
c=34;}
if(mouseX>500 && mouseX<540 && mouseY>width-50 && mouseY<width-10)
{
a=35;
b=238;
c=247;
}
if(mouseX>550 && mouseX<590 && mouseY>width-50 && mouseY<width-10)
{
a=245;
b=25;
c=234;

}
if(mouseX>278 && mouseX<323 && mouseY>width-50 && mouseY<width-10)
{
x=255;
y=134;
z=41;
a=1;
b=1;
c=1;
}
}
}

