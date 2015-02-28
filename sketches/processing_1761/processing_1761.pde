
//belli bir düzen içnde ama rastgele boyutlarda şekiller.

float x;
float y;
float z;

void setup()
{
  size(260,430);
  background(214,32,32);
  noStroke();
}
void draw()
{
  //alttaki kareler ilk 3 kare için.
  x=random(90,180);
  fill(0);
  rect(40,240,60,random(x));
  rect(110,200,50,random(x));
  rect(170,200,80,random(x));

  //üstteki siyah kareler için.
  y=random(90,140);
  rect(30,70,70,random(y));
  rect(100,10,random(y),60);

  // üst taraftaki büyük beyaz kare için.
  z=random(80,140);
  fill(200);
  rect(115,80,100,random(z));

  // üst taraftaki beyaz karenin ortasına üçgen.
  fill(214,32,32);
  triangle(130, 160, 130, 110, 190, 110);
}










