
//**Emily Workman-Let it Snow*/

void setup()
{
  size(400,600);
  background(5,5,5);
  smooth();
  textAlign(CENTER);
  noStroke();
}

void draw()
{
  fill(250,250,250);
  ellipse(20,20,100,100);
  fill(255,255,255,random(120));
  ellipse(random(400),random(600),5,5);
  textSize(60);
  fill(255,255,255);
  text("Let it Snow",width/2,height/2);

  rect(0,550,600,50); 
} 

