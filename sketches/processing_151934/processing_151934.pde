
size(600,600);

loadPixels();

int i=0;
for(int y=0; y<height; ++y)
{
 for(int x=0; x<width; ++x, ++i)
 {
 float giallo = random(50) + x;
 float rosso = 255 +y;
 pixels[i] = color(rosso,giallo,40);
  }
 }
 updatePixels();
 
float angolo=0;

for (int y=0; y<=height; y=y+40)
{
for (int x=0; x<=width; x=x+30)
{

angolo += 0.003;

resetMatrix();
translate( x,y );
rotate( angolo );
scale(0.2,5);

line(0,0, 30,15);

}
}

