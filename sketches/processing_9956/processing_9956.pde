

  void setup()
  {
    size(600,400);
    background(0);
    smooth();
    frameRate (15);
  }
  
  void draw()
  {
  beine( mouseX, mouseY );
  haare (mouseX,mouseY);
  ohren( mouseX, mouseY );
  psychoBauch( mouseX, mouseY );
  augen (mouseX,mouseY);
}
      
void psychoBauch( float x1, float y1 )
{
    pushStyle();
    pushMatrix();
    
    color[] bunt = new color [] {
    color (255, 0, 0,200), 
    color(#CB0E74,200),
    color (#840898)
    };
    
    int f = int (random(bunt.length));
    
  fill( bunt[f] );
  noStroke(); 
  ellipse(x1, y1, 100+(random(-30,30)), 100+(random(-30, 30))); 
 
  popMatrix();
  popStyle(); 
}
 
void beine ( int x, int y )
{
    if (mousePressed != true) {background(0);}
    
    pushStyle();
    pushMatrix();
    
    float i = frameCount*2;
    
    x -= 140;
    y -= 100;

    translate (x+100,y+100);
    rotate (radians (i));
    stroke (255,120,0);
    strokeWeight (1.5);
    fill (255,40);
    scale (-1,1);
    beginShape();
    vertex( -7.36 , -4.36 );
    vertex( 8.09 , 6.54 );
    vertex( -18.27 , 71.09 );
    vertex( -96.45 , 112.9 );
    vertex( -85.54 , 132.9 );
    vertex( -101.0 , 137.45 );
    vertex( -116.45 , 102.9 );
    vertex( -26.45 , 62.0 );
    vertex( -7.36 , -2.54 );
    endShape();
    popMatrix ();

    pushMatrix();
    translate (x+180,y+100);
    rotate (radians (-i));

    beginShape();
    vertex( -7.36 , -4.36 );
    vertex( 8.09 , 6.54 );
    vertex( -18.27 , 71.09 );
    vertex( -96.45 , 112.9 );
    vertex( -85.54 , 132.9 );
    vertex( -101.0 , 137.45 );
    vertex( -116.45 , 102.9 );
    vertex( -26.45 , 62.0 );
    vertex( -7.36 , -2.54 );
    endShape();
    
    popMatrix();
    popStyle();
  }
  
void augen ( float x, float y )
{
    auge(x - 20, y, 30, 30);
    auge(x + 20, y, 30, 30);
}


void auge ( float pos1, float pos2, float rad1, float rad2)
{
    //pushStyle();
    pushMatrix();
    noStroke();
    ellipse( pos1, pos2, rad1, rad2);
    fill(random (100), 0, 0 );
    stroke(255, 230, 0);

    float a = atan2( mouseY-pos2, mouseX-pos1 );
    float d = dist( mouseX, mouseY, pos1, pos2 );
    translate( pos1, pos2 );
    rotate(a);
    translate( d / 20, 0 );
    ellipse( 0,0, rad1/3, rad2/3 );
    popMatrix();
    //popStyle();
}
  
void ohren ( float x, float y )
{
    frankenrechtesohr( mouseX, mouseY, 0.25, 0 );
    frankenlinkesohr( mouseX, mouseY, 0.25, 0 );
}

void frankenrechtesohr( float xx, float yy, float sc, float rrr)
{
    //pushStyle();
    pushMatrix();

    translate( xx, yy );
    rotate(rrr);
    float fff = frameCount / 20.0;
    scale( (3+sin(fff))*sc, (1+sin(fff))*sc );

    fill (255, 60);
    //stroke (120,230,0);
    strokeWeight( 3 );

    beginShape();
    vertex( 0.0 , 0.0 );
    vertex( 45.0 , -96.0 );
    vertex( 150.0 , -124.0 );
    vertex( 254.0 , -69.0 );
    vertex( 290.0 , 58.0 );
    vertex( 220.0 , 100.0 );
    vertex( 120.0 , 97.0 );
    vertex( 72.0 , 39.0 );
    vertex( 0.0 , 0.0 );
    endShape( CLOSE );

    ohrhaarerechts();
    ohrhaarerechts();
    ohrhaarerechts();

    popMatrix();
    //popStyle();
}

void ohrhaarerechts()
{
    float a = random( 45, 160 );
    float b = random( -80, 10 );
    float c = random( 110, 240 );
    float d = random( -50, 90 );
    line( 0, 0, a, b );
    line( a, b, c, d );
}

int ggg;
float sss;

void frankenlinkesohr( float xx, float yy, float sc, float rrr)
{
    pushStyle();
    pushMatrix();

    translate( xx, yy );
    rotate( rrr );
    strokeWeight( 3 );
    sss+=0.03;
    scale( (3+sin(sss))*sc, (sin(sss))*sc );

    beginShape();
    vertex( 0.0 , 0.0 );
    vertex( -49.0 , -95.0 );
    vertex( -103.0 , -105.0 );
    vertex( -160.0 , -106.0 );
    vertex( -196.0 , -58.0 );
    vertex( -206.0 , 20.0 );
    vertex( -154.0 , 64.0 );
    vertex( -81.0 , 61.0 );
    vertex( -47.0 , 22.0 );
    vertex( -24.0 , 2.0 );
    vertex( 0.0 , 0.0 );
    endShape( CLOSE );

    linkeohrhaare();
    linkeohrhaare();
    linkeohrhaare();
    linkeohrhaare();
    linkeohrhaare();

    popMatrix();
    //popStyle();
}

void linkeohrhaare()
{
    line( 0, 0, random( -170, -70 ), random( -50, 50 ) );
}
  
  void haare(float x, float y)
  {  
  pushStyle();
  pushMatrix();
  
  stroke (random(150,255), 50, 0 );
  strokeWeight (2); 
  noFill ();
  translate( x, y );

  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
  rotate ( radians (frameCount * 8));
  bezier ( random(40),random(40), random(90),random(40,90), random(40,90),random(40,90), random(20,90),random(20,90)); 
   
  popMatrix();
  popStyle();
  }

  
  
  
  
  
  
  
  
  

