
class smoke
{
   float x, y, yv, xv, life, maxLife, sz;
   emitter em;
   boolean flame;
   
   public smoke(emitter emp)
   {
      x = 10;
      y = 10;
      xv = 0;
      yv = 0;
      sz=2;
      em = emp;
      reset();
   }

   void tick()
   {
      y += yv;
      x += xv;
      float cmo = (life / maxLife)*200;
      if(flame)
      {
        fill(cmo,77,77,55+cmo);
        ellipse(x,y, sz,sz);
      }
      else
      {
        fill(cmo, cmo, cmo, cmo);
        ellipse(x,y, sz+cmo/50, sz+cmo/50);
        yv-=0.05;
      }
      life--;
      if(life < 0)
     {
        reset();
     }
   }

   void reset()
   {
      x = em.x;
      y = em.y;
      xv = (em.xv + (0-1 + random(2))/10)/2;
      yv = (em.yv /4);
      life = 30 + random(50);
      maxLife=life;
      sz=em.szs+random(2);
      flame = random(1) > 0.49;
   }

}

class emitter
{
   float x, y, ppt, yv, xv, szs,initx, inity, life,maxLife;
   float mSize=6;
   var smokes = Array();
   
   public emitter(float xp, floaty yp, float ppsp)
   {
      x = xp;
      y = yp;
      initx = xp;
      inity = yp;
      ppt = ppsp;
      reset();
      for(var i=0; i < ppt; i++)
      {
         smokes.push(new smoke(this));
      }
   }

   void tick()
   {
      yv = yv + gravity;
      y += yv;
      x += xv;
      float cmo = (life / maxLife)*200;
      fill(55+cmo,55+cmo,55);
      szs = (life / maxLife)*mSize;
     ellipse(x,y, szs, szs);
      life--;
      if(x < 0 || x > width || y > height || life < 0)
     {
        reset();
     }
     for(var s: smokes)
     {
        s.tick();
     }
   }

   void reset()
   {
      x = initx;
      y = inity;
      xv = 0-1 + random(2);
      yv = 0-random(2);
      life = 200 + random(100);
      maxLife = life;
   }

}

float gravity = 0.012;


var emitters = Array();

void setup()
{
  //frameRate(30);
  size(640, 420);
  ellipseMode(CENTER);
  noStroke();
  //smooth();
  for(var i=0; i < 30; i++)
  {
  emitters.push(new emitter(width/2,height/3,20));
  }
}
void draw()
{
  // draw() loops forever, until stopped
  background(60,60,155);
  fill(0);
  beginShape();
  vertex(0, height);
  vertex(width, height);
  vertex(width /2, height/3);
  endShape();
  fill(255,255,0);
  for(var e : emitters)
  {
    e.tick();
  }
}
