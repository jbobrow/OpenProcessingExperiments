
/**
<p>A game of tag, played by an adaptive population. Click to reset. Each member of the population has a mind made up of nested code; for example:</p>
<blockquote><code>(ifit (max (mod y (+ (min y (min (abs y) (iflte 0.252 y (* 0.0955 x) x))) y)) 0.252) (iflte y 0.005545 (iflte y (* y (min (* x x) 0.4767)) (* 0.05141 x) (* 0.1078 x)) 4.767))</code></blockquote>
<p>Where x and y refer to the position of an important member (either one to pursue or run from, depending on the status of the member; the red one is <i>it</i>) in a local coordinate system. The ouput of the function is a single number that tells the member which way to turn, and how much. These minds are generated at random.</p>
<p>Originally, this was a genetic programming problem, with tournaments, mutation, elitism, and crossover &mdash; I just thought it looked nice. Instead of favoring for members that can tag others when they're <i>it</i> and evade <i>it</i> when they're not, this system produces a small group that "gets into the game" (that is, tag and follow around each other). Each member has an age, and as time passes they grow old. Once they reach a certain age, they're "reincarnated" (given a new mind -- equivalent to total mutation). However, if a member plays tag well (when they're it, they tag others), they'll live longer.</p>
<p>Inspired by <a href="http://www.red3d.com/cwr/papers/1994/alife4.html">Craig Reynolds</a>. For a more thorough approach, see <a href="../tag2">tag version 2</a>.</p>
*/

// x y ifit abs iflte minimum maximum mod times minus plus val (12 total)
float[] funProb = {
  1, // x
  1, // y
  1, // ifit
  2, // abs
  2, // iflte
  3, // minimum
  3, // maximum
  4, // mod
  2, // times
  1, // minus
  1, // plus
  0  // val  
};
boolean randomize = true; // if you want to use the array above, make randomCode false
  
int functions = 12;
int maxDepth = 7; // 14 is the highest. for program tree depth.

int n = 30; // population size
float oldAge = 100; // the age where members die
float healthBenefits = 5; // the benefits for tagging someone
float ageVariation = 10; // variation in old age

float dist = 12; // distance moved every turn
float tagDistance = 10; // min distance for tagging
int s = 470; // screen size
int spread = 100; // spread from center of random positions
float al = 90; // alpha

boolean beenTagged = false; // whether someone's been tagged this round
Player[] players = new Player[n];
Player it;

boolean init = true;
boolean flood = false;
void setup() {
  //size(s,s);
  size(470,470,P3D);
  if(randomize) {
    dist = ((sq(random(0,1)))*12) + 0.5;
    tagDistance = ((1-sq(random(0,1)))*15) + 2;
    for(int i=0;i<functions;i++)
      funProb[i] = random(5);
  }
  if(randomize || init) {
    bnorm(funProb);
    init = false;
  }
  background(255);
  for(int i=0;i<n;i++) {players[i] = new Player(spread);}
  players[0].tag(); // you're it!
  // println(players[0]); // just for fun
}

// a "building" norm
void bnorm(float[] arr) {
  float sum = sum(arr);
  float cur = 0;
  for(int i=0;i<arr.length;i++) {
    cur += arr[i];
    arr[i] = cur/sum;
  }
}

float sum(float[] arr) {
  float sum = 0;
  for(int i=0;i<funProb.length;i++) {
    sum += funProb[i];
  }
  return sum;
}

void draw() {
  if(flood) {
    for(int i=0;i<n;i++)
      players[i].incarnate();
    flood = false;
  }
  beenTagged = false;
  for(int i=0;i<n;i++)
   players[i].update();
}

void mousePressed() {setup();}

void keyPressed() {saveFrame();}

class Player {
  float x,y,r;
  float lx,ly;
  
  Player local;
  float localx, localy;
  
  boolean isit = false;
  code mind;
  float age;
  float death;
  
  Player(int d) { // random initialize given constraint
    float ang = random(TWO_PI);
    float rad = random(d);
    this.x = width/2 + cos(ang) * rad;
    this.y = height/2 + sin(ang) * rad;
    this.r = random(1);
    incarnate();
  }
  String toString() {return mind.toString();}
  void incarnate() {
    age = 0;
    death = oldAge + random(-ageVariation, ageVariation);
    embody(randomMind());
  }
  void embody(code mind) {
    mind.connect(this);
    this.mind = mind;
  }
  void update() {
    age++;
    if(age>death) { // if it's time to die
      incarnate(); // reincarnate
    }
    
    local = isit?nearest():it;
    if (isit) tryTagging(local);
    
    float dx = local.x - x;
    float dy = local.y - y;
    float a = -r + PI/4; // rotate to normal axes
    localx = ((dx * cos(a)) - (dy * sin(a)))/width;
    localy = ((dx * sin(a)) + (dy * cos(a)))/height;
  
    r = r + mind.eval(); // update rotation
    a = r * TWO_PI; // translate revolutions -> radians
    lx = x; // save x and y
    ly = y;
    x += cos(a) * dist;
    y += sin(a) * dist;
    
    noStroke();
    fill(color(240,240,245+random(10),10));
    ellipse(x,y,20,20);
    
    stroke(color(isit?250:0,0,0,isit?160:30));
    line(lx,ly,x,y);
  }
  Player nearest() {
    Player nearest = this; // just to define it temp.
    float mindist = 0;
    for(int i=0;i<n;i++) {
      Player cur = players[i];
      float curdist = distance(cur,this);
      if(cur != this && (curdist < mindist || mindist == 0)) {
        nearest = cur;
        mindist = curdist;
      }
    }
    return nearest;
  }
  float distance(Player a, Player b) {return dist(a.x,a.y,b.x,b.y);}
  boolean isit() {return isit;}
  void tryTagging(Player near) {
    if(distance(near,this) < tagDistance && !beenTagged) {
      isit = false;
      near.tag();
      age = 0; // you're safe again
      death *= healthBenefits; //give yourself some more time
    }
  }
  void tag() {
    it = this;
    isit = true;
    beenTagged = true;
  }
}

abstract class code {
  String sym;
  abstract float eval();
  void connect(Player p) {}
}

abstract class binfun extends code {
  String sym;
  code l,r;
  binfun(code l, code r, String sym) {
    this.l = l;
    this.r = r;
    this.sym = sym;
  }
  String toString() {return "("+sym+" "+l+" "+r+ ")";}
  void connect(Player p) {
    l.connect(p);
    r.connect(p);
  }
}

class plus extends binfun {
  plus(code l, code r) {super(l,r,"+");}
  float eval() {return l.eval() + r.eval();}
}

class minus extends binfun {
  minus(code l, code r) {super(l,r,"-");}
  float eval() {return l.eval() - r.eval();}
}

class times extends binfun {
  times(code l, code r) {super(l,r,"*");}
  float eval() {return l.eval() * r.eval();}
}

class mod extends binfun {
  mod(code l, code r) {super(l,r,"mod");}
  float eval() {return l.eval() % r.eval();}
}

class minimum extends binfun {
  minimum(code l, code r) {super(l,r,"min");}
  float eval() {return min(l.eval(),r.eval());}
}

class maximum extends binfun {
  maximum(code l, code r) {super(l,r,"max");}
  float eval() {return max    (l.eval(),r.eval());}
}

class iflte extends code {
  code a,b,c,d;
  iflte(code a, code b, code c, code d) {
    this.a = a;
    this.b = b;
    this.c = c;
    this.d = d;
  }
  String toString() {return "(iflte "+a+" "+b+" "+c+" "+d+")";}
  float eval() {return (a.eval()<=b.eval()) ? c.eval() : d.eval();}
  void connect(Player p) {
    a.connect(p);
    b.connect(p);
    c.connect(p);
    d.connect(p);
  }
}

class abs extends code {
  code a;
  abs(code a) {this.a = a;}
  String toString() {return "(abs "+a+")";}
  float eval() {return abs(a.eval());}
  void connect(Player p) {a.connect(p);}
}

class val extends code {
  float a;
  val() {this.a = random(1);}
  val(float a) {this.a = a;}
  float eval() {return a;}
  String toString() {return str(a);}
}

abstract class var extends code {
  Player p;
  void connect(Player p) {this.p = p;}
}

class x extends var {
  x() {}
  float eval() {return p.localx;}
  String toString() {return "x";}
}

class y extends var {
  y() {}
  float eval() {return p.localy;}
  String toString() {return "y";}
}

class ifit extends var { // both var and fun, but alas...
  code l,r;
  ifit(code l, code r) {
    this.l = l;
    this.r = r;
  }
  float eval() {return p.isit()?l.eval():r.eval();}
  String toString() {return "(ifit "+l+" "+r+")";}
  void connect(Player p) {
    this.p = p;
    l.connect(p);
    r.connect(p);
  }
}

// wrapper to protect from overflow
code randomMind() {
  return rM(0);
}

code rM(int i) {
  i++;
  float choice = random(1);
  if(i > maxDepth) {return new val();}
  if(choice < funProb[0]) {return new x();}
  else if(choice < funProb[1]) {return new y();}
  else if(choice < funProb[2]) {return new ifit(rM(i),rM(i));}
  else if(choice < funProb[3]) {return new abs(rM(i));}
  else if(choice < funProb[4]) {return new iflte(rM(i),rM(i),rM(i),rM(i));}
  else if(choice < funProb[5]) {return new minimum(rM(i),rM(i));}
  else if(choice < funProb[6]) {return new maximum(rM(i),rM(i));}
  else if(choice < funProb[7]) {return new mod(rM(i),rM(i));}
  else if(choice < funProb[8]) {return new minus(rM(i),rM(i));}
  else if(choice < funProb[9]) {return new plus(rM(i),rM(i));}
  else {return new val();}
}

// example genome, given by the paper. can be used in place of randomMind().
code suboptimalMind() {
  return new ifit(
    new maximum(
      new mod(
        new y(),
        new plus(
          new minimum(
            new y(),
            new minimum(
              new abs(
                new y()),
              new iflte(
                new val(0.252),
                new y(),
                new times(
                  new val(0.0955),
                  new x()),
                new x()))),
          new y())),
      new val(0.252)),
    new iflte(
      new y(),
      new val(0.005545),
      new iflte(
        new y(),
        new times(
          new y(),
          new minimum(
            new times(
              new x(),
              new x()),
            new val(0.4767))),
        new times(
          new val(0.05141),
          new x()),
        new times(
          new val(0.1078),
          new x())),
      new val(4.767)));
}

