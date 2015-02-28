
//Sunny Li
//(c) Sunny Li 2013

float x, y, wd, ht, easingCoefficient;

PImage dog;
PImage bone;
PImage park;

void setup()
{
size(400, 400);
noStroke();
smooth();
x = width/2;
y = height/2;

easingCoefficient = 0.1;

bone = loadImage("bone.png");
dog = loadImage("dog.png");
park = loadImage("park.png");

}

void draw()
{
//background
image(park, 0, 0, 400, 400);

//dog
float dx = mouseX - x;
float dy = mouseY - y;

x = x + (dx * easingCoefficient);
y = y+ (dy * easingCoefficient );

image (dog, x, y, 100, 100);


//bone
image(bone, mouseX, mouseY, 80, 40);


}
