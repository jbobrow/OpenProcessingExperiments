
//Karem Yarime Valencia Gonzalez
int x,y;

void setup()
{
 size(200,200);
 smooth();
 strokeWeight(5);
 noFill();
 background(255);
}
void draw()
{
stroke(255,0,0);
background(255);
x=mouseX-25;y=mouseY-25;
ellipse(x,y,50,50);
stroke(0,0,255);
ellipse(40,70,50,50);
stroke(0);
ellipse(100,70,50,50);
stroke(265,255,0);
ellipse(60,90,50,50);
stroke(0,255,0);
ellipse(130,90,50,50);
}


