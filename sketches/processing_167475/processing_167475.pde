
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
b=random(255);//random colours for the line
c=random(255);//random colours for the line
d=random(255);//random colours for the line
stroke(b,c,d);
translate(200,200);//to move the co-ordinates
for (int a =1; a<80; a+=1)//setting value for a
{
strokeWeight(a/25);
smooth();
rotate(PI/20);//rotating the lines
line(50,100,200,0);
}
}



