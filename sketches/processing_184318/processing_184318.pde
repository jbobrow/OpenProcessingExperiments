
//declare variables
int x=0;
void setup ()
 { // executed only once
size(200,150);
frameRate(70);}

color blue=#308BCE;
void draw ()
{fill(blue);
stroke (blue);
  //executed every frame
  rect(x,100,20,20);
x=x+1;
x=x%200;
println (x);}


