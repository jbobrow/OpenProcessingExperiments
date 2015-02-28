
void setup()
{
size(500,500);
background(24,0,255);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
stroke(255);
noFill();
ellipse (90,90,30,30);
}

}


