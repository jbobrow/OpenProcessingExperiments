
void setup()
{size(500,500);}

void draw()
{  background(255);
smooth();
//cercle de triangles
//de base
fill(#FF0000,70);
noStroke();
translate(width/2, height/2);
for (int i=0;i<360;i+=30)
{rotate(radians(30));
triangle(30, 75, 58, 20, 86, 75);}
//plus petit
stroke(2);
scale(0.75);
for (int i=0;i<360;i+=30)
{rotate(radians(30));
triangle(30, 75, 58, 20, 86, 75);}
//plus grand
noStroke();
scale(1.5);
for (int i=0;i<360;i+=30)
{rotate(radians(30));
triangle(30, 75, 58, 20, 86, 75);}

// Cercles
// de base
for (int i=0;i<360;i+=30)
{rotate(radians(30));
ellipse(80,75,12,12);}

//moyens
stroke(2);
for (int i=0;i<360;i+=30)
{rotate(radians(30));
ellipse(80,75,40,40);}

}


