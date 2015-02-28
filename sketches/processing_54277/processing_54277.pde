
void setup ()
{
 size (1265, 300);
smooth();
noLoop();
frameRate(30);
colorMode(HSB, 360, 100, 100);
}

void draw ()
{
 background(100);

for (int i= 100; i<width; i += 200)
{
 float rs = random (20,0);
color rc = color (random (360), 75,85);
bed(i-50,height/6, rs, rc);
}
}

void bed(float x, float y, float s, color c)
{
 fill (c);
pushMatrix ();
strokeWeight(3);
stroke(360);
translate (x,y);
//mattress
rect(0, 0, 150,200);
// left pillow
rect(10,10,60,40);
//right pillow
rect(80,10,60,40);
//bedspread
rect(-5,60,160,20);

popMatrix();

}

void mousePressed()
{
   redraw();
}

