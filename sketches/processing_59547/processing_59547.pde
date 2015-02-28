
//orignal logo
//carlystevens
//spring2012 ACCD

PFont i; 
String url = "http://search.twitter.com/search.atom?q=breakup&rpp=1";


int value=0;
int mode = 1;

int dx =566;
int dy = 367;

int ex =611;
int ey = 367;

int cx =650;
int cy = 367;

int ox =692;
int oy = 367;

int nx =738;
int ny = 367;

int sx =782;
int sy = 367;

int tx =824;
int ty = 367;

int rx =868;
int ry = 367;

int ux =912;
int uy = 367;

int zx =957;
int zy = 367;

int yx =600;
int yy = 900;


PShape d;
PShape e;
PShape c;
PShape o;
PShape n;
PShape s;
PShape t;
PShape r;
PShape u;
PShape cc;
PShape tt;
PShape w;




void setup () {

  size (1600, 900);
  smooth();

  d = loadShape ("d.svg");
  e = loadShape ("e.svg");
  c = loadShape ("c.svg");
  o = loadShape ("o.svg");
  n = loadShape ("n.svg");
  s = loadShape ("s.svg");
  t = loadShape ("t.svg");
  r = loadShape ("r.svg");
  u = loadShape ("u.svg");
  cc = loadShape ("cc.svg");
  tt = loadShape ("tt.svg");
  


  frameRate (3);
  i = loadFont( "LetterGothicMT-48.vlw" );
}

void draw () {
  background (255);
  smooth();





 

  shape (d, dx, dy);
  shape (e, ex, ey);
  shape (c, cx, cy);
  shape (o, ox, oy);
  shape (n, nx, ny);
  shape (s, sx, sy);
  shape (t, tx, ty);
  shape (r, rx, ry);
  shape (u, ux, uy);
  shape (cc, zx, zy);
  shape (tt, yx, yy);

  if (mousePressed == true ) {
    fill(0);







    dx=5;
    dy=5;
    
    ex=145;
    ey=81;
    
    cx=290;
    cy=162;
    
    ox=435;
    oy=243;
    
    nx=580;
    ny=324;
    
    sx=725;
    sy=405;
    
    tx=870;
    ty=486;
    
    rx=1015;
    ry=567;
    
    ux=1160;
    uy=648;
    
    zx=1350;
    zy=729;
    
    yx= 1550;
    yy= 810;
    
    shape (d, dx, dy);
    shape (e, ex, ey);
    shape (c, cx, cy);
    shape (o, ox, oy);
    shape (n, nx, ny);
    shape (s, sx, sy);
    shape (t, tx, ty);
    shape (r, rx, ry);
    shape (u, ux, uy);
    shape (cc, zx, zy);
    shape (tt, yx, yy);

    textSize(10);
    fill(0);
    text (getTweet(), dx+50, dy+20, 100, 500);
    
    textSize(10);
    fill(0);
    text (getTweet(), ex+ 50, ey+20, 100, 200);

    textSize(10);
    fill(0);
    text (getTweet(), cx+50, cy+20, 100, 500);
    
    textSize(10);
    fill(0);
    text (getTweet(), ox+ 50, oy+20, 100, 500);

    textSize(10);
    fill(0);
    text (getTweet(), nx+50, ny+20, 100, 500);
    
    textSize(10);
    fill(0);
    text (getTweet(), sx+ 50, sy+20, 100, 500);

    textSize(10);
    fill(0);
    text (getTweet(), tx+ 50, ty+20, 100, 500);
    
    textSize(10);
    fill(0);
    text (getTweet(), rx+ 50, ry+20, 100, 500);

    textSize(10);
    fill(0);
    text (getTweet(), ux+50, uy+20, 100, 500);
    
    textSize(10);
    fill(0);
    text (getTweet(), zx+ 50, zy+20, 100, 500);

    textSize(10);
    fill(0);
    text (getTweet(), yx+50, yy+20, 100, 500);
    


  
  }

  else {
    dx=566;
    dy=367;
    
    ex=611;
    ey=367;
    
    cx=650;
    cy=367;
    
    ox=692;
    oy=366;
    
    nx=738;
    ny=367;
    
    sx=782;
    sy=366;
    
    tx=824;
    ty=367;
    
    rx=868;
    ry=367;
    
    ux=912;
    uy=367;
    
    zx=957;
    zy=366;
    
    yx= 990;
    yy= 366;
    
    shape (d, dx, dy);
    shape (e, ex, ey);
    shape (c, cx, cy);
    shape (o, ox, oy);
    shape (n, nx, ny);
    shape (s, sx, sy);
    shape (t, tx, ty);
    shape (r, rx, ry);
    shape (u, ux, uy);
    shape (cc, zx, zy);
    shape (tt, yx, yy);
  }
}

String getTweet()
{
  XMLElement tweet = new XMLElement(this, url);
  XMLElement tmp = tweet.getChild("entry/title");
  return tmp.getContent();
}


