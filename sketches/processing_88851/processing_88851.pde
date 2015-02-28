
//import processing.opengl.*;
int LENGTH = 100;
int WIDTH  = 50;
int SEGMENTS = 13;
float FORCE = 0.25;
float FORCE2 = 0.1;

int SPEED = 8;
float PROB = 0.1;
float DAMP = 0.8;
float SCALE = 0.1;

void myassert( boolean x )
{
  if ( !x )
  {
    //console.log( "assert failed" );
  }
}

void mycopy( int[] src, int [] dst )
{
  for ( int i = 0; i < dst.length; i++ )
  {
    dst[ i ] = src[ i ];
  }
}

float angleBetween2Lines( float dx, float dy, float ex, float ey )
{
  float a1 = ( float )Math.atan2( dy, dx );
  float a2 = ( float )Math.atan2( ey, ex );
  float a3 = a2 - a1;
  
  while ( a3 < 0 )
    a3 += 2.0 * 3.141592654;
    
  return a3;
}

class Point
{
  float _x;
  float _y;
  
  Point( float x, float y )
  {
    _x = x;
    _y = y;
  }
}


class LinkObject
{
  void dump( )
  {
  }
}

class TestLinkObject extends LinkObject
{
  int  _i;
  void dump( )
  {
    print( _i ); 
    print( "," );
  }

  TestLinkObject( int i )
  {
    _i = i;
  }
}

class Link
{
  Chain      _chain;
  Link       _prev;
  Link       _next;
  LinkObject _linkobject;

  Link( LinkObject linkobject )
  {
    _linkobject = linkobject;
  }

  Link getnext( int index )
  {
    Link next = this;
    while ( index-- > 0 && next != null )
      next = next._next;
    return next;
  }

  Link getprev( int index )
  {
    Link prev = this;
    while ( index-- > 0 && prev != null )
      prev = prev._prev;
    return prev;
  }
}

class Chain
{
  String _name;
  Link   _first;
  Link   _last;
  int    _count;

  Chain( String name )
  {
    _name = name;
    _first = null;
    _last  = null;
    _count = 0;
  }

  Link get( int index )
  {
    Link link = _first;
    while ( link != null && index-- > 0 )
      link = link._next;

    return link;
  }

  void addLink( Link newLink )
  {
    newLink._chain = this;

    if ( _first == null )
    {
      _first = _last = newLink;
      _count++;
      myassert( check( ) );
      return;
    }

    addLinkAfter( _last, newLink );
  }

  void addChain( Chain newChain )
  {
    if ( newChain._count == 0 )
      return;
      
    //console.log( "adding chain" );

    if ( _first == null )
    {
      _first = _last = newChain._first;
      _count++;
      newChain.removeLink( newChain._first );
      _first._chain = this;
      _first._prev = null;
      _first._next = null;
      myassert( check( ) );
    }

    //print( "here 7\n" );

    addChainAfter( _last, newChain );

    //print( "here 8\n" );
  }

  void addChainAfter( Link existingLink, Chain newChain )
  {
    myassert( check( ) );
    myassert( existingLink._chain == this );

    if ( newChain._count == 0 )
      return;

    Link link = newChain._first;

    while ( link != null )
    {
      link._chain = this;
      link = link._next;
    }

    Link oldNext = existingLink._next;

    existingLink._next    = newChain._first;
    newChain._first._prev = existingLink;

    if ( oldNext != null )
    {
      newChain._last._next = oldNext;
      oldNext._prev = newChain._last;
    }
    else
    {
      _last = newChain._last;
    }

    _count += newChain._count;

    myassert( check( ) );
  }

  void addChainBefore( Link existingLink, Chain newChain )
  {
    myassert( existingLink._chain == this );
    if ( newChain._count == 0 )
      return;

    Link oldPrev = existingLink._prev;

    existingLink._prev    = newChain._last;
    newChain._last._next = existingLink;

    if ( oldPrev != null )
    {
      newChain._first._prev = oldPrev;
      oldPrev._next = newChain._first;
    }
    else
    {
      _first = newChain._first;
    }

    Link link = newChain._first;
    while ( link != null )
    {
      link._chain = this;
      link = link._next;
    }

    _count += newChain._count;

    myassert( check( ) );
  }

  void addLinkAfter( Link existingLink, Link newLink )
  {
    myassert( existingLink._chain == this );

    newLink._chain = this;

    Link oldNext = existingLink._next;

    existingLink._next = newLink;
    newLink._prev     = existingLink;

    if ( oldNext != null )
    {
      newLink._next = oldNext;
      oldNext._prev = newLink;
    }
    else
    {
      _last = newLink;
    }

    _count++;

    myassert( check( ) );
  }

  void addLinkBefore( Link existingLink, Link newLink )
  {
    myassert( existingLink._chain == this );

    newLink._chain = this;

    Link oldPrev = existingLink._prev;

    existingLink._prev = newLink;
    newLink._next     = existingLink;

    if ( oldPrev != null )
    {
      newLink._prev = oldPrev;
      oldPrev._next = newLink;
    }
    else
    {
      _first = newLink;
    }

    _count++;

    myassert( check( ) );
  }

  void removeLink( Link existingLink )
  {
    myassert( existingLink._chain == this );

    Link oldPrev = existingLink._prev;
    Link oldNext = existingLink._next;

    if ( oldPrev != null )
    {
      oldPrev._next = oldNext;
    }
    else
    {
      _first = oldNext;
    }
    if ( oldNext != null )
    {
      oldNext._prev = oldPrev;
    }
    else
    {
      _last = oldPrev;
    }

    _count--;

    myassert( check( ) );
  }

  void removeLinks( Link existingLinkFirst, Link existingLinkLast, int count )
  {
    myassert( existingLinkFirst._chain == this );
    myassert( existingLinkLast._chain == this );

    Link oldPrev = existingLinkFirst._prev;
    Link oldNext = existingLinkLast._next;

    if ( oldPrev != null )
    {
      oldPrev._next = oldNext;
    }
    else
    {
      _first = oldNext;
    }
    if ( oldNext != null )
    {
      oldNext._prev = oldPrev;
    }
    else
    {
      _last = oldPrev;
    }

    if ( count <= 0 )
    {
      _count--;
      Link link = existingLinkFirst;
      while ( link != existingLinkLast )
      {
        _count--;
        link = link._next;
      }
    }
    else
      _count -= count;

    myassert( check( ) );
  }

  boolean check( )
  {
    if ( true ) return true;

    if ( _first == null && _last == null && _count == 0 )
      return true;

    ArrayList CheckList = new ArrayList();

    Link link;

    link = _first;

    for ( ;; )
    {
      myassert( link._chain == this );
      CheckList.add( link );
      link = link._next;
      if ( link == null )
        break;
    }

    if ( CheckList.size( ) != _count )
      return false;

    link = _last;

    for ( ;; )
    {
      if ( link != CheckList.get( CheckList.size( ) - 1 ) )
        return false;

      CheckList.remove( CheckList.size( ) - 1 );

      link = link._prev;
      if ( link == null )
        break;
    }

    return true;
  }

  void dump( )
  {
    for ( Link link = _first; link != null; link = link._next )
      link._linkobject.dump( );
    print( "\n" );
  }
}

int __cellColor = 128;

class Cell extends LinkObject
{
  int   _color;
  int  _ch;
  Link  _matches;
  Link  _adjacent;
  int   _match;
  Cells _cells;
  int[] _j;

  Point _s;
  Point _v;
  //float _as; // rotational position ( 0 - 1 );
  //float _av; // rotational velocity
  
  Cell getnext( )
  {
    Link link = _adjacent._next;
    
    if ( link == null )
      return null;
    
    return ( Cell )link._linkobject;
  }
  
  Cell getprev( )
  {
    Link link = _adjacent._prev;
    
    if ( link == null )
      return null;
      
    return ( Cell )link._linkobject;
  }
  
  /*boolean equals( char ch )
  {
    

    return _ch == ch;
  }*/

  Cell( Cells cells, char ch )
  {
    _cells = cells;
    _ch = ch;
    _j = new int[ _cells._rules.length ];
    _s = new Point( 0.0, 0.0 );//random( -0.1, 0.1 ) ,random( -0.1, 0.1 ) );
    _v = new Point( 0.0, 0.0 );//random( -0.1, 0.1 ) ,random( -0.1, 0.1 ) );
    _color = __cellColor;
    __cellColor += 16;
    if ( __cellColor == 256 )
      __cellColor = 128;
  }

  void dump( )
  {
    print( _ch );
  }
  
  Cell calcForces( )
  {
    
    if ( _ch != 'F' )
    {
      return null;
    } 
    
    Cell next = getnext( );
    
    float rot = 0.0;
    
    for ( ;; )
    {
      if ( next == null )
      {
        return null;
      }
      
      if ( next._ch == 'l' )
      {
        rot = ( rot + SEGMENTS - 1 ) % SEGMENTS;
      }
      else if ( next._ch  == 'r' )
      {
        rot = ( rot + 1 ) % SEGMENTS;
      }
      else if ( next._ch == 'F' )
      {
        break;
      }
      
      next = next.getnext( );
    }
    
    Cell p  = this;
    Cell q  = next;
    
    float dx = q._s._x - p._s._x;
    float dy = q._s._y - p._s._y;
    
    // if there is no distance between p and q then it is not obvious which direction to make
    // the force so we must create a random direction
    while ( dx == 0.0 && dy == 0.0 )
    {
      dx = random( -1.0, 1.0 );
      dy = random( -1.0, 1.0 );
    }
    
    float length = sqrt( dx * dx + dy * dy );
    
    //print( length ); print( "\n" );
    
    // make into a unit vector
    float invlength = 1.0 / length;
    
    dx *= invlength;
    dy *= invlength;
    
    // lets update the velocities for now
    
    p._v._x += FORCE2 * dx * ( length - LENGTH );
    p._v._y += FORCE2 * dy * ( length - LENGTH );
    
    q._v._x -= FORCE2 * dx * ( length - LENGTH );
    q._v._y -= FORCE2 * dy * ( length - LENGTH );
    
    //if ( true ) return next;
    
    Cell next2 = next.getnext( ); //( next._adjacent._next != null ) ? ( Cell )next._adjacent._next._linkobject : null;
    
    for ( ;; )
    {
      if ( next2 == null )
      {
        return null;
      }
      
      if ( next2._ch == 'F' )
      {
        break;
      }
      
      next2 = next2.getnext( ); //( next2._adjacent._next != null ) ? ( Cell )next2._adjacent._next._linkobject : null;
    }
    
    Cell r = next2;
    
    //      dx = q._s._x - p._s._x;
    //      dy = q._s._y - p._s._y;
    
    float ex = r._s._x - q._s._x;
    float ey = r._s._y - q._s._y;
    
    if ( dx * dx + dy * dy < 0.00001 ||
         ex * ex + ey * ey < 0.00001 )
      return next;
    
    rot *= ( 2.0 * 3.141592654 / SEGMENTS );
    
   // print( "rot=" ); print( rot ); print( "\n" );
    
    float angle = angleBetween2Lines( dx, dy, ex, ey );
    //print( "angle=" ); print( angle ); print( "\n" );
    
    // rot is what we want!
    // angle is what we've got
    
    float diff = angle - rot;
    if ( diff <= -3.141592654 )
      diff += 2 * 3.141592654;
    else if ( diff >= 3.141592654 )
      diff -= 2.0 * 3.141592654;
    
    // diff looks good but how do we accelerate cells to achieve the right angle?
    // we need a perpendicular, lets try to move r first perpendicular to qr
    // f is the perpendicular
    
    float fx =  ey;
    float fy = -ex;
    
    float flength = sqrt( fx * fx + fy * fy );
    
    fx /= flength;
    fy /= flength;
    
    r._v._x += FORCE * LENGTH * diff * fx;
    r._v._y += FORCE * LENGTH * diff * fy; 
    
    // let g be the perpendicular to pq
    float gx = dy;
    float gy = -dx;
    
    float glength = sqrt( gx * gx + gy * gy );
    
    gx /= glength;
    gy /= glength;
    
    p._v._x += FORCE * LENGTH * diff * gx;
    p._v._y += FORCE * LENGTH * diff * gy;
    
    q._v._x -= FORCE * LENGTH * diff * ( fx + gx );
    q._v._y -= FORCE * LENGTH * diff * ( fy + gy );
    
    
    return next;
  }

  boolean replace( int ruleIndex )
  {
    //console.log( "replacing rule" );

    myassert( _matches._chain.check(  ) );
    myassert( _adjacent._chain.check(  ) );

    if ( ( _match & ( 1 << ruleIndex ) ) == 0 )
      return false;

    int length = _cells._rules[ ruleIndex ][ 0 ].length;

    Link first = _adjacent.getprev( length - 1 );

    _adjacent._chain.removeLinks( first, _adjacent, 0 );

    Chain cells_ = _cells.pattern( ruleIndex );
    
    Cell f = ( Cell )first._next._linkobject;
    Link c = cells_._first;
    while ( c != null )
    {
      Cell cc = ( Cell )c._linkobject;
      //print( f._s._x ); print( "\n" );
      cc._s._x = f._s._x;
      cc._s._y = f._s._y;
      cc._v._x = f._v._x;
      cc._v._y = f._v._y;
      c = c._next;
    }

    Cell  firstRetest  = ( Cell )cells_._first._linkobject;
    //int   retestLength = cells._adjacent._count;

    if ( first._prev != null )
    {
      _adjacent._chain.addChainAfter( first._prev, cells_ );
    }
    else if ( _adjacent._next != null )
    {
      _adjacent._chain.addChainBefore( _adjacent._next, cells_ );
    }
    else
    {
      //console.log( _adjacent._chain._count );
      //console.log( "before add" );
      _adjacent._chain.addChain( cells_ );
      //console.log( _adjacent._chain._count );
    }

    _matches._chain.removeLink( _matches );

    _cells.kmp( firstRetest, _cells._rules[ ruleIndex ][ 1 ].length + _cells._rulesMaxLength, true );
    //console.log( _adjacent._chain._count );

    return true;
  }

  void match( int ruleMask )
  {
    //console.log( "match" );
    if ( ( _match & ruleMask ) != 0 )
      return;

    _match ^= ruleMask;

    if ( _matches == null )
    {
      _matches = new Link( this );
      _cells._matches.addLink( _matches );
    }
  }

  void unmatch( int ruleMask )
  {
    if ( ( _match & ruleMask ) == 0 )
      return;

    _match ^= ruleMask;

    if ( _match == 0 )
    {
      _cells._matches.removeLink( _matches );
      _matches = null;
    }
  }
}

class Cells
{
  Chain _adjacent;
  Chain _matches;
  Chain _physical;

  char[][][]   _rules;
  int[][]    _rulesPre;
  int        _rulesMaxLength;
  
  Cell first( )
  {
    return ( Cell )_adjacent._first._linkobject;
  }

  Chain pattern( int ruleIndex )
  {
    //print( "creating pattern\n" );
    Chain chain = new Chain( "pattern" );
    myassert( ruleIndex < _rules.length );

    for ( int i = 0; i < _rules[ ruleIndex ][ 1 ].length; i++ )
    {

      Cell cell = new Cell( this, _rules[ ruleIndex ][ 1 ][ i ] );
      Link link = new Link( cell );
      cell._adjacent = link;
      chain.addLink( link );
    }

    //print( "end creating pattern: " );
    //chain.dump( );

    return chain;
  }

  int[] prekmp( char[] pattern )
  {
    int[] next = new int[ pattern.length + 1 ];
    int i=0, j=-1;
    next[0]=-1;
    while (i<pattern.length)
    {
      while (j>=0 && pattern[i]!=pattern[j])
        j = next[j];
      i++; 
      j++;
      next[i] = j;
    }
    return next;
  }

  void kmp( Cell first, int count, boolean incremental )
  {
    int[]     j = new int[ _rules.length ];//       = 0;
    Cell   cell = first;

    if ( incremental )
    {
      Link linkPrev = cell._adjacent._prev;
      if ( linkPrev != null )
      {
        j = ( ( Cell )( linkPrev._linkobject ) )._j;
      }
    }

    for ( ; count != 0; count-- )
    {
      for ( int ruleIndex = 0; ruleIndex < _rules.length; ruleIndex++ )
      {
        while (j[ruleIndex]>=0 && cell._ch != _rules[ ruleIndex ][ 0 ][j[ruleIndex]])
          j[ruleIndex] = _rulesPre[ ruleIndex ][j[ruleIndex]];
        j[ruleIndex]++;
      }
      for ( int ruleIndex = 0; ruleIndex < _rules.length; ruleIndex++ )
      {
        if (j[ruleIndex]==_rules[ ruleIndex ][ 0 ].length)
        {
          // print( "match\n" );
          cell.match( 1 << ruleIndex );
          j[ruleIndex] = _rulesPre[ ruleIndex ][j[ruleIndex]];
        }
        else
        {
          cell.unmatch( 1 << ruleIndex );
        }
      }
      Link next = cell._adjacent._next;
      if ( next == null )
      {
        break;
      }
      mycopy( j, cell._j);
      cell = ( Cell )next._linkobject;
    }
  }

  Cells( String bio, String[][] rules )
  {
    _adjacent = new Chain( "adjacent" );
    _matches  = new Chain( "matches" );
    _physical = new Chain( "physical" );
    
    char[] _bio = bio.toCharArray( );
    
    _rules   = new char[ rules.length][ 2 ][];
    
    for ( int i = 0; i < rules.length; i++ )
    {
      _rules[ i ][ 0 ] = rules[ i ][ 0 ].toCharArray( );
      _rules[ i ][ 1 ] = rules[ i ][ 1 ].toCharArray( );
    }

    for ( int i = 0; i < bio.length( ); i++ )
    {
      Cell cell = new Cell( this, _bio[ i ] );
      Link link = new Link( cell );
      cell._adjacent = link;
      _adjacent.addLink( link );
    }

    _rulesPre = new int[ _rules.length ][];

    _rulesMaxLength = 0;

    for ( int i = 0; i < _rules.length; i++ )
    {
      if ( _rules[ i ][ 1 ].length > _rulesMaxLength )
        _rulesMaxLength = _rules[ i ][ 0 ].length;

      _rulesPre[ i ] = prekmp( _rules[ i ][ 0 ] );
      for( int j = 0; j < _rulesPre[ i ].length; j++ )
      {
        print( _rulesPre[ i ][ j ] ); print( " " );
      }
      print( "\n" );
    }
    kmp( ( Cell )_adjacent._first._linkobject, -1, false );
  }
}

class Biota
{
  String _init;
  String _rules;
  int    _degrees;
  Biota( String init, String[][] rules, int _degrees )
  {
    
  }
};

Cells cells = null;

void draw( )
{
  Link link = cells._matches.get( ( int ) random( cells._matches._count ) );
  
  // do the thue type symbol replcement
  if ( link != null && random( 0, 1.0 ) < PROB )
  {
    Cell match = ( Cell )link._linkobject; 

    for ( int i = 0; i < cells._rules.length; i++ )
    {
      if ( ( ( 1 << i ) & match._match ) == 0 )
        continue;
      match.replace( i );
      break;
    }
  }

  background( 0 );

  translate( width / 2, height / 2 );
  strokeWeight( 0 );
  fill( 255 );
  scale( SCALE );
 
  Cell cell = null;
  Cell prev = null;
  
  // draw the cells
  for ( cell = cells.first( ); cell != null; )
  {
    //console.log( cell._ch );
    if ( cell._ch  == 'F' )
    {
      //background( 127, 0, 0 );
      //console.log( "here" );
    
      pushMatrix( );
      translate( cell._s._x, cell._s._y );
      fill( cell._color );
      stroke( cell._color );
      ellipse( 0, 0, WIDTH, WIDTH );
      if ( prev != null )
      {
        float a = angleBetween2Lines( prev._s._x - cell._s._x, prev._s._y - cell._s._y, -1.0, 0.0 );
        rotate( -a - 3.141592654 );
        rect( 0, -WIDTH / 2, LENGTH, WIDTH ); 
      }
      popMatrix( );
      prev = cell;
    }
    
    cell = cell.getnext( );
    if ( cell == cells.first( ) )
      break;
  }
  
  // update the positions
  for ( int r = 0; r < SPEED; r++ )
  {
    // start calc forces
    
    //for ( cell = cells.first( ); cell != null; cell = cell.calcForces( false ) );
    
    cell = cells.first( );
    
    Cell nextCell = null;
    
    for( ;; )
    {
      nextCell = cell.calcForces( );
      
      if ( nextCell != null )
        break;
        
      cell = cell.getnext( );
      if ( cell == null )
        break;
    }
    
    cell = nextCell;
    
    while ( cell != null )
    {
      cell = cell.calcForces( );
    }
    
    // end calc forces
    
    for( cell = cells.first( ); cell != null; cell = cell.getnext( ) )
    {
      if ( cell._ch != 'F' )
        continue;
      // update velocities
      
      // apply force
      cell._s._x += cell._v._x;
      cell._s._y += cell._v._y;
      
      // damping
      if ( cell._v._x * cell._v._x + cell._v._y * cell._v._y > 200.0 )
      {
        cell._v._x *= DAMP;
        cell._v._y *= DAMP;
      }
      else
      {
        cell._v._x *= 0.999;
        cell._v._y *= 0.999;
      } 
    }
  }
  
  // print( totaldiff ); print( " " ); print( mindiff ); print( " " ); print( maxdiff ); print( "\n" );
}

void setup( )
{
  size( 512, 512, P2D );
  smooth( );

  /*
  // organoflake
  String     bio   = "aaaFrrrrrFrrrrrF";
   String[][] rules = { { "aF", "FlFrrrrrFlFa" },
   { "al", "la" },
   { "arrrrr", "rrrrra" } };
   */
   
   
   /*
   // serpinksi triangle
   String bio = "xxxxxA";
   String[][] rules = { { "xA", "BFllAFllBFx" },
                        { "xB", "AFrrBFrrAFx" },
                        { "xF", "Fx" },
                        { "xll", "llx" },
                        { "xrr", "rrx" } };
   
*/
   
   
   // hilbert curve
   
   String     bio   = "xxxxA";
   String[][] rules = { { "xA", "lllBFrrrAFArrrFBlllx" },
   { "xB", "rrrAFlllBFBlllFArrrx" },
   { "xlll", "lllx" },
   { "xrrr", "rrrx" },
   { "xF", "Fx" },
   
   };
   
   /*
   // koch flake
   String     bio   = "aaaFrrrrFrrrrF";
   String[][] rules = { { "aF", "FllFrrrrFllFa" },
                     { "arrrr", "rrrra" },
                     { "all", "lla" } };*/
                     
   
   /*// reverse kock flake
   String     bio   = "aaaaFllllFllllF";
   String[][] rules = { { "aF", "FrrFllllFrrFa" },
                     { "allll", "lllla" },
                     { "arr", "rra" } };*/
  
  
  cells = new Cells( bio, rules );

}

void keyPressed( )
{
  switch( key )
  {
    case '+' : SPEED *= 2.0;
               break;
    case '-' : SPEED /= 2.0;
               break;
  }
}




