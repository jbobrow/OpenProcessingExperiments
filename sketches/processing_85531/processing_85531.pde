
void setup()
{
size(400,300);
smooth();
}

void draw()
{
  background(10);

//shapes
//circles
noStroke();
fill(0,149,167,65);
ellipse(250,250,60,60);
ellipse(245,239,61,61);
ellipse(280,260,40,40);
ellipse(370,260,60,60);
ellipse(330,240,70,70);
ellipse(220,180,30,30);
ellipse(390,240,80,80);
ellipse(380,140,70,70);
ellipse(140,140,28,28);
ellipse(390,185,47,47);
ellipse(376,130,54,54);
ellipse(378,330,100,100);
ellipse(220,280,80,80);
ellipse(396,285,98,98);


ellipse(mouseX,mouseY,70,70);

/*println(mouseX);
println(mouseY);
//dot and lines
stroke(255)
line(250,250,245,239);
line(330,240,140,140);
line(378,330,396,285);
line(390,240,220,180);
line(390,240,245,239);
line(390,185,220,280);
line(140,140,280,260);
line(396,285,245,239);
*/
stroke(255);
line(250,250,245,239);
line(245,239,280,260);
line(280,260,250,250);
line(370,260,378,330);
line(330,240,378,330);
line(220,180,140,140);
line(390,240,370,260);
line(380,140,376,130);
line(390,185,390,240);
line(376,130,390,240);
line(220,280,250,250);
line(396,285,378,330);
line(220,180,250,250);
line(378,330,330,240);
line(245,239,330,240);
line(280,260,330,240);

noStroke();
fill(255);
ellipse(250,250,4,4);
ellipse(245,239,4,4);
ellipse(280,260,4,4);
ellipse(370,260,4,4);
ellipse(330,240,4,4);
ellipse(220,180,4,4);
ellipse(390,240,4,4);
ellipse(380,140,4,4);
ellipse(140,140,4,4);
ellipse(390,185,4,4);
ellipse(376,130,4,4);
ellipse(378,330,4,4);
ellipse(220,280,4,4);
ellipse(396,285,4,4);



//noLoop();

}
