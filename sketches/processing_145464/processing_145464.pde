
//Brady desGarennes - P.4 
float x;
float y;
int ygrow;

void setup ()
{
size (700,700);
frameRate (1000);
loop();


x = random(0,650);
}

void draw ()
{
//  noStroke();
background (100,200,100);
 ygrow = 50;
 y = y+1;
fill(100,200,100);
rect (x, y,50,50);


if (mousePressed)
{
  //stroke(255);
  pushMatrix();
  fill(#707070);
  rect(mouseX,mouseY,60,60);
  ellipse(mouseX+30,mouseY,70,60);
  rect(mouseX-20,mouseY+20,20,10);
  rect(mouseX+60,mouseY+20,20,10);
  popMatrix();
  fill(230,20,20);
  rect (x, y,50,50);
 }


    
  }
