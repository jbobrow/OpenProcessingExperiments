
void setup ()
{
  size(400,400);
  background(63,191,240);
  smooth();
}

void draw ()
{
  background(63,191,240);
//head
  fill(250,199,136);
  ellipse(200,200,200,200);
   //eyes
  fill(255,255,255);
  ellipse(170,170,30,30);
  fill(255,255,255);
  ellipse(240,170,30,30);
  //eyeballs
  fill(0,0,0);
  ellipse(175,175,10,10);
  fill(0,0,0);
  ellipse(233,175,10,10);
  //hairbow
  fill(124,250,104);
  quad(125,100,125,150,200,100,200,150);
  //mouth
  fill(255,0,0);
  ellipse(200,250,75,75);
  //nose
  fill(250,199,136);
  ellipse(200,200,30,10);
  //pacifier
  fill(255,100,150);
  ellipse(200,270,30,50);
  fill(255,0,0);
  ellipse(200,270,10,25);
  //text
  textSize(random(36));
  textAlign(CENTER);
  text("Goo Goo \n Ga Ga!", mouseX, mouseY);
  
}
//samantha fethke's sketch
