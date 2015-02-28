
void setup()
{
 size(600,600);
background(255);
stroke(4);
colorMode(HSB);
smooth();
}

void draw(){
 fill(mouseX,mouseY,20,20);
 stroke(.5);
 rect(mouseY,mouseX,0,0);
 fill(random(100-254));
 stroke(.05);
 ellipse(mouseY,mouseX,random(5),random(5));
  fill(mouseX,mouseY,100,20);
  stroke(.1);
 ellipse(mouseY,mouseX,random(10-100),random(10-100));
}

