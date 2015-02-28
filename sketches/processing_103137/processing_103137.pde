
// copyright Andrew Levandoski July 5 2013
// 3-D Space

float x,y,dim;

void setup()
{
  size(800,800, OPENGL);
  noStroke();
}

void draw()
{
 background(0);
 fill(200,200,0);
 stroke(255);
 point(330,100);
 point(100,75);
 point(750,200);
 point(400,750);
 point(50,600);
 point(500,650);
 noStroke();
 translate( width/2, height/2, 0);
 lights();
 rotateY(frameCount*.02);
 sphere(100);
 pushMatrix();

 //sun's rotation
   rotateX(radians(25));
   rotateY(radians( frameCount*.1));
   sphere(100);

   //Earth
   translate(200,0,0);
   rotateX(radians(45));
   rotateY(radians( frameCount));
   fill(0,23,230);
   sphere(10);
   pushMatrix();
   //Moon
     translate(15,0,0);
     fill(255);
     sphere(2);
   popMatrix();
 popMatrix();
// pushMatrix();
////Jupiter
//   translate(300,0,0);
//   rotateX(radians(180));
//   rotateY(radians( frameCount));
//   fill(252,178,28);
//   sphere(30);
// popMatrix();
 pushMatrix();
 //Mars
   translate(250,0,0);
   rotateX(radians(325));
   rotateY(radians( frameCount));
   fill(230,3,0);
   sphere(12);
   pushMatrix();
   //MarsMoon1
     translate(16,0,0);
     fill(255);
     sphere(2);
   popMatrix();
 
 popMatrix();
 
}
