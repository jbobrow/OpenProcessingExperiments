
// copyright Yasha Mushtaq Mir
// HW-3 - 09.10.13 

float x, y, wd, ht;

// the dog caught the bird

void setup()
{
 size (400, 400);
 x=width;
 y=height;
 wd=width;
 ht=height;
 frameRate(8);
 }

void draw()
{
 background (129, 148, 185);
 // shadow bird
 stroke(57,102,188);
 fill (145,100,157);
 triangle(mouseX+100,mouseY+100,random(400),random(400),random(400),random(400));
 //bird
 stroke(57,102,188);
 fill (219,130,194);
 triangle(mouseX,mouseY, random(200), random(200), random(200),random(200));
 //dog
 fill (157, 151, 138);
 stroke(255);
 triangle (mouseX, mouseY, 350, 200, 350, 350);
 ellipse (mouseX, mouseY, 50,50);
 triangle (300, 150, 350, 200, 300, 200);
 
}



