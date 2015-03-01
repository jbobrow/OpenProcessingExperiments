


void setup()
{
 size(500,500); 
 smooth();
}



float index = 0;
float right = 0;


void draw ()
{

  
background(0);
float my_sin = sin(index);
float speed = 0.5-(map(mouseX, 0, width, 0, 0.5));
index += speed;


float pos = map (my_sin,-1, 1, 0, width);
float y = map(my_sin,-1,1,0,height);

right += 5;


colorMode(HSB, 360, 100, 100);

float farbgrad = map(mouseX, 0, width, 55, 255);
stroke(farbgrad, 100, 100);
fill(farbgrad, 100, 100);

ellipse(right, y, 80, 80);


if(right>width)
{
 right=0; 
}

}
