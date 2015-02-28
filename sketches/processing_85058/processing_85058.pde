
void setup()
{
size(500,500);
background(236,214,255);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
stroke(157,255,248);
fill(252,255,180);
ellipse (50,50,20,70);
}

}


