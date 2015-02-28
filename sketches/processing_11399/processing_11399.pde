
float bruit, bruitDeriv, x, y;
int elapsedFrames;
PVector vel, acc, accDeriv;

void setup()
{
  background(255);
  size(300,300, P2D);
  noSmooth();
  vel = new PVector(0,0);
  acc = new PVector();
  accDeriv = new PVector();
}

void draw()
{
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  translate(width/2, height/2);
  for(int i=0; i<100;i++)
  {
    //translate(random(-10,10),random(-10,10));
    bruit = noise(width/2, height/2, elapsedFrames*.0025);
    acc.x = cos((bruit)*TWO_PI*10);
    acc.y = sin((bruit)*TWO_PI*10);
    vel.add(acc);
    vel.limit(50);
    pushMatrix();
    rotate(atan2(acc.x, acc.y)*TWO_PI);
    fill(0,20);
    strokeWeight(1);
    stroke(0,20);
    vel.normalize();
    vel.mult(100);
    line(vel.x+i*10,vel.y+i*10, vel.mag(), vel.mag());
    popMatrix();
    for(int j=i; j<100; j++)
    {
      bruitDeriv = noise(bruit, bruit, elapsedFrames * 0.01);
      vel.add(accDeriv);
      pushMatrix();
      accDeriv.x = cos((bruitDeriv)*TWO_PI*1);
      accDeriv.y = sin((bruitDeriv)*TWO_PI*1);
      vel.add(accDeriv);
      rotate(atan2(accDeriv.x, accDeriv.y)*TWO_PI);
      fill(255,10);
      noStroke();
      stroke(255,255 - cos(vel.x*.01)*128);
      vel.div(10);
      fill(255 -norm(cos(x*.001), 0.0,255)*255,255 -norm( y,0.0,255)*255,255-norm(x*y*.001,0.0,10)*255,10);
      rect(vel.x*(i),vel.y*(i), 10, 10);
      popMatrix();
    }
    elapsedFrames++;
  }
}

