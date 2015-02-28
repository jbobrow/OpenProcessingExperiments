
//Karem Yarime Valencia Gonalez
float x;
float y;

void setup()
{
 size(200,200);
 smooth();
 noFill();
 background(255);
}
void draw()
{
background(255);
x=int(random(100));
y=int(random(100));
  stroke(255,0,0);

if((x!=160) && (y!=70))
{
  ellipse(x,y,50,50);//rojo
}
else
{
    ellipse(160,70,50,50);
    noLoop();
}
stroke(0,0,255);
 strokeWeight(5);
ellipse(40,70,50,50);//zul

stroke(0);
 strokeWeight(5);
ellipse(100,70,50,50);//negro

stroke(265,255,0);
 strokeWeight(5);
ellipse(60,90,50,50);//amarillo

stroke(0,255,0);
 strokeWeight(5);
ellipse(130,90,50,50);//verde
}


