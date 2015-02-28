
/**
A swarm simulation featuring the St Anna plush toys. This 
app was written for the <a href="http://hpc.at">hpc punsch feier</a>
by <a href="http://www.local-guru.net/blog">guru</a>
*/
Boid[] b;
PShape flower;
PShape tree;
PShape bush;
PShape logo;
PVector[] fpos;
PVector[] tpos;
PVector[] bpos;


void setup () {
   size(1024,768);
   smooth();
   b = new Boid[30];
   fpos = new PVector[5];
   tpos = new PVector[5];
   bpos = new PVector[5];

   flower = loadShape("flowers.svg");
   tree = loadShape( "tree.svg" );
   bush = loadShape( "bush.svg" );
   //logo = loadShape( "hpc.svg" );
   
   for( int i=0; i<5; i++) {
    fpos[i] = new PVector( random( width)-width/2, random(height )-height/2);
   }
   for( int i=0; i<5; i++) {
    tpos[i] = new PVector( random( width)-width/2, random(height )-height/2);
   }
   for( int i=0; i<5; i++) {
    bpos[i] = new PVector( random( width)-width/2, random(height )-height/2);
   }
   
   for( int i=0; i < b.length/3; i++) {
     b[i] = new Panda( random( width) - width/2, random( height )-height/2, random(-2, 2), random(-2,2), b );
   }
   for( int i=0; i < b.length/3; i++) {
     b[i+10] = new Rabbit( random( width) - width/2, random( height )-height/2, random(-2, 2), random(-2,2), b );
   }
   for( int i=0; i < b.length/3; i++) {
     b[i+20] = new Sheep( random( width) - width/2, random( height )-height/2, random(-2, 2), random(-2,2), b );
   }

   frameRate( 12 );
}

void draw() {
  background(141,194,99);
  translate( width/2, height/2);
  
  for( int i=0; i<5;i++) {
    shape( flower, fpos[i].x, fpos[i].y, flower.width/4,flower.height/4 );
  }
  
  //scale(0.75,0.75);
  for( int i=0; i < b.length; i++) {
    b[i].update();
    //b[i].drawShadow();
  }
  for( int i=0; i< b.length; i++) {
    b[i].draw();
  }
  for( int i=0; i<5;i++) {
    shape( bush, bpos[i].x, bpos[i].y, bush.width/4,bush.height/4 );
  }

  for( int i=0; i<5;i++) {
    shape( tree, tpos[i].x, tpos[i].y, tree.width/4,tree.height/4 );
  }

  //shape( logo,-width/2, -height/2);
  
}

public class Boid {
  PShape b[];
  int idx = 0;
  PShape shadow;

  float r1 = 40;
  float r2 = 80;
  float r3 = 160;
  boolean fixed;
  int pause = 0;

  float x, y;
  float vx, vy;
  Boid[] others;

  public Boid( float x, float y, float vx, float vy, Boid[] others ) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.others = others;
    fixed = false;
    //shadow = loadShape( "shadow.svg" );
  }

  void boo() {
    vx = random( -25, 25 );
    vy = random( -25, 25 );
  }

  public void update() {
    if (fixed) return;
    if (pause > 0) { 
      pause--;
      return;
    }    

    if ( pause == 0 && random(100) > 99 ) {
      pause = 20 + (int)random( 40);
    }

    sep();
    align();
    coh();

    float l = sqrt( sq( vx ) + sq ( vy ));
    if (l > 4 ) {
      vx = 0.9 * vx;
      vy = 0.9 * vy;
    }

    x += vx;
    y += vy;    

    if (x > width/2 - 15 ) { 
      vx -= 2;
    }
    if (x < -width/2 + 15 ) { 
      vx += 2;
    }
    if (y > height/2 -60 ) {
      vy -= 2;
    }
    if (y < -height/2 -90) { 
      vy += 2;
    }
  }

  public void sep() {
    int count = 0;
    float sx = 0;
    float sy = 0;

    for ( int i = 0; i < others.length; i ++ ) {

      float d = sqrt( sq( x - others[i].x ) + sq( y - others[i].y ));
      if (d < r1 && this != others[i] ) {
        count++;
        sx += others[i].x;
        sy += others[i].y;
      }
    }

    if ( count  > 0 ) {
      sx = x - sx / count;
      sy = y - sy / count;

      float l = sqrt( sq( sx ) + sq ( sy ));
      sx = 1.4 * sx / l;
      sy = 1.4 * sy / l;
    }

    vx += sx;
    vy += sy;
  }

  public void align() {
    int count = 0;
    float dx = 0;
    float dy = 0;

    for ( int i = 0; i < others.length; i ++ ) {

      float d = sqrt( sq( x - others[i].x ) + sq( y - others[i].y ));
      if (d < r2 && this != others[i] ) {
        count++;
        dx += others[i].vx;
        dy += others[i].vy;
      }
    }

    if ( count  > 0 ) {
      dx = dx / count;
      dy = dy / count;    
      float l = sqrt( sq( dx ) + sq ( dy ));
      dx = dx / l;
      dy = dy / l;
    }

    vx += dx;
    vy += dy;
  }

  public void coh() {
    int count = 0;
    float sx = 0;
    float sy = 0;

    for ( int i = 0; i < others.length; i ++ ) {

      float d = sqrt( sq( x - others[i].x ) + sq( y - others[i].y ));
      if (d < r3  && d > r1 && this != others[i] ) {
        count++;
        sx += others[i].x;
        sy += others[i].y;
      }
    }

    if ( count  > 0 ) {
      sx = x - sx / count;
      sy = y - sy / count;

      float l = sqrt( sq( sx ) + sq ( sy ));
      sx = sx / l;
      sy = sy / l;
    }

    vx -= sx;
    vy -= sy;
  }


  /*public void drawShadow() {
   pushMatrix();
   translate( x, y );
   translate( -20, -20 );
   shape(shadow, 0, 0, shadow.width/4, shadow.height/4);    
   popMatrix();
   }
   */



  public void draw() {    
    pushMatrix();
    translate( x, y );
    rotate( -PI/2+atan( vy/vx ) + ( vx < 0  ? PI : 0 ));
    translate( -20, -20 );
    doDraw();  

    popMatrix();
  }

  public void doDraw() {
    if ( pause == 0) {
      idx++;
    } 
    else {
      idx = 2;
    }
    if ( idx > 7 ) idx = 0;
    shape(b[idx], 0, 0, b[idx].width/4, b[idx].height/4);
  }
}

public class Panda extends Boid {
  public Panda( float x, float y, float vx, float vy, Boid[] others ) {
    super( x, y, vx, vy, others );
    b = new PShape[8];
    for( int i=0; i<8; i++) {
      if ( i < 4 ) {
        b[i] = loadShape( "panda0.svg" );
      } else { 
        b[i] = loadShape( "panda0.svg" );  
      }
    }
  }
  

}

public class Rabbit extends Boid {
 
  public Rabbit( float x, float y, float vx, float vy, Boid[] others ) {
    super( x, y, vx, vy, others );
    b = new PShape[8];
    for( int i=0; i<8; i++) {
      if ( i < 4 ) {
        b[i] = loadShape( "rabbit0.svg" );
      } else { 
        b[i] = loadShape( "rabbit0.svg" );  
      }
    }
  }
  

}

public class Sheep extends Boid {
 
  public Sheep( float x, float y, float vx, float vy, Boid[] others ) {
    super( x, y, vx, vy, others );
    b = new PShape[8];
    for( int i=0; i<8; i++) {
      if ( i < 4 ) {
        b[i] = loadShape( "sheep0.svg" );
      } else { 
        b[i] = loadShape( "sheep0.svg" );  
      }
    }
  }
  

}



