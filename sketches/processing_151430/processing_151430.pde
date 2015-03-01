
class signal
{
  signalpt src;
  signalpt target;
  float travel;
  bool received = false;
  float spd = random(5)/8 +0.7;

  public signal(start, end)
  {
    src = start;
    target = end;
  }

 void kill()
  {
    int idx = sigs.indexOf(this);
    sigs.splice(idx, 1);
  }

  void draw()
  {
     if(travel < 100)
     {
         travel += spd;
     }
     else
     {
         if(!received)
         {
            target.receive(this);
            received = true;
         }
         
     }
     var px = lerp(src.x, target.x, travel/100);
     var py = lerp(src.y, target.y, travel/100);
     fill(255,0,0);
     stroke(255);
     ellipse(px,py,5,5);
  }
}

class signalpt
{
   float infat = 0;
   float x,y;

   var conn = [];

   public signalpt(){
     x = random(80 + width - 80);
     y = random(80 + height - 80);
   }
   
   void draw()
   {
      stroke(120,120,255);
      for(var c : conn)
      {
         line(x, y, c.x, c.y);
      }
      fill(255);
      stroke(80,80,255);
      ellipse(x ,y ,10+infat, 10+infat);
      if(infat > 0)
       {
          infat *= 0.995;
       }
   }

   void receive(sig)
   {
      infat += 3;
      for(var con : conn)
      {
         if(random(infat) > infat-5)
         {
           sigs.push(new signal(this, con));
         }
      }
   }
}

var pts = [];
var sigs = [];

void setup()
{
  // setup() runs once
  size(500, 500);
  smooth();
  for(var i=0; i < 20; i++)
  {
     pts.push(new signalpt());
  }

 for(var spt : pts)
 {
    for(var spb : pts)
    {
        if(random(10) > 8)
        {
           spt.conn.push(spb);
        }
    }
 }
 spawn();
 spawn();
}

void spawn()
{
  var start = pts[(int)random(pts.length)];
  var end  = start.conn[(int)random(start.conn.length)];
  sigs.push(new signal(start, end));
}

void draw()
{
  if(sigs.length == 0)
  {
     spawn();
  }

  // draw() loops forever, until stopped
  background(255);
  for(var spt : pts)
  {
     spt.draw();
  }
  for(var sig : sigs)
  {
     sig.draw();
  }

  for(int i=sigs.length; i >0; i--)
  {
         if(sigs[i-1].received)
         {
            sigs[i-1].kill();
         }
  }

  if(random(100) > 95)
  {
    //spawn();
  }
}
