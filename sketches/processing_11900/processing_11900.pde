
class box
{
  PVector location;
  float angle = 0;
  float mass = 1;
  float MI = 0;
  PVector velocity = new PVector( 0, 0 );
  float angularvelocity = 0;
  side[] sides = new side[ 0 ];
  Boolean stat = false;
  box( PVector location )
  {
    this.location = location;
    boxes = ( box[] ) append( boxes, this );
    PVector CM = new PVector( 0, 0 );
    float number = 4;
    for( int i = int( number - 1 ); i >= 0; i-- )
    {
      sides = ( side[] ) append( sides, new side( new PVector( cos( TWO_PI / number * i ) * 50, sin( TWO_PI / number * i ) * 50 ), new PVector( cos( TWO_PI / number * ( i - 1 ) ) * 50, sin( TWO_PI / number * ( i - 1 ) ) * 50 ) ) );
    }
    /*sides = ( side[] ) append( sides, new side( new PVector( 0, 0 ), new PVector( 0, 100 ) ) );
    sides = ( side[] ) append( sides, new side( new PVector( 0, 100 ), new PVector( 100, 100 ) ) );
    sides = ( side[] ) append( sides, new side( new PVector( 100, 100 ), new PVector( 100, 0 ) ) );
    sides = ( side[] ) append( sides, new side( new PVector( 100, 0 ), new PVector( 0, 0 ) ) );*/
    for( int i = 0; i < sides.length; i++ )
    {
      CM.add( sides[ i ].a.get() );
    }
    CM.div( sides.length );
    for( int i = 0; i < sides.length; i++ )
    {
      sides[ i ].a.sub( CM );
      sides[ i ].b.sub( CM );
      MI += pow( sides[ i ].a.mag(), 2 );
    }
    MI *= mass;
    //MI *= 0.05;
  }
  void run()
  {
    location.x = location.x < 0 ? width : location.x > width ? 0 : location.x;
    location.y = location.y < 0 ? height : location.y > height ? 0 : location.y;
    if( ! stat )
    {
      location.add( velocity );
      angle += angularvelocity;
    }
    else {
      velocity = new PVector( 0, 0 );
      angularvelocity = 0;
    }
    if( keyPressed )
    {
      velocity.y += 0.5 / mass;
    }
    angularvelocity *= airfriction;
    velocity.mult( airfriction );
    noFill();
    beginShape();
    for( int i = 0; i < sides.length; i++ )
    {
      PVector temp = turn( sides[ i ].a, angle );
      vertex( location.x + temp.x, location.y + temp.y );
    }
    endShape( CLOSE );
  }
  void collide()
  {
    float nextangle = angle + angularvelocity;
    PVector nextlocation = PVector.add( location, velocity );
    for( int i = 0; i < boxes.length; i++ )
    {
      if( boxes[ i ] != this )
      {
        for( int j = 0; j < sides.length; j++ )
        {
          PVector temp = PVector.add( nextlocation, turn( sides[ j ].a, nextangle ) );
          if( boxes[ i ].nextwithin( temp ) & ! boxes[ i ].within( PVector.add( location, turn( sides[ j ].a, angle ) ) ) )
          {
            side nearest = null;
            float distance = 0;
            for( int k = 0; k < boxes[ i ].sides.length; k++ )
            {
              PVector p = PVector.add( location, turn( sides[ j ].a, angle ) );
              PVector corner = PVector.add( boxes[ i ].location, turn( boxes[ i ].sides[ k ].a, boxes[ i ].angle ) );
              PVector nextcorner = PVector.add( boxes[ i ].location, turn( boxes[ i ].sides[ k ].b, boxes[ i ].angle ) );
              float thisdistance = dist( p.x, p.y, ( corner.x + nextcorner.x ) / 2, ( corner.y + nextcorner.y ) / 2 );
              if( nearest == null | thisdistance < distance )
              {
                nearest = boxes[ i ].sides[ k ];
                distance = thisdistance;
              }
            }
            if( false & nearest != null )
            {
              strokeWeight( 4 );
              PVector corner = PVector.add( boxes[ i ].location, turn( nearest.a, boxes[ i ].angle ) );
              PVector nextcorner = PVector.add( boxes[ i ].location, turn( nearest.b, boxes[ i ].angle ) );
              line( corner.x, corner.y, nextcorner.x, nextcorner.y );
              ellipse( PVector.add( location, turn( sides[ j ].a, angle ) ).x, PVector.add( location, turn( sides[ j ].a, angle ) ).y, 5, 5 );
              strokeWeight( 1 );
            }
            PVector pvelocity = PVector.mult( turn( sides[ j ].a, HALF_PI ), angularvelocity );
            pvelocity.add( velocity );
            PVector opvelocity = PVector.mult( turn( PVector.sub( PVector.add( sides[ j ].a, location ), boxes[ i ].location ), HALF_PI ), boxes[ i ].angularvelocity );
            opvelocity.add( boxes[ i ].velocity );
            PVector relativevelocity = PVector.sub( pvelocity, opvelocity );
            PVector normal = turn( PVector.sub( nearest.a, nearest.b ), boxes[ i ].angle - HALF_PI );
            normal.normalize();
            float elasticity = 1;
            float impulse = PVector.dot( PVector.mult( relativevelocity, -( 1 + elasticity ) ), normal );
            impulse /= PVector.dot( normal, PVector.mult( normal, ( 1 / mass + 1 / boxes[ i ].mass ) ) ) + pow( PVector.dot( turn( sides[ j ].a, HALF_PI ), normal ), 2 ) / MI + pow( PVector.dot( turn( PVector.sub( PVector.add( sides[ j ].a, location ), boxes[ i ].location ), HALF_PI ), normal ), 2 ) / boxes[ i ].MI;
            normal.mult( impulse );
            normal.div( mass );
            velocity.add( normal );
            normal.mult( mass / boxes[ i ].mass );
            boxes[ i ].velocity.sub( normal );
            normal.mult( boxes[ i ].mass );
            //normal.div( 100/12 );
            angularvelocity += ( sides[ j ].a.x*normal.y-sides[ j ].a.y*normal.x ) / MI;
            boxes[ i ].angularvelocity -= ( PVector.sub( PVector.add( sides[ j ].a, location ), boxes[ i ].location ).x*normal.y-PVector.sub( PVector.add( sides[ j ].a, location ), boxes[ i ].location ).y*normal.x ) / boxes[ i ].MI;
            if( ! stat )
            {
              location.add( velocity );
              angle += angularvelocity;
            }
            //line( PVector.add( location, turn( sides[ j ].a, angle ) ).x, PVector.add( location, turn( sides[ j ].a, angle ) ).y, PVector.add( location, turn( sides[ j ].a, angle ) ).x + normal.x, PVector.add( location, turn( sides[ j ].a, angle ) ).y + normal.y );
            //ellipse( PVector.add( location, turn( sides[ j ].a, angle ) ).x, PVector.add( location, turn( sides[ j ].a, angle ) ).y, 5, 5 );
            //noLoop();
          }
        }
      }
    }
  }
  Boolean within( PVector test )
  {
    Boolean within = true;
    for( int i = 0; i < sides.length; i++ )
    {
      PVector corner = PVector.add( location, turn( sides[ i ].a, angle ) );
      PVector nextcorner = PVector.add( location, turn( sides[ i ].b, angle ) );
      within = side( corner, nextcorner, test ) == LEFT | side( corner, nextcorner, test ) == CENTER ? true : false;
      if( within == false )
        break;
    }
    return within;
  }
  Boolean nextwithin( PVector test )
  {
    Boolean within = true;
    for( int i = 0; i < sides.length; i++ )
    {
      PVector corner = PVector.add( PVector.add( location, velocity ), turn( sides[ i ].a, angle + angularvelocity ) );
      PVector nextcorner = PVector.add( PVector.add( location, velocity ), turn( sides[ i ].b, angle + angularvelocity ) );
      within = side( corner, nextcorner, test ) == LEFT | side( corner, nextcorner, test ) == CENTER ? true : false;
      if( within == false )
        break;
    }
    return within;
  }
}


