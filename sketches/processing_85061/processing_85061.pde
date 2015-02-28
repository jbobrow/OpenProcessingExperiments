
void setup()
{
size(500,500);
background(255);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
stroke(0);
noFill();
ellipse (20,20,150,150);
}

}


