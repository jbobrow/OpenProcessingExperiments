
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

for (int i=0; i<720; i+=10){
  rotate(radians(15));
ellipse(50,15,random(20,35),mouseY);
println(mouseX);
}

}


