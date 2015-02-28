
PImage bg;
void setup() 
{
  size(750, 558);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "earth.jpg"
  // is 450 x 450 pixels.
  bg = loadImage("sunset.jpg");
}
void draw()
{
  
background(bg);


fill(3,3,3);
arc(mouseX,mouseY,240,150,0,PI);


fill(155,81,2);
rect(86,230,40,700);
fill(2,155,10,100);
triangle(86,230,0,180,100,230);
fill(2,155,10);
triangle(86,230,10,160,100,230);
fill(2,155,10,100);
triangle(86,230,15,140,100,230);
fill(2,155,10);
triangle(86,230,200,120,100,230);
fill(2,155,10,100);
triangle(86,230,25,100,100,230);
fill(2,155,10);
triangle(86,230,220,80,100,230);
fill(2,155,10,100);
triangle(86,230,30,80,100,230);
fill(2,155,10);
triangle(95,230,45,80,130,230);
fill(2,155,10,100);
triangle(95,230,45,80,110,230);
fill(2,155,10);
triangle(95,230,90,80,110,230);
fill(2,155,10,100);
triangle(95,230,110,80,110,230);
fill(2,155,10);
triangle(95,230,90,80,110,230);
fill(2,155,10,100);
triangle(95,230,125,80,120,230);
fill(2,155,10);
triangle(95,230,140,80,115,230);
fill(2,155,10,100);
triangle(95,230,150,80,120,230);
fill(2,155,10);
triangle(110,230,150,80,125,230);
fill(2,155,10,100);
triangle(95,230,150,80,130,235);
fill(2,155,10);
triangle(100,230,180,80,125,230);
fill(2,155,10,100);
triangle(95,230,195,100,130,220);
fill(2,155,10);
triangle(95,230,180,150,115,235);
fill(2,155,10,100);
triangle(95,230,180,170,115,235);
fill(2,155,10);
triangle(95,230,200,180,115,235);
fill(2,155,10,100);
triangle(95,230,190,190,115,235);
fill(3,3,3);
rect(300,150,30,130);

fill(255,249,75,50);
triangle(mouseX,mouseY,300,150,mouseX,130);


fill(255,255,245);
rect(mouseX,mouseY,50,10-90);
fill(0,5,5,100);
rect(mouseX,mouseY,40-10,10-60);
}




