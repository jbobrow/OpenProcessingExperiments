
void setup()

{
size(500,500);
background(#FFFFFF);

}

void draw()
{
  //background(255);
noFill();
translate(width/Z,height/Z);

fill(#FF0808);
ellipse(0,0,400,400);
line(0,200,0,0);
line(00,0,200,0);
line(0,0,-200,0);
line(0,-200,0,0);


float winkel = map(mouseX, mouseY, 500, 0, 2*PI);
rotate(winkel);
println(mouseX);
println(winkel);

line(0,0,500,100); 

}
