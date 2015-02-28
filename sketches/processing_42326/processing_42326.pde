
flock[] f;

void setup()
{
 size(1000,500);
 smooth();
 stroke(240);



 f = new flock[45];
 for(int i=0; i<45; i++)
 {
   f[i] = new flock();
   f[i].x = random(width,width*2);
   f[i].y = random(height,height*2);
   f[i].d = (int)(5);
   f[i].v = (int)(5);
 }
}

void draw()
{
 background(66,75,70);
 for(int i=0; i<f.length; i++)

 {

   f[i].show();
 }
}

class flock
{
 float x, y;
 int d, v;

 void show()
 {
     x += ( mouseX- random (width/1 ) ) * 0.01 * v;
   y += ( mouseY - random(height/1 )) * 0.01 * v;
   fill(random(255),random(255),random(255),30);
   smooth();
   ellipse(x,y, d,d);

 }





}


