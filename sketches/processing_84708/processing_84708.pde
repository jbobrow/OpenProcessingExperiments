
void setup ()
{  size(500,500);
}

void draw()
{ background (#BFB5AF);
noStroke();
fill(#FF5E00,60);
smooth();

for (int i=0;i<150;i+=14){
translate(7,7);
rotate(radians(2));
triangle(250,125,160,250,330,250);}
}


