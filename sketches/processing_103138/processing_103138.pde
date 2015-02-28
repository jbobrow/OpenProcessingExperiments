
//#random= a call  #void=return things #color is also a function
//#number of floats alldiff =+ draw=60 a sec, dont call this
//don't ask why, how   int=whole numbers float=tells comp where to be (smaller)
//int with function must be an int, 0 doesn't count as int; float good for decimals
//random, dist, map return float; to change decimal to int: casting, num=int(random(100)); lose the decimal
//random and radius give values back, so float; Functions owns=wrote, calls=used
//setup; we own, processing calls
//event functions, we own, processing calls when the action is performed
//Custom functions, we own, we call
//= is assing, == is equality
float x, y, dim;

void setup()
{
  size(500, 500, OPENGL );
  noStroke( );
} 

void draw()
{
  background(random(255), (255), (255));
  
  fill(100, 200, 300 );
  //ellipse(0, 0, 100, 100);
  translate(width/2, height/2 ,0 );
  //anything you draw when you rotate stays there
  lights( );
  rotateX(radians(10));
  rotateY(radians(frameCount));
  rotateZ(radians(frameCount));
  sphere(20);
  fill(300, 100, 100);
  pushMatrix();
    translate(100,0,0);
    //sphere(100);has matrix sheet; can do things and throw them away
    //temporary jump, from where you are, you want to move, but snap back when done
    //so, can get a copy of the matrix, and figue out jump points to move
    sphere(mouseX);
    fill(200, 300, 100);
  popMatrix();
    translate(26, 42, 76);
    sphere(75);
    fill(300, 200, 100);
  
  pushMatrix();
    translate(200, 0, 0);
    sphere(50);
    fill(300, 100, 200);
    
  popMatrix();
    translate(0, 200, 16);
    sphere(75);
    fill(300, 200, 100);
  
 

    
    
 
}


