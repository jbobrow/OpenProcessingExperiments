
void setup()
{
  size(600, 400);
  background(255, 255, 255);
  smooth();
  textAlign(CENTER); 
  strokeWeight(3);
}
void draw()
{
  textSize(73);
  fill(0,255,0,255);
  text("Merry Christmas",300,200);

  fill(255,0,0,255);
  textSize(70);
  text("Merry Christmas",300,200);
  fill(random(255),random(255),random(255),random(150));
  textSize(random(40));
  text("Merry Christmas",random(600),random(400)); 
  //fill(random(0),random(255),random(0),random(110));
  textSize(random(40));
  text("Merry Christmas",random(600),random(400)); 

}

