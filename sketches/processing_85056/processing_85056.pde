
void setup()
{
size(500,500);
background(214,255,52);
smooth(); 
}

void draw()

{
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30)); 
noStroke();
fill(255,3,230);
rect(0,0,30,30);
}

}


