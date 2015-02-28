
void setup()
{
  size(500, 500);
  background(250);
  smooth();
}



void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);
translate (width/2, height/2);

for (int i=50; i<720; i+=10){
  rotate(radians(random(10,360)));
triangle(mouseX,100,100,mouseY,86,75);

println(mouseX);
}

}


