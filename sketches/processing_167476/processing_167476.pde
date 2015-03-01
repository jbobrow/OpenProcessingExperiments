
//set variables
float a;
float b;
float c;
float d;
float e;
void setup() 
{
size(400,400);
background(255);
smooth ();
}
 
void draw ()  
{
a=random(255);//to choose random clour for rectangles
b=random(255);//to choose random clour for rectangles
c=random(255);//to choose random clour for rectangles
d=random(255);//to choose random clour for rectangles
e=random(255);//to choose random clour for rectangles

translate(a,e);//to move rectangles randomly
rotate(PI/4);//to rotate rectangles

stroke(a,b,c);  
rect(d, e, c,b); 
}



