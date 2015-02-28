
int SCREEN_WIDTH = 512;
int SCREEN_HEIGHT = 512;

int LENGTH = 100;
int WIDTH  = 50;
int SEGMENTS = 12;
float FORCE = 0.25;
float FORCE2 = 0.1;

int SPEED = 16;
float PROB = 0.2;
float DAMP = 0.8;

float SCALE = 0.1;
float XOFFSET = 0;
float YOFFSET = 0;


boolean recalc = false;

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
  int   _frameCount;
  int   _color;
  int  _ch;
  Link  _matches;
  Link  _adjacent;
  Link  _physical;
  int   _match;
  Cells _cells;
  int[] _j;

  Point _s;
  Point _v;
  float _rot;
  float _length;
  
  boolean contains( float x, float y )
  {
    float x2 = ( x - _s._x ) * ( x - _s._x );
    float y2 = ( y - _s._y ) * ( y - _s._y );
    
    Cell next = getnext( _physical );
    
    return ( x2 + y2 < ( WIDTH / 2 ) * ( WIDTH / 2 ) );
  }
  
  Cell getnext( Link link )
  {
    Link nextlink = link._next;
    
    if ( nextlink == null )
      return null;
    
    return ( Cell )nextlink._linkobject;
  }
  
  Cell getprev( Link link )
  {
    Link prevlink = link._prev;
    
    if ( prevlink == null )
      return null;
    
    return ( Cell )prevlink._linkobject;
  }
  
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
    _frameCount = frameCount;
    _length = LENGTH;
  }

  void dump( )
  {
    print( _ch );
  }
  
  void calcForces( )
  { 
   
    Cell next  = getnext( _physical );
    if ( next == null )
      return;
    
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
    
    float Fx = FORCE2 * dx * ( length - _length );
    float Fy = FORCE2 * dy * ( length - _length );
    
    // lets update the velocities for now
    
    if ( p != cellDragged )
    {
      p._v._x += Fx;
      p._v._y += Fy;
    }
    if ( q != cellDragged )
    {
      q._v._x -= Fx;
      q._v._y -= Fy;
    }
    
    Cell r = next.getnext( next._physical ); //( next._adjacent._next != null ) ? ( Cell )next._adjacent._next._linkobject : null;
    
    if ( r == null )
      return;
   
    float ex = r._s._x - q._s._x;
    float ey = r._s._y - q._s._y;
    
    if ( dx * dx + dy * dy < 0.00001 ||
         ex * ex + ey * ey < 0.00001 )
      return;
    
    float angle = angleBetween2Lines( dx, dy, ex, ey );
    
    float diff = angle - next._rot;
    if ( diff <= -3.141592654 )
      diff += 2 * 3.141592654;
    else if ( diff >= 3.141592654 )
      diff -= 2.0 * 3.141592654;
    
    // diff looks good but how do we accelerate cells to achieve the right angle?
    // we need a perpendicular, lets try to move r first perpendicular to qr
    // f is the perpendicular
    
    float fx =  ey;
    float fy = -ex;
    
    float invflength = 1.0 / sqrt( fx * fx + fy * fy );
    
    fx *= invflength; fy *= invflength;
    //fx *= 0.00001; fy *= 0.00001;
    Fx = FORCE * _length * diff * fx;
    Fy = FORCE * _length * diff * fy;
    
    if ( r != cellDragged )
    {
      r._v._x += Fx;
      r._v._y += Fy;
    }
    
    // let g be the perpendicular to pq
    float gx = dy;
    float gy = -dx;
    
    float invglength = 1.0 / sqrt( gx * gx + gy * gy );
    
    gx *= invglength; gy *= invglength;
    //gx *= 0.00001; gy *= 0.00001;
    
    float Gx = FORCE * _length * diff * gx;
    float Gy = FORCE * _length * diff * gy;
    
    if ( p != cellDragged )
    {
      p._v._x += Gx;
      p._v._y += Gy;
    }
    
    if ( q != cellDragged )
    {
      q._v._x -= Fx + Gx;
      q._v._y -= Fy + Gy;
    }
    
    return;
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
  
  Cell first( Chain chain )
  {
    Link link = chain._first;
    if ( link == null )
      return null;
    return ( Cell )link._linkobject;
  }
  
  Cell last( Chain chain )
  {
    Link link = chain._last;
    if ( link == null )
      return null;
    return ( Cell )link._linkobject;
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
      //cell._j = j.slice( 0 );
      //cell._j = j.clone();
      mycopy( j, cell._j );
      cell = ( Cell )next._linkobject;
    }
  }
  
  void CreatePhysicalChain( )
  {
    _physical = new Chain( "physical" );
    
    Cell cell = first( _adjacent );
    
    if ( cell == null )
      return;
    
    for ( ;; )
    {
      int rot = 0;
      
      while ( cell != null && cell._ch != 'F' )
      {
        if ( cell._ch == 'l' )
          rot--;
        else if ( cell._ch == 'r' )
          rot++;
        cell = cell.getnext( cell._adjacent );
      }
      
      if ( cell == null )
        break;
      
      cell._rot = ( ( rot % SEGMENTS ) * 2.0 * 3.141592654 ) / SEGMENTS;
        
      Link link = new Link( cell );
      cell._physical = link;
      _physical.addLink( link );
      
      cell = cell.getnext( cell._adjacent );
    }
  }

  Cells( String bio, String[][] rules )
  {
    _adjacent = new Chain( "adjacent" );
    _matches  = new Chain( "matches" );
    //_physical = null;//new Chain( "physical" );
    
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
    CreatePhysicalChain( );
  }
}

class Biota
{
  Cells      _cells;
  String     _init;
  String[][] _rules;
  int        _degrees;
  Biota( String init, String[][] rules, int degrees )
  {
    _cells   = new Cells( init, rules );;
    _init    = init;
    _rules   = rules;
    _degrees = degrees;
  }
  
  void move( )
  {
    // update the positions
    for ( int r = 0; r < SPEED; r++ )
    {
      for( Cell cell = _cells.first( _cells._physical ); cell != null; cell = cell.getnext( cell._physical ) )
      {
        cell.calcForces( );
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
  }
  
  boolean evolve( )
  {
    Link link = _cells._matches.get( ( int ) random( _cells._matches._count ) );
    
    // do the thue type symbol replcement
    if ( link == null )
      return false;
  
    Cell match = ( Cell )link._linkobject; 
  
    for ( int i = 0; i < _cells._rules.length; i++ )
    {
      if ( ( ( 1 << i ) & match._match ) == 0 )
        continue;
      match.replace( i );
      return true;
    }
    
    return false;
  }
  
  void draw( )
  {
    Cell cell = null;
    Cell prev = null;
    
    mouseOver = null;
    
    // draw the cells
    for ( cell = _cells.first( _cells._physical ); cell != null; cell = cell.getnext( cell._physical ) )
    {
      pushMatrix( );
      translate( cell._s._x, cell._s._y );
      if ( cell.contains( ( mouseX - SCREEN_WIDTH / 2 - XOFFSET ) / SCALE, ( mouseY - SCREEN_HEIGHT / 2 - YOFFSET ) / SCALE ) )
      {
        mouseOver = cell;
        fill( 0, 255, 255 );
        stroke( 0, 255, 255 );
      }
      else
      {
        fill( cell._color );
        stroke( cell._color );
      }
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
  }
};

Cell  mouseOver    = null;
Cell  cellDragged  = null;

Point mousePress = new Point( 0.0, 0.0 );
Point cellPress  = new Point( 0.0, 0.0 );


void mousePressed()
{
  cellDragged = mouseOver;
  if ( cellDragged == null )
    return;
    
  mousePress._x = ScreenToCell_x( mouseX );
  mousePress._y = ScreenToCell_y( mouseY );
    
  cellPress._x = cellDragged._s._x;
  cellPress._y = cellDragged._s._y;
  
  cellDragged._v._x = 0.0;
  cellDragged._v._y = 0.0;
  
}

void mouseDragged()
{
  if ( cellDragged == null )
    return;
    
  cellDragged._s._x = ScreenToCell_x( mouseX ) + cellPress._x - mousePress._x;
  cellDragged._s._y = ScreenToCell_y( mouseY ) + cellPress._y - mousePress._y;
}

void mouseReleased()
{
  cellDragged = null;
}

float ScreenToCell_x( float x )
{
  return ( x - SCREEN_WIDTH / 2 - XOFFSET ) / SCALE;
}

float ScreenToCell_y( float y )
{
  return ( y - SCREEN_WIDTH / 2 - XOFFSET ) / SCALE;
}

float bright = 0.5;

void draw( )
{
  if ( !focused )
  {
    scale( 1.0 );
    background( 0 );
    textSize( 64 );
    textAlign( CENTER );
    if ( bright < 1.0 )
      fill( 0, 102 * bright, 153 * bright );
    else
      fill( 0, 102 * ( 2.0 - bright), 153 * ( 2.0 - bright ) );
    text( "evolve", SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 );
    bright += 0.005;
    if ( bright > 1.5 )
      bright = 0.5;
    return;
  }
  
  if ( random( 1.0 ) < PROB )
    recalc = biota.evolve( );
  
  if ( recalc )
    biota._cells.CreatePhysicalChain( );

  background( 0 );

  translate( XOFFSET + SCREEN_WIDTH / 2, YOFFSET + SCREEN_WIDTH / 2 );
  scale( SCALE );
 
  biota.draw( );
  biota.move( );
}

Biota biota = null;

static final int BIOTA_ORGANOFLAKE  = 1;
static final int BIOTA_SERPINSKI    = 2;
static final int BIOTA_HILBERT      = 3;
static final int BIOTA_KOCH         = 4;
static final int BIOTA_REVERSEKOCH  = 5;
static final int BIOTA_LEVYCURVE    = 6;

void newBiota( int type )
{
  switch( type )
  {
    case BIOTA_ORGANOFLAKE :
      biota = new Biota( "aaaFrrrrrFrrrrrF", new String[][] { { "aF", "FlFrrrrrFlFa" }, { "al", "la" }, { "arrrrr", "rrrrra" } }, SEGMENTS );
      break;
      
    case BIOTA_SERPINSKI :
      biota = new Biota( "xxxxxxA", new String[][] { { "xA", "BFllAFllBFx" }, { "xB", "AFrrBFrrAFx" }, { "xF", "Fx" }, { "xll", "llx" }, { "xrr", "rrx" } }, SEGMENTS );
      break;
      
    case BIOTA_HILBERT :
      biota = new Biota( "xxxA", new String[][] { { "xA", "lllBFrrrAFArrrFBlllx" }, { "xB", "rrrAFlllBFBlllFArrrx" }, { "xlll", "lllx" }, { "xrrr", "rrrx" }, { "xF", "Fx" } }, SEGMENTS );
      break;
    
    case BIOTA_KOCH :
      biota = new Biota( "aaaFrrrrFrrrrF", new String[][] { { "aF", "FllFrrrrFllFa" }, { "arrrr", "rrrra" }, { "all", "lla" } }, SEGMENTS );
      break;
      
    case BIOTA_REVERSEKOCH :
      biota = new Biota( "aaaaFllllFllllF", new String[][] { { "aF", "FrrFllllFrrFa" }, { "allll", "lllla" }, { "arr", "rra" } }, SEGMENTS );
      break;
      
    case BIOTA_LEVYCURVE :
      biota = new Biota( "xxxxxxxF", new String[][] { { "xF", "rFllFrx" }, { "xr", "rx" }, { "xl", "lx" } }, SEGMENTS );
      break;
      
    default :
      break;
  }
}

void setup( )
{
  size( 512, 512 );
  strokeWeight( 0 );
  newBiota( BIOTA_ORGANOFLAKE );
}

void keyPressed( )
{
  float center_x = ( cellDragged == null ) ? 0.0 : ( SCREEN_WIDTH  / 2 - mouseX );
  float center_y = ( cellDragged == null ) ? 0.0 : ( SCREEN_HEIGHT / 2 - mouseY );
  
  if ( key >= '0' && key <= '9' )
    newBiota( key - '0' );
  
  switch( key )
  {
    case 'z' :
      SCALE   *= 2.0;
      XOFFSET = ( XOFFSET + center_x ) * 2.0 - center_x;
      YOFFSET = ( YOFFSET + center_y ) * 2.0 - center_y;
      if ( cellDragged != null )
      {
        mousePress._x = ScreenToCell_x( mouseX );
        mousePress._y = ScreenToCell_y( mouseY );
        cellPress._x = cellDragged._s._x;
        cellPress._y = cellDragged._s._y;
      }
      break;
    case 'a' :
      SCALE   /= 2.0;
      XOFFSET = ( XOFFSET + center_x ) / 2.0 - center_x;
      YOFFSET = ( YOFFSET + center_y ) / 2.0 - center_y;
      if ( cellDragged != null )
      {
        mousePress._x = ScreenToCell_x( mouseX );
        mousePress._y = ScreenToCell_y( mouseY ); 
        cellPress._x = cellDragged._s._x;
        cellPress._y = cellDragged._s._y;
      }
      break;
    case '+' :
      SPEED *= 2.0;
      //PROB  *= 2.0;
      break;
    case '-' :
      SPEED /= 2.0;
      //PROB  /= 2.0;
      break;
    case '<' :
      if ( SEGMENTS > 1 )
      {
        SEGMENTS--;
        recalc = true;
      }
      break;
    case '>' :
      SEGMENTS++;
      recalc = true;
      break;
  }
  
  switch ( keyCode )
  {
    case UP :
      YOFFSET += height / 16;
      break;
        
    case DOWN :
      YOFFSET -= height / 16;
      break;
        
    case RIGHT :
      XOFFSET -= width / 16;
      break;
        
    case LEFT :
      XOFFSET += width / 16;
      break;
  }
}
