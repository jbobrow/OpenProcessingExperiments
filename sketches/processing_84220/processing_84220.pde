
void setup()
{
size(500,500);
smooth();

}

void draw()
{

 background(255);
 noFill();
stroke(0);

 for (int x = 0; x < width; x = x + 15){
   for (int y = 0; y < height; y = y + 25){
   
translate(10,10);
rotate(PI/90);
scale(1);
triangle(random(0,50),random(0,50),random(200,300),random(300,400),random(140,150),random(150,160));


}}

}
