
void setup ()
{ size (400,400);
background (255);
println();
translate(width, height); 
smooth ();

}

void draw ()
{
for (int i=0;i<360;i+=10){
rotate(radians(10)); 
ellipse(10,10,200,50);
ellipse(5,10,200,50);
ellipse(15,15,200,50);
ellipse(20,20,200,50);
ellipse(200,200,100,50);
ellipse(300,300,100,20);




}

}

