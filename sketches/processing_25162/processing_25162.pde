
class LightThread
{
  PVector orig,end1,end2,current,ctls1,ctle1,ctls2,ctle2,currentc1,currentc2,speed,speedc1,speedc2;
  int r,g,b;
  boolean threads,points,colorpoints;

  LightThread(float x, float y, float ex, float ey, float var, float s, float svar, int r, int g, int b)
  {
    // color
    this.r = r;
    this.g = g;
    this.b = b;

    // origin and end
    orig = new PVector(x,y);
    end1 = new PVector(ex+random(-var,var),ey+random(-var,var));
    end2 = new PVector(ex+random(-var,var),ey+random(-var,var));
    current = new PVector();
    current.set(end1);
    
    // control 1
    ctls1 = new PVector(random(x-var,x+var),random(y-var,y+var));
    ctle1 = new PVector(random(ex-var,ex+var),random(ey-var,ey+var));
    currentc1 = new PVector();
    currentc1.set(ctls1);

    // control 2
    ctls2 = new PVector(random(x-var,x+var),random(y-var,y+var));
    ctle2 = new PVector(random(ex-var,ex+var),random(ey-var,ey+var));
    currentc2 = new PVector();
    currentc2.set(ctls2);
    
    // speed
    speed = new PVector(random(s-svar,s+svar),random(s-svar,s+svar));
    speedc1 = new PVector(random(s-svar,s+svar),random(s-svar,s+svar));
    speedc2 = new PVector(random(s-svar,s+svar),random(s-svar,s+svar));
    
    // drawing
    threads = true;
    points = false;
    colorpoints = false;
  }
  
  void move()
  {
    current.add(speed);
    if( ((current.x < end1.x) && (current.x < end2.x)) || ((current.x > end1.x) && (current.x > end2.x)) )
      speed.x = -speed.x;
    if( ((current.y < end1.y) && (current.y < end2.y)) || ((current.y > end1.y) && (current.y > end2.y)) )
      speed.y = -speed.y;

    currentc1.add(speedc1);
    if( ((currentc1.x < ctls1.x) && (currentc1.x < ctle1.x)) || ((currentc1.x > ctls1.x) && (currentc1.x > ctle1.x)) )
      speedc1.x = -speedc1.x;
    if( ((currentc1.y < ctls1.y) && (currentc1.y < ctle1.y)) || ((currentc1.y > ctls1.y) && (currentc1.y > ctle1.y)) )
      speedc1.y = -speedc1.y;

    currentc2.add(speedc2);
    if( ((currentc2.x < ctls2.x) && (currentc2.x < ctle2.x)) || ((currentc2.x > ctls2.x) && (currentc2.x > ctle2.x)) )
      speedc2.x = -speedc2.x;
    if( ((currentc2.y < ctls2.y) && (currentc2.y < ctle2.y)) || ((currentc2.y > ctls2.y) && (currentc2.y > ctle2.y)) )
      speedc2.y = -speedc2.y;
  }
  
  void draw()
  {
    if(threads)
    {
      stroke(r,g,b,32);
      strokeWeight(1);
      bezier(orig.x,orig.y,currentc1.x,currentc1.y,currentc2.x,currentc2.y,current.x,current.y);
    }
    if(points)
    {
      if(colorpoints)
      {
        strokeWeight(2);
        stroke(255,64);
        point(orig.x,orig.y);
        stroke(255,0,0,64);
        point(currentc1.x,currentc1.y);
        stroke(0,255,0,64);
        point(currentc2.x,currentc2.y);
        stroke(0,0,255,64);
        point(current.x,current.y);
      }
      else
      {
        strokeWeight(2);
        stroke(255,64);
        point(orig.x,orig.y);
        point(currentc1.x,currentc1.y);
        point(currentc2.x,currentc2.y);
        point(current.x,current.y);
      }
    }
  }
}

