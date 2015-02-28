
PImage car;
PImage back;
int timeVar;

void setup()
{
 background(255);
 size(548,548);
 car = loadImage("car.png");
 back = loadImage("background.png");
}

void draw()
{
 timeVar = frameCount%((548/2)+76);
 image(back,0,0);
 image(car,-130+2*timeVar,100+timeVar); 
}

