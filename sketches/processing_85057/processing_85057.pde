
void setup()
{
size(500,500);
background(162,223,255);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
stroke(252,255,162);
fill(162,255,209);
ellipse (30,50,80,80);
}

}


