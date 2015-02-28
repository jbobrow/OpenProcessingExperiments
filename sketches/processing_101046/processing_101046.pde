
int W = 640;
int H = 480;

float HX = W / 2, RHX = W / 2, MX = W / 2;
float HY = H / 2, RHY = H / 2, MY = W / 2;

int fat;
int maxfat = 50;

int points;

float loopo;
float balltime;
float balldelay = 25;
int headSize = 120;

ArrayList<tball> balls;
ArrayList particles;

PImage head, head_near, pdust, pdrop, plogo, pbackground, pfat_bar, pfat_arrow;

PImage[] badfood;
PImage[] goodfood;

boolean nearfood;

float timer;

int prelude = 0;
int gameon = 1;
int gameover = 2;
int gamestate = prelude;

float sqr( float val )
{
  return pow( val, 2 );
}

void rotvert( float ox, float oy, float x, float y, float a )
{
  float c = cos(a);
  float s = sin(a);
  vertex( ox + (x) * c - (y) * s,
          oy + (x) * s + (y) * c 
        );
}

void setup()
{
  frameRate( 60 );
  //size( W, H, P2D);
  size(640,480, P2D);
  
  strokeWeight( 10 );
  
  textFont(createFont("Arial Black", 36));
  textAlign(CENTER, CENTER);
  
  for ( int i = 0; i < segs; i++ )
    segments[i] = new seg( 0, 0, 0 );
  
  segments[segments.length-1].x = width / 2;
  segments[segments.length-1].y = height;
  
  balls = new ArrayList();
  particles = new ArrayList();
  
  goodfood = new PImage[5];
  goodfood[0] = loadImage("apple.png");
  goodfood[1] = loadImage("watermel.png");
  goodfood[2] = loadImage("carrot.png");
  goodfood[3] = loadImage("kefir.png");
  goodfood[4] = loadImage("fish.png");
  
  badfood = new PImage[5];
  badfood[0] = loadImage("coke.png");
  badfood[1] = loadImage("burger.png");
  badfood[2] = loadImage("chips.png");
  badfood[3] = loadImage("hot-dog.png");
  badfood[4] = loadImage("cake.png");
  
  head = loadImage("gubi_norm.png");
  head_near = loadImage("gubi_jrat.png");
  pdust = loadImage("dust.png");
  //pdrop = loadImage("waterDrop2.png");
  //pbackground = loadImage("back.png");
  pbackground = loadImage("back_web.png");
  pfat_bar = loadImage("fat_bar.png");
  pfat_arrow = loadImage("fat_arrow.png");
  plogo = loadImage("logo.png");
   
  noStroke();
}

void dbg( String s )
{
  noStroke();
  fill(255 * sin(millis()));
  text(s, 100, 100);
}

//++++++++++++++++++отрисовка тут!
void draw()
{
  tint(255);
  image(pbackground, 0, 0, W, H);

  float D = frameRate / 60;
  
  timer += D;
  
  if (gamestate == gameon)
    balltime += D;
    
  if (balltime > balldelay)
  {
    balltime = 0;
    tball b = new tball();
    b.radius = random( 25 ) + 35;
    b.x = random( W );
    b.y = -b.radius;
    b.r = int(random(255));
    b.g = int(random(255));
    b.b = int(random(255));
    b.speed = random( 5 ) + 2;
    b.blown = false;
    if (random(5) < 4) b.good = false; else b.good = true;
    b.rotor = random(8) - 4;
    if (b.good) b.img = goodfood[int(random(5))]; else b.img = badfood[int(random(5))]; 
    balls.add( b );
    //balls.add( new ball( random( 25 ) + 25, random( W ), colr( random(255), random(255), random(255) ), random(5) + 2 ) );
  }

  if (gamestate == gameon)
  {
    nearfood = false;
    for (int i = balls.size() - 1; i > 0; i--)
    {
      tball b = balls.get(i);
      b.update( D );
      if (b.blown) 
      {
        balls.remove(i);
      }
    }
  }
  
  loopo += D / 25;

  if (mousePressed && gamestate != gameover)
  {
    if (gamestate == gameon)
    {
      MX = (mouseX);
      MY = (mouseY);
      headfree = 0;
    }
    if (gamestate == prelude)
    {
      gamestate = gameon;
      balltime = 0;
      timer = 0;
    }
  }
  else
  {
    if (gamestate == prelude || gamestate == gameon)
    {
      //направлять голову по синусоиде
      headfree += D / 250;
      if (headfree > 1) headfree = 1;
      HX = (W * 2 / 8 + ((sin(loopo) + 1) / 2) * W * 0.5);
      HY = (H / 3 + (sin(loopo * 2)) * H / 8);
    }
    if (gamestate == gameover)
    {
      headfree = 1;
      //HX = MX;
      HY += D * 3;
    }  
  }

  RHX = RHX + ( (MX + (HX - MX) * headfree) - RHX ) * .25f * D;
  RHY = RHY + ( (MY + (HY - MY) * headfree) - RHY ) * .25f * D;
  
  reachSegment(0, RHX, RHY);
    for(int i=1; i<segs; i++) {
      reachSegment(i, targetX, targetY);
    }
  
  for(int i=segments.length-1; i>=1; i--) {
    positionSegment(i, i-1);
    segments[i].clr.lerpto( segments[i-1].clr, .25f * D );  
  }
  
  for(int i=1; i<segments.length; i++) {
    {
        float sxi1 = segments[i-1].x;
        float syi1 = segments[i-1].y;
        float si1r = segments[i-1].rot - PI * .5f;
        float six = segments[i].x;
        float siy = segments[i].y;
        float rot1 = (-i*.75 - fat * 2)/2;
        float rot2 = (i*.75 + fat * 2)/2;
        float sir = segments[i].rot - PI * .5f;
      beginShape();
      /*fill( 0,0,0,51 );
        rotvert( sxi1, syi1, rot1, 0, si1r );
        rotvert( sxi1, syi1, rot2, 0, si1r );
        rotvert( six, siy, rot2, 0, sir );
        rotvert( six, siy, rot1, 0, sir );
      */  
      fill( segments[i].clr.r, segments[i].clr.g, segments[i].clr.b, segments[i].clr.a );
        rotvert( sxi1, syi1, rot1, 0, si1r );
        rotvert( sxi1, syi1, rot2, 0, si1r );
        rotvert( six, siy, rot2, 0, sir );
        rotvert( six, siy, rot1, 0, sir );
      endShape(CLOSE);
    }
    
  }
     beginShape();
        rotvert( segments[segs-1].x, segments[segs-1].y, ((segs-1)*.75 + fat * 2)/2, 0, segments[segs-1].rot - PI * .5f );
        rotvert( segments[segs-1].x, segments[segs-1].y, (-(segs-1)*.75 - fat * 2)/2, 0, segments[segs-1].rot - PI * .5f );
        vertex( segments[segs-1].x + ((segs)*.75 + fat * 2)/2, H );
        vertex( segments[segs-1].x + (-(segs)*.75 - fat * 2)/2, H);
     endShape(CLOSE);
 
  
  pushMatrix();
    translate( segments[0].x, segments[0].y );
    rotate( segments[0].rot + 90 );
    translate( -headSize / 2, -headSize / 2 );
    tint(255);
    if (!nearfood)
      image( head, 0, 0, headSize, headSize );
    else
      image( head_near, 0, 0, headSize, headSize );
  popMatrix();
  
  for( int i = particles.size() - 1; i > 0; i-- )
  {
    tparticle p = (tparticle)particles.get(i);
    p.update(D);
    if (p.life > 0) p.render(); else particles.remove(i);
  }
  
  String guitext;
  if (gamestate == prelude)
  {
    image( plogo, W / 2 - plogo.width / 2, 10 );
    //guitext = "Hungry Lips";
    //fill(0,0,0,51);
    //text( guitext, W / 2 + 3, 150 + 3 );
    //fill(255,0,0);
    //text( guitext, W / 2, 150 );
    guitext = "Click to Start";
    fill(0,0,0,51);
    text( guitext, W / 2+3, 550+3 );
    fill(234,54,226);
    text( guitext, W / 2, 550 );
  }
  if (gamestate == gameon)
  {
  tint( 255, 255 );
    image( pfat_bar, W / 2 - pfat_bar.width - 20, -40, pfat_bar.width * 2 + 40, pfat_bar.height * 2 );
    image( pfat_arrow, W / 2 - pfat_bar.width - pfat_arrow.width / 2 + pfat_bar.width * 2 * ( (float)fat / maxfat ), pfat_bar.height - 20 );  
    guitext = "SCORE: " + int(points);
    fill(0,0,0,51);
    text( guitext, W / 2+3, 150+3 );
    fill(255);
    text( guitext, W / 2, 150 );  
  }
  if (gamestate == gameover)
  {
    guitext = "You've become too fat!\nGame Over!\n\nScore: " + int(points);
    fill(0,0,0,51);
    text( guitext, W / 2+3, H / 2+3 );
    fill(255,0,0);
    text( guitext, W / 2, H / 2 );
    guitext = "Click to Restart";
    if (timer > 255) fill(0,0,0,51); else fill(0);
    text( guitext, W / 2 + 3, 500+3 );
    if (timer < 255) fill(timer); else fill(255);
    text( guitext, W / 2, 500 );
  }
  
}
//---------------------отрисовка тут!

void mouseReleased()
{
  if (gamestate == gameover && timer > 255)
  {
    points = 0;
    gamestate = prelude;
    segments[0].clr = colr( 10, 100, 10, 255 );
    fat = 0;
    nearfood = false;
    timer = 0;
    balls.clear();    
  }
}

void keyPressed()
{
  if (key == ' ' && gamestate == gameover)
  {
    points = 0;
    gamestate = prelude;
    segments[0].clr = colr( 10, 100, 10, 255 );
    fat = 0;
    nearfood = false;
    timer = 0;
    balls.clear();
  }
}
class seg
{
  float x;
  float y;
  float rot;
  vec clr;
  seg( float fx, float fy, float frot )
  {
    x = fx;
    y = fy;
    rot = frot;
    clr = colr( 10, 100, 10, 255 );
  };
};

int segs = 18;

seg[] segments = new seg[segs];
float segLength = H / segs;
float targetX, targetY;
float headfree;

void positionSegment(int a, int b) 
{
  segments[b].x = segments[a].x + cos(segments[a].rot) * segLength;
  segments[b].y = segments[a].y + sin(segments[a].rot) * segLength; 
}

void reachSegment(int i, float xin, float yin) 
{
  float dx = xin - segments[i].x;
  float dy = yin - segments[i].y;
  segments[i].rot = atan2(dy, dx);  
  targetX = xin - cos(segments[i].rot) * segLength;
  targetY = yin - sin(segments[i].rot) * segLength;
}

void segment(float x, float y, float a, float sw) 
{
  noStroke();
  pushMatrix();
  translate(x, y);
  rotate(a);
  rect( -fat * 2, (-sw - fat * 2)/2, segLength + fat * 2, (sw + fat * 2) );
  popMatrix();
}
class tparticle
{
  float x, newx;
  float y, newy;
  float radius;
  float speed;
  float rot, rotor;
  float destinationrot;
  float life;
  PImage img;
  int r,g,b;
  
  void update( float fD )
  {
      rot += rotor * fD * 0.01;
      newx += speed * fD;
      newy += fD * 0.1;
      y += newy;
      life -= fD;
      if (x < -radius || x > W + radius || y < -radius || y > H + radius) life = 0;
  }
  
  void render()
  {
    pushMatrix();
      translate( x, y );
      rotate( destinationrot );
      translate( newx, 0 );
      rotate( rot );
      translate( -radius / 2, -radius / 2 );
      if (life > 50) tint (r, g, b, 255); else tint( r, g, b, int( ( life / 50 ) * 255 ) ); 
      image( img, 0, 0, radius, radius );
    popMatrix();
  }
}

tparticle emit( PImage fimg, float fx, float fy, float fradius, float fspeed, float fdestinationrot, float flife, float frotor, int fr, int fg, int fb )
{
  tparticle p;
  p = new tparticle();
  p.img = fimg;
  p.x = fx;
  p.y = fy;
  p.radius = fradius;
  p.speed = fspeed;
  p.destinationrot = fdestinationrot;
  p.life = flife;
  p.rotor = frotor;
  p.r = fr;
  p.g = fg;
  p.b = fb;
  particles.add( p );
  return p;
}

void emitpieces( float fx, float fy, int fr, int fg, int fb )
{
  for(int i = 0; i < 6; i++)
  {
    emit( pdust, fx, fy, 10 + random(20), 1 + random(3), random(360), 60, random(30) + 10, fr, fg, fb );
  }
}

class tball
{
  float radius;
  float x;
  float y;
  int r,g,b;
  float speed;
  boolean blown;
  boolean good;
  float rot, rotor;
  PImage img;
  
  //ball( float fradius, float fx, vec fclr, float fspeed )
    
  void update( float fD )
  {
    y += fD * speed;
    rot += rotor * fD * 0.05;
    if ( sqrt( sqr(segments[0].x - x) + sqr(segments[0].y - y) ) < radius + 80/* && headfree < 0.900*/ )
    {
      nearfood = true;
    }
    
    if ( sqrt( sqr(segments[0].x - x) + sqr(segments[0].y - y) ) < radius + 40/* && headfree < 0.900*/ )
    {
      segments[0].clr = colr( r, g, b, 255 );
      blown = true;
      emitpieces(x,y,r,g,b);
      if (good) 
      {
        fat -= 2;
        points += 10 + random(10);
      } 
      else 
      {
        fat += 3;
        points += 20 + random(20);
      }
      if (fat < 0) fat = 0;
      if (fat > maxfat) 
      {
        fat = maxfat;
        segments[0].clr = colr(0,0,0,255);
        gamestate = gameover;
        timer = 0;
      }
    }
    
    if (y > H) blown = true;
    
    noStroke();
    fill( r, g, b );
    pushMatrix();
    translate(x,y);
    rotate(rot);
    image(img, -radius*1.5/2, -radius*1.5/2, radius * 1.5, radius * 1.5);
    //ellipse( x, y, radius, radius );
    popMatrix();
  }
}

class vec
{
  float r,g,b,a;
  vec( float fr, float fg, float fb )
  {
    r = fr;
    g = fg;
    b = fb;
    a = 255;
  }
  
  vec( float fr, float fg, float fb, float fa )
  {
    r = fr;
    g = fg;
    b = fb;
    a = fa;
  }
  
  void lerpto( vec dest, float t )
  {
    r += (dest.r - r) * t;
    g += (dest.g - g) * t;
    b += (dest.b - b) * t;
    a += (dest.a - a) * t;  
  }
};

vec colr( float fr, float fg, float fb )
{
  vec r;
  r = new vec( fr, fg, fb );
  return r;
};

vec colr( float fr, float fg, float fb, float fa )
{
  vec r;
  r = new vec( fr, fg, fb, fa );
  return r;
};


