
void setup ()

{
  size(400, 600);

   background (255,0,255);

  smooth();
  
  frameRate(random (25));

}

void draw ()
{
  textSize(30);
   
   fill(random (255), random (255), random(255));
  
  text ("I LOVE CAROLINE",random(width), random (height));

   strokeWeight(random(7));

  stroke(random(255),random(255),random(255));

   fill(random(255), random (200), random (200), random(200)) ;

  rect(random(width), random(height), 50,40);


}
