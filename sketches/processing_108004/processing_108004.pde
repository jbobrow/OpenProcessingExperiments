
/*
done as a quick sketch of a map of a cosmos where
lifeforms do not perceive each other
for Lowry Burgess' Concept Studio II
CFA@CMU, 2013
by Melanie Kim
*/

void setup()
{
  size(500, 500);
  background(0);
  noStroke();
  //smooth();
  frameRate(30);
}

void draw()
{
  int count = int(random(0, 10));
  for(int i = 0; i<count; i++){
    Lifeform life = new Lifeform(int(random(1, 4)));
    life.mapped(random(0,width),random(0,height));
  }
  
}

class Lifeform
{
  int form;
  Lifeform (int shape)
  {
    form = shape;
  }
  void mapped(float x, float y)
  {
    fill(255);
    if(form == 1){
      ellipse(x, y, random(1, width/10), random(1, height/10));
    }
    else if(form == 2){
      rect(x, y, random(1, width/10), random(1, height/10));
    }
    else{
      triangle(x, y, x-random(1,width/10), y+random(1, height/10),
      x+random(1,width/10), y+random(1,height/10));
    }
  }
}


