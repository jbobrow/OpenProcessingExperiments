
import ddf.minim.*;

Minim minim;
AudioSample a;
AudioSample b;
AudioSample c;
AudioSample d;
AudioSample e;

AudioSample f;
AudioSample g;
AudioSample h;
AudioSample i;
AudioSample j;

AudioSample k;
AudioSample l;
AudioSample m;
AudioSample n;
AudioSample o;

AudioSample p;
AudioSample q;
AudioSample r;
AudioSample s;
AudioSample t;

AudioSample u;
AudioSample v;
AudioSample w;


void setup()
{
  size(300, 300);
 

  minim = new Minim(this);
  a = minim.loadSample("a.mp3");
  minim = new Minim(this);
  b = minim.loadSample("b.mp3");
  minim = new Minim(this);
  c = minim.loadSample("c.mp3");
  minim = new Minim(this);
  d = minim.loadSample("d.mp3");
  minim = new Minim(this);
  e = minim.loadSample("e.mp3");
  minim = new Minim(this);
  f = minim.loadSample("f.mp3");
  minim = new Minim(this);
  g = minim.loadSample("g.mp3");
  minim = new Minim(this);
  h = minim.loadSample("h.mp3");
  minim = new Minim(this);
  i = minim.loadSample("i.mp3");
  minim = new Minim(this);
  j = minim.loadSample("j.mp3");
  minim = new Minim(this);
  k = minim.loadSample("k.mp3");
  minim = new Minim(this);
  l = minim.loadSample("l.mp3");

  minim = new Minim(this);
  m = minim.loadSample("m.mp3");
  minim = new Minim(this);
  n = minim.loadSample("n.mp3");
  minim = new Minim(this);
  o = minim.loadSample("o.mp3");
  minim = new Minim(this);
  p = minim.loadSample("p.mp3");
  minim = new Minim(this);
  q = minim.loadSample("q.mp3");
  minim = new Minim(this);
  r = minim.loadSample("r.mp3");
  minim = new Minim(this);
  s = minim.loadSample("s.mp3");
  minim = new Minim(this);
  t = minim.loadSample("t.mp3");
  minim = new Minim(this);
  u = minim.loadSample("u.mp3");
  minim = new Minim(this);
  v = minim.loadSample("v.mp3");
  w = minim.loadSample("w.mp3");

}

void draw()
{
  background(0);

}

void keyPressed()
{
  if ( key =='a' ) a.trigger();
  if ( key =='b' ) b.trigger();
  if ( key =='c' ) c.trigger();
  if ( key =='d' ) d.trigger();
  if ( key =='e' ) e.trigger();
  if ( key =='f' ) f.trigger();

  if ( key =='g' ) g.trigger();
  if ( key =='h' ) h.trigger();
  if ( key =='i' ) i.trigger();
  if ( key =='j' ) j.trigger();
  if ( key =='k' ) k.trigger();
  if ( key =='l' ) l.trigger();

  if ( key =='m' ) m.trigger();
  if ( key =='n' ) n.trigger();

  if ( key =='o' ) o.trigger();
  if ( key =='p' ) p.trigger();
  if ( key =='q' ) q.trigger();
  if ( key =='r' ) r.trigger();
  if ( key =='s' ) s.trigger();
  if ( key =='t' ) t.trigger();

  if ( key =='u' ) u.trigger();
  if ( key =='v' ) v.trigger();
  if ( key =='w' ) w.trigger();
}

void stop()
{
  a.close();
  b.close();
  c.close();
  d.close();
  e.close();
  f.close();

  g.close();
  h.close();
  i.close();
  j.close();
  k.close();
  l.close();

  m.close();
  n.close();

  o.close();
  p.close();
  q.close();
  r.close();
  s.close();
  t.close();

  u.close();
  v.close();
  w.close();

  minim.stop();
  super.stop();



}






