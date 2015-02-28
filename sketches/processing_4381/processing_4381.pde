
//Adley Yuen, ARCH1391  
//Images used in this code, were found from the following links, chronologically  
//http://falconsscience.files.wordpress.com/2008/12/water_drop.png
//http://adobeperson.com/wp-content/uploads/2008/11/photoshop-water-drop-website-template-graphics16.jpg
//can't find the third image link sry

float x, y;  
float size = 1;
PImage a, b, c, d;
  
void setup()   
{
  size(300,400);  
  noStroke();  
  frameRate(30);
  a = loadImage("waterdrop.png");
  b = loadImage("waterdrop2.png");
  c = loadImage("waterdrop3.png");
  d = loadImage("waterdrop4.png");
}  
  
void draw()   
{ 
  background(255);  
    
  x = x + 0.5; 
  
  translate(20, x);  
  fill(155);  
  image(a, 0, 0);
  
  translate(100, x);  
  fill(155);  
  image(a, 0, -250);

  translate(100, x);  
  fill(155);  
  image(a, 0, -600);
  
  translate(-200, x);  
  fill(155);  
  image(b, 0, 0);

  translate(100, x);  
  fill(155);  
  image(b, 0, -250);

  translate(100, x);  
  fill(155);  
  image(b, 0, -600);

  translate(-210, x);  
  fill(155);  
  image(c, 0, 0);

  translate(60, x);  
  fill(155);  
  image(d, 0, -50);

  translate(70, x);  
  fill(155);  
  image(c, 0, -100);

  translate(70, x);  
  fill(155);  
  image(d, 0, -150);

  translate(-200, x);  
  fill(155);  
  image(b, 0, 0);

  translate(50, x);  
  fill(155);  
  image(b, 0, -250);

  translate(50, x);  
  fill(155);  
  image(b, 0, -600);
  
  translate(50, x);  
  fill(155);  
  image(b, 0, -250);

  translate(50, x);  
  fill(155);  
  image(b, 0, -600);
  
  translate(-210, x);  
  fill(155);  
  image(c, 0, -1000);

  translate(60, x);  
  fill(155);  
  image(d, 0, -1150);

  translate(70, x);  
  fill(155);  
  image(c, 0, -1300);

  translate(70, x);  
  fill(155);  
  image(d, 0, -1500);
}



