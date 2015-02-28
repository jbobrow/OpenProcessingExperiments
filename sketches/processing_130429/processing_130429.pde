

int xInc = 30;
int yInc = 30;
float diameter = 40; 
float angle = 0;
float y1 = 0;
float x1 = 0;
float deg = 0;
float v = .1;


void setup()
{
size(500,500);
background(0);
}

void draw()
{
  background(0);
for ( int x = 50; x < 450; x += xInc){
//  y1 = 10 + (cos(angle) * diameter/2) + diameter/2;
//x1 = 10 + (sin(angle) * diameter/2) + diameter/2;
for (int y = 50; y < 450; y += yInc){
  fill(random(255), random(255), random(255));
//deg = deg + 1;
//rotate(radians(deg));
arc(x, y, 20, 20, v * PI, (1 + v)* PI, CHORD);
v = v+ .01;
//arc(x + x1, y + y1, 20 + x1, 20 + y1, 0, PI, CHORD);
//angle += 0.02;
}
}
}


