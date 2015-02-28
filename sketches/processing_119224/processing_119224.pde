
void setup()
{
size (500,500);
background (204,255,255);
}

void draw ()
{
background (204,255,255);



rect(75,75,20,100);

rect(100,100,20,100);

rect(125,125,20,100);

rect(150,150,20,100);

rect(175,175,20,100);

rect(200,200,20,100);

rect(225,225,20,100);

rect(250,250,20,100);

rect(275,275,20,100);

rect(300,300,20,100);

rect(325,325,20,100);


translate(150,150);
float my_angle = map(mouseX, 0, width, 0, 2*PI);
translate(width/2, height/2);
rotate(my_angle);
rectMode(CENTER);
rect(0,0,50,50);
}
