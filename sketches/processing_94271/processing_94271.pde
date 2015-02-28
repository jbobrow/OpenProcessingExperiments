
PVector pos, vel,rot, rPos;

void setup()
{
  size(400,400);
  background(100);
  pos = new PVector (width/2, height/2);
  rPos = new PVector ();
  vel = new PVector (.5,0);
  rot = new PVector();
}

void draw()
{

  rPos = new PVector (pos.x - 100*sin(frameCount*.01), pos.y - 100*cos(frameCount*.01));
  

  pos.x = width/2+sin(frameCount*.00999)*width/2;

//
//  rot = new PVector(sin(frameCount)*width/2,cos(frameCount));
////  vel.mult(rot);
////  vel.mult(2);
////  pos.add(vel);
//  pos.add(vel);
//  pos.mult(rot);
  fill(0);
  strokeWeight(5);
  point(rPos.x, rPos.y);
  if(mousePressed)
  {
    background(255);
    strokeWeight(1);
    line(pos.x, pos.y,rPos.x, rPos.y);
    strokeWeight(3);
    point(pos.x, pos.y);
    strokeWeight(5);
    point(rPos.x, rPos.y);
    textSize(14);
    text("Large point is rotating around the horizontally moving point",10,20);
  }

}


void mouseReleased() 
{
    background(100);
}


