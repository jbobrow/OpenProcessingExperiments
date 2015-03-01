
int counter=0;
int i;
 
 float x=0;
float y=0;
float w,h;


 
 void setup() 
{
  size(500, 400);
x=random (width);
y =random (height);
w= random(50,500);
h= random(50,500);
  
  background(245,138,7); 
  stroke(255);
  noLoop();
   
}
 
 
void draw() {  //draw function loops
  
 for (int i=0; i<100; i++) {
 line(counter,0, width-counter, height-counter);
 line(0, counter, width-counter, height-counter);
 fill(#008B8B);
 counter=counter+10;
 
 
 line(counter,0, 256,565);
 line(0, counter,269,546);
 fill(#008B8B);
counter=counter+10; 
 
 line(counter,0, 97,362);
 line(0, counter, width-counter, height-counter);
 fill(#008B8B);
 counter=counter+10;
 
 line(counter,20,345,470 );
 line(0, counter,490,270);
 fill(#008B8B);
 counter=counter+10;
 
 
 
 //background(255);
fill(60);
rect(x,y,w,h);
 
 
 int count =0;

x=x+5;
y=y+4;
//if the x position becomes larger than the width of the stage
if(x>width)
{
w= random(50,500); 
x= -w;



}

if(y>height)
{

h= random(20,500);
y= -h;



}


 
 
 
 }
 }
