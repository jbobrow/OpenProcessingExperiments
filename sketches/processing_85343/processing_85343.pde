
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

for (int i=0; i<360; i+=10){
  rotate(radians(2));
ellipse(250,250,mouseX,mouseY);
println(mouseX);
}

}


