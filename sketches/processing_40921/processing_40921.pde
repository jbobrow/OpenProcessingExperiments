
//homework 9
//copyright Kristen McConnell October 2011 Pittsburgh, PA 15221

float cubes,x;

void setup ()
{
 size(400,400,P3D);
 noStroke();
 lights();
 cubes = 1;
 x = 1;
 background(0);
}

void draw()
{
 space();
}

void space()
{
 pushMatrix();
   fill(0,0,255);
   if (cubes < 200)
   {
     translate(random(width),random(width),random(-width,-width/2));
     sphere(10);
     cubes = cubes + 1;
   }
   else if (cubes < 200 || cubes < 300)
   {
     fill(random(256),random(256),random(256));
     translate(random(width),random(width),random(-width,width));
     box(20);
     cubes = cubes + 1;
   }
   else 
   {
     hello();
   }
 popMatrix();
 pushMatrix();
   fill(255,0,255);
   if (x < width)
   {
     ellipse(x+((width*.05)/2),height*.9,width*.05,height*.05);
     rect(x,height*.95,width*.03,height*.03);
     x = x + 25;
   }
   stroke(0,255,0);
   strokeWeight(2);
   line(0,height*.85,width,height*.85);
   line(0,height*.95,width,height*.95);
   noStroke();
 popMatrix();
}

void hello()
{
 ambientLight(100,0,0);
 frameRate(5);
 background(0);
 fill(255,255,255);
 translate(width/2,height/2,-frameCount);
 rotateX(30);
 rotateZ(30);
 textSize(100);
 text ("Hello");
}

