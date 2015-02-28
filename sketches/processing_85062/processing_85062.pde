
void setup()
{
size(500,500);
background(158,179,227);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
stroke(255);
noFill();
triangle (100,100,60,20,100,100);
}

}


