
//set varialbles
float b;
float c;
float d;

void setup() 
{
size(400,400);
background(255);
}
 
 
void draw ()  
{
b=random(255);//random colours for triangle
c=random(255);//random colours for triangle
d=random(255);//random colours for triangle
stroke(b,c,255,200);
translate(200,200);//to move the co-ordinates
for (int a =1; a<200; a+=1)//setting value for a
{
strokeWeight(a/25);
smooth();
rotate(PI/20);//rotating the triangle
triangle(a,100,c,b,200,150);
}
}



