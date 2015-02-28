
void setup()
{
  size(400,600);
  background (61, 111,46);
  smooth();
  textAlign(CENTER);
  frameRate(15);
}
void draw ()
{
  //fill(255,255,255,100);
   //rect(0,0,width,height);
  
  fill( random(170), random(22), random(42));
  textSize(random(8,36) );
  text("Merry Christmas && Happy New Year!", random(width), random(height));
}


