
void setup()
{
size(1024,600);
background(0,0,0);
smooth();
fill(255,0,0);
frameRate(12);
}
void draw()
{
  fill(0,0,0);
  rect(0,0,width,height);
  fill(255,255,255);
  ellipse(50,60,5,5);
  ellipse(67,354,5,5);
  ellipse(786,354,5,5);
  ellipse(35,550,5,5);
  ellipse(117,453,5,5);
  ellipse(509,493,5,5);
  ellipse(786,173,5,5);
  ellipse(743,343,5,5);
  ellipse(787,600,5,5);
  ellipse(647,366,5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  ellipse(random(width),random(height),5,5);
  
  fill(250, 242, 5);
  textSize(50);
  textAlign(CENTER);
  text("Star Wars: Episode IV \n A NEW HOPE",width/2,-frameCount+610);
  textSize(35);
  textAlign(CENTER);
  text("A long time ago in a galaxy far far away \n It is a period of civil war. \n Rebel spaceships, striking \n from a hidden base, have won \n their first victory against \n the evil Galactic Empire. \n \n During the battle, Rebel spies managed to steal \n secret plans to the Empire's ultimate weapon, \n the DEATH STAR, an armored space station \n with enough power to destroy an entire planet. \n \n Pursued by the Empire's sinister agents, \n Princess Leia races home aboard her starship, custodian \n of the stolen plans that can save her people \n and restore freedom to the galaxy...",width/2,-frameCount+750);
 }
