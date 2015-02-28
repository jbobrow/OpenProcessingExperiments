
ArrayList objects;
int numObjects = 35;

void setup()
{
  size( 700, 300 );
  smooth();
  objects = new ArrayList();
  for( int i = 0; i < numObjects; i++ )
  {
    objects.add( new LinkableBall( i, i ) );
  }
  for( int i = numObjects-1; i > 0; i-- )
  {
    Linkable leader = (Linkable) objects.get( i );
    Linkable follower = (Linkable) objects.get( i - 1 );
    follower.setNext( leader );
    leader.setPrevious( follower );
  }
}

void draw()
{
  background( 200 );
  Locatable object;
  for( int i = 0; i < numObjects; i++ )
  {
    object = (Locatable) objects.get( i );
    object.display();
  }
}




