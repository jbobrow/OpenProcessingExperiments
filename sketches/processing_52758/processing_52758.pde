
float shifting;
float shifting1;
float shifting2;

void setup()
{
  size(500, 500, P3D);
}

void draw()
{

shifting = shifting + 1;
shifting1 = shifting1 + .01;
shifting2 = shifting2 + 1;
background(0);
noStroke();
ambientLight(51,102,shifting);
  //Ambient lighting is the most basic type of lighting. 
  //It is comparable to having light coming from everydirection
  // Like a global "tint"
  // Its parameters are RGB
//pointLight(51, 102, 126, 0, shifting, 36);
//pointLight(156, 30, 41, shifting, 0, 36);
  // A point light is a color of light that comes from a 
  // specific direction.
  // Think of it as a sun that shines from a specific direction
//spotLight(51, 102, 126, shifting, 20, 40, 1, 0, 0, PI/2, 2);
//spotLight(51, 102, 126, 100, 500, 40, 1, 0, 0, shifting, 2);
//spotLight(51, 102, 126, 100, 500, 40, 1, 0, 0, shifting1, 2);
  // A spotlight is much like a spotlight except you can control 
  // more attributes. Such as the angle of the spotlightcone.
translate(height/2, height/2, 0);
sphere(75);


}

