
/* @pjs preload="Montyprofile.jpg"; */


PImage myimage;

String myname= "Dan";

float mynumber = 0;

color red = color(255,255,255);

boolean ellipsoid = false;


void setup()
{
  size(500, 500);
  frameRate(30);
   myimage = requestImage("Montyprofile.jpg");
   myimage.filter(INVERT);
}

void draw()
{
  println("x: " + mouseX + "y: " + mouseY);
  if (myimage.width > 0)
  {
 
image(myimage, 0, 0, width, height);

  }

  println(mynumber);

  if( mouseX <= width/3)

  
  
{  
  

  ellipsoid = true;
  stroke(#CD2222);
}


else if(mouseX <= (width/3)*2)
{
  ellipsoid = false;
  stroke(#eeeeee);
}


else
{
  ellipsoid= false;
  stroke(#CC9999);
}

if (ellipsoid == true)
{
  stroke(#CD2222);
}

  line(337, 109,mouseX,mouseY);

for (int yoffset = 0; yoffset < width; yoffset +=30)
{

   for (int xoffset2 = 0; xoffset2 < width; xoffset2 +=30)
   {
     strokeWeight(mouseY/50);
     stroke(#CD2222);
     
     
     
     noFill();
     
     
   }
   
   stroke(#000000);
}

fill(#000000);
triangle(213, 224, 323, 245, 309, 310);

fill(#CD3333);
triangle(309, 310, 367, 381, 299, 500);

fill(#FFFFFF);
triangle(353, 407, 388, 500, 299, 500);

fill(#3333CD);
triangle(299, 500, 189, 380, 309, 310);

fill(#FFFFFF);
triangle(243, 350, 213, 224, 309, 310); 

fill(#000000);
triangle(189, 380, 170, 500, 299, 500);

fill(#CD3333);
triangle(213, 224, 189, 380, 243, 350);

fill(#3333CD);
triangle(213, 224, 170, 137, 146, 265);

fill(#000000);
triangle(146, 265, 213, 224, 189, 380);

fill(#FFFFFF);
triangle(146, 265, 170, 500, 189, 380);

fill(#FFFFFF);
triangle(170, 137, 287, 102, 245, 50);

fill(#CD3333);
triangle(287, 102, 360, 0, 245, 50);

fill(#000000);
triangle(205, 0, 245, 50, 360, 0);

fill(#3333CD);
triangle(209, 92, 205, 0, 245, 50);

fill(#CD3333);
triangle(209, 92, 205, 0, 170, 137);

fill(#FFFFFF);
triangle(170, 137, 90, 0, 205, 0);

fill(#000000);
triangle(90, 0, 115, 135, 170, 137);

fill(#CD3333);
triangle( 115, 135, 170, 137, 146, 265);

fill(#3333CD);
triangle(146, 265, 90, 368, 157, 380);

fill(#CD3333);
triangle(157, 380, 90, 368, 170, 500);

fill(#000000);
triangle(90, 368, 170, 500, 0, 500);

fill(#FFFFFF);
triangle(90, 368, 146, 265, 115, 137);

fill(#3333CD);
triangle(0, 500, 90, 368, 0, 200);

fill(#000000);
triangle(0, 200, 90, 368, 115, 137);

fill(#CD3333);
triangle(0, 200, 115, 137, 0, 55);

fill(#3333CD);
triangle(0, 55, 0, 0, 115, 137);

fill(#FFFFFF);
triangle(0, 0, 99, 51, 115, 137);

fill(#CD3333);
triangle(0,0, 99, 51, 90, 0);

fill(#000000);
triangle(90, 0, 190, 58, 205, 0);




stroke(#6666ee);
strokeWeight(5);
float ly = mouseY;
float lx = mouseX;
int numberOfLines = 1;
while (lx < width)
{
  float nextX = lx + random(10);
  float nextY = ly + random(50);
  line(lx, ly, 337, 109);
  ly = nextY;
  lx = nextX;

noFill();
  }

}



