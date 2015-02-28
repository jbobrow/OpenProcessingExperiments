

PImage a;
PImage b;
//PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;


void setup()
{
size( 600, 200);
PFont font;
font = loadFont ( "Helvetica-36.vlw");
textFont (font);
smooth();
b= loadImage("wholfeet copy.jpg");
a= loadImage("title.jpg");
c= loadImage("bottom.jpg");
d= loadImage("carbonemissions.jpg");
e= loadImage("imagee.jpg");
f= loadImage("imagef.jpg");
g= loadImage("imageg.jpg");
h= loadImage("imageh.jpg");
i= loadImage("imagei.jpg");
j= loadImage("imagej.jpg");
k= loadImage("imagek.jpg");
frameRate( 60 );
}


// flashing font??

int shade = 1;
void shadeText()
{
fill(shade *5);  
text( "reduce", 50 ,30);
fill(shade*4);
text( "your", 200, 30);
fill(shade *3);
text("carbon footprint", 300, 30);
shade = shade +5;
{
if (shade > 100)
shade = 10;
}
}

//top part

int timer =0;
PImage c;

void shadeImage()
{
  
c = loadImage ("bottom02.jpg");
image (c ,0 ,165 );
{
fill ( 255 , -mouseX+600 );
rect (0,165,width,40);
timer = timer + 2;
}
if ( timer > 250)
timer = 0;
}

//bottom part

int timer02 =0;
PImage l;

void shadeImage02()
{
l = loadImage ("bottom.jpg");
image (l ,0 ,0);
{
fill ( 255, mouseX );
rect ( 0, 0, width, 40);
timer02 = timer02 +2;
}
if ( timer02 > 250)
timer02 = 0;
}

//footprints scrolling

void scrolling()
{
noStroke ();  
background ( 255);
image ( b, -mouseX+100, -10);
//image ( a, 0, -10);
//image ( c, 0, 160);
shadeImage();
shadeImage02();
}

//mouse changes

void mouse()
{
if(mouseX > 450 && mouseY > 180)  
{
cursor(HAND);
} else {
cursor(CROSS);
}
if( mouseY < 25 && mouseX < 250)
{
cursor(HAND);  
}
}
  
void draw()
{
mouse();  
scrolling();
//shadeText(); 
if (mousePressed == true)
{
if(mouseY < 180)
{
if (mouseX > 50 && mouseX < 100){
background(255);  
image ( d, 0, 0);
}
else if (mouseX > 125 && mouseX < 170){
background(255);  
image ( e, 0, 0);
}
else if (mouseX > 175 && mouseX < 225){
background(255);  
image ( f, 0, 0);
}
else if (mouseX > 230 && mouseX < 270){
background(255);  
image ( g, 0, 0);  
}
else if (mouseX > 290 && mouseX < 335){
background(255);
image ( h, 0, 0);
}
else if (mouseX > 375 && mouseX < 425){
background(255);
image ( i, 0, 0);
}
else if (mouseX > 430 && mouseX < 475){
background(255);  
image ( j, 0, 0);
}
else if (mouseX > 480 && mouseX < 525){
background(255);  
image ( k, 0, 0);
}
}
if (mouseX > 450 && mouseY > 180){
link ("http://nhf.org.nz/index.asp?pageID=2145828145");  
}
else if (mouseY < 25 && mouseX < 250){
link ("http://earthlab.com");  
}
}
}








