
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
triangle(random(0,50),random(0,50),random(20,30),random(60,40),random(70,50),random(50,60));


}}

}
