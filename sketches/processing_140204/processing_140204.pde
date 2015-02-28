
void setup ()
{
  size (800,800); // 
  background (255,255,255);
  smooth ();
  frameRate(100);
}
//ez mÃ�Â©g nem stimt
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
  
void draw ()
{
  stroke(200,200,200)
  fill (random (87) ,random (20), random (10)); 
  ellipse (random(800),random(800), 2, 2); 
   
  stroke(255,0,0);
  fill(255,255,255);
  ellipse(mouseX,mouseY,random(50),random(50));
 
 

  
  //ez mÃ�Â©g nincs befejezve, radius mÃ�Â¡r jÃ�Â³, pÃ�Â­ kell


 

}
