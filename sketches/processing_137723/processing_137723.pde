
float x=0;
float y=0;
float angulo = sin(x);
float R=100;
void setup (){
size (500,300);
background(0); 
smooth();
}
void draw (){
fill(0,5);
rect (0,0,width,height);
noStroke();
fill (255);
ellipse (x,y,50,50);
  
x = x+1 ;
y = height/2 + R*sin(angulo);
angulo = angulo +0.02;
if (x>=width)  {
x=10
}
}

