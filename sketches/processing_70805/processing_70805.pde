
void setup()
{
size(900,900);
noStroke();
}

void draw()
{
//color settings
int re = mouseX;
int gr = mouseY;
int bl = mouseX+mouseY;
for(int i = 0;re>255;i++)
{
re = re- 255;
}
for(int i = 0;gr>255;i++)
{
gr = gr - 255;
}
for (int i = 0;bl>255;i++)
{
bl = bl - 255;
}
background(re/2,gr-50,bl-8);
fill(re,gr,bl);
pushMatrix();
translate(100,100);
for(int i = 0; i<50; i++)
{translate(0,10);rect(0,0,10,10);}
for(int i = 0; i<20; i++)
{translate(10,10);rect(0,0,10,10);}
fill(re-gr,gr/90,bl);
for(int i = 0; i<30; i++)
{translate(10,0);rect(0,0,10,10);}
fill(0,gr,bl);
for(int i = 0; i<20; i++)
{translate(10,-10);rect(0,0,10,10);}
for(int i = 0; i<50; i++)
{translate(0,-10);rect(0,0,10,10);}
popMatrix();
//mouth
fill(re/1.5,gr,bl/1.2);
triangle(550, 600, 460, 720, 400, 600);
pushMatrix();
//hair
fill(re-20,gr-70,bl);
for(int i = 0;i<35;i++)
{translate(20,0);triangle(90, 60, 200, 60, 40, 150);}
popMatrix();
//eyes
fill(re,gr/2,bl/6);
triangle(260, 280, 260, 350, 240, 320);
triangle(360, 280, 360, 350, 380, 320);
rect(260,280,100,70);
pushMatrix();
translate(200,0);
triangle(260, 280, 260, 350, 240, 320);
triangle(360, 280, 360, 350, 380, 320);
rect(260,280,100,70);
popMatrix();

}
