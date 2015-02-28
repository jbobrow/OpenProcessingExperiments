
void setup()
{
  size( 800, 800 );
  smooth();
  
  randomSeed( 0 );
  Render();
}

void draw()
{
  if( keyPressed )
    Render();
}

void Render() {
  background( 200 );
  
  fill( 127 );
  noStroke();
  for( int i = 0; i < 10; i++ ) {
    for( int j = 0; j < 10; j++ ) {
      quad( (i*16) + (i*64) + 8, (j*16) + (j*64) + 8,
            (i*16) + (i*64) + 8, (j*16) + ((j+1)*64) + 8,
            (i*16) + ((i+1)*64) + 8, (j*16) + ((j+1)*64) + 8,
            (i*16) + ((i+1)*64) + 8, (j*16) + (j*64) + 8 );
    }
  }
  
  pushMatrix();
  translate( 40.0f, 72.0f );
  for( int i = 0; i < 10; i++ ) {
    
    pushMatrix();
    for( int j = 0; j < 10; j++ ) {
      trunk( random(6.0f), random(4.0f, 8.0f), random(8.0f, 16.0f), random(120.0f), random(16.0f), random(6.0f), random(8.0f) );
      translate( 0.0f, 80.0f );
    }
    popMatrix();
    translate( 80, 0.0f );
  }
  popMatrix();
}

// squiggly   - bends in the trunk and branches
// heighty    - height of the tree
// branchy    - quantity of branches
// angley     - angle of branches to trunk
// subbranchy - quantity of subbranches
// widthy     - length of branches
// tapery     - decrease in branch length with height
void trunk( float squiggly, float heighty, float branchy, float angley, float subbranchy, float widthy, float tapery )
{
  stroke( 0 );
  PVector trunkPosition = new PVector( 0.0f, 0.0f );
  for( int i = 0; i < heighty; i++ )
  {
    PVector offset = new PVector( random( -squiggly, squiggly ), -heighty );
    line( trunkPosition.x, trunkPosition.y, trunkPosition.x + offset.x, trunkPosition.y + offset.y );
    trunkPosition.add( offset );
    
    pushMatrix();
    translate( trunkPosition.x, trunkPosition.y );
    float branchCount = random( branchy );
    for( int j = 0; j < branchCount; j++ )
      branch( squiggly, angley, subbranchy, widthy - ((i/heighty) * tapery) );
    popMatrix();
  }
}

void branch( float squiggly, float angley, float subbranchy, float widthy )
{
  pushMatrix();
  rotate( radians( random(-angley, angley) ) );
  
  PVector branchPosition = new PVector( 0.0f, 0.0f );
  for( int i = 0; i < widthy; i++ )
  {
    PVector offset = new PVector( random( -squiggly, squiggly ), -widthy );
    line( branchPosition.x, branchPosition.y, branchPosition.x + offset.x, branchPosition.y + offset.y );
    branchPosition.add( offset );
    
    pushMatrix();
    translate( branchPosition.x, branchPosition.y );
    float subbranchCount = random( subbranchy );
    for( int j = 0; j < subbranchCount; j++ )
      branch( squiggly, angley, 0.0f, widthy/4.0f );
    popMatrix();
  }
  popMatrix();
}































