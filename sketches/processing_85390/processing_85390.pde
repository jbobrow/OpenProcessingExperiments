
void setup()
{
size(400,400);
smooth();
}

void draw()
{
 background(255);
 stroke(100,23,131);
 noFill();
//rect(120,120,150,150);
println(mouseX);
println(mouseY);
/*
stroke(100,23,131);
line(120,120,270,270);
line(120,270,270,120);
*/
//triangles extérieur
stroke(100,23,131);
noFill();
triangle(120,110,195,185,270,110);
triangle(110,120,185,195,110,270);
triangle(120,280,195,205,270,280);
triangle(280,120,205,195,280,270);

//triangles milieu

triangle(195,170,145,120,245,120);
triangle(195,220,145,270,245,270);
triangle(220,195,270,145,270,245);
triangle(170,195,120,145,120,245);

//triangles centre

triangle(170,130,195,155,220,130);
triangle(130,168,155,195,130,220);
triangle(195,235,170,260,220,260);
triangle(235,195,260,170,260,220);


}
