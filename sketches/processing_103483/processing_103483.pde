

float r, g, b;
void setup()
{
size(400,400);
background(0,300,300);
frameRate(10);


}

void draw()
{
 r=random(255);
g=random(255);
b=random(255);
  fill(r, g, b);
//fill(175, 100, 220);  
rect(10,50,25,200);
quad(10, 50, 40, 50, 130, 250, 100, 250);
rect(110,50,25,200);

rect(260,50,25,200);
quad(260, 50, 290, 50, 380, 250, 350, 250);
rect(360,50,25,200);

triangle(120, 400, 198, 20, 275,400);

fill(400,0,200);
triangle(170, 250, 198, 100, 225,250);
quad(232, 275, 255, 400, 140, 400, 165, 275);
}


