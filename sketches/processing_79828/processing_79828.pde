
int diameter=5; 
float r = 188; 
float g = 36; 
float b = 36;
int x=0; 
int y=0;
int w=10;
int a = 0; 
int c = 300; 

void setup(){
 size(300,300);
 noFill();
 frameRate(80);
}
void draw(){
 stroke(r,g,b); 
 ellipse(150,150,diameter,diameter);
 diameter = diameter + 10;
 b=b+2;
 g=g+1;
 r=r-5;
 ellipse(x,y,w,w);
 x=x+5;
 y=y+5;
 w=w+2;
 ellipse(x+300,y+300,w,w);
 x=x-5;
 y=y-5;
 w=w+2;
 ellipse(x+300,y,w,w);
 x=x-5;
 y=y+5;
 w=w+2;
 ellipse(x,y+300,w,w);
 x=x+5;
 y=y-5;
 w=w+2;
}
 



