
// Hyun Jean Kwon
// © Hyun Jean Kwon Fall 2013, Pittsburgh, PA
// HW9 Course 60257

float x, y, z, speed;
final int MAX = 100;

int [ ] xCoords = new int[ MAX ];
int [ ] yCoords = new int[ MAX ];
int [ ] zCoords = new int[ MAX ];
int [ ] xRot = new int[ MAX ];
int [ ] yRot = new int[ MAX ];
int [ ] zRot = new int[ MAX ];
int [ ] cols = new color[ MAX ];

void setup() {
  size(displayWidth, displayHeight, P3D);
  smooth();
  x = 0;
  y = 0;
  z = 0;
  initCoords( xCoords, -width, width );
  initCoords( yCoords, -height, height );
  initCoords( zCoords, -10000, -1000 );
  initCoords( xRot, -5, 5 );
  initCoords( yRot, -5, 5 );
  initCoords( zRot, -5, 5 );
  initColors( );
}

void draw()
{
 moveFigs();
 move();
 bounce();
}

void initColors()
{
  for( int i = 0 ; i < cols.length ; i++ )
  {
    float r = random( 0 );
    float g = random( 168 );
    float b = random( 255 );
    cols[i] = color( r, g, b );
  }}

void initCoords( int [ ] coords, int  min, int max )
{
  for( int i = 0 ; i < coords.length ; i++ )
  {
    coords[i] = int( random( min, max ) );
  }}

void moveFigs()
{
  background(2);
for( int i = 0 ; i < cols.length ; i++ )  
  {
pushMatrix( );
      translate (xCoords[i], yCoords[i], zCoords[i] );
      rotateX( -radians( frameCount)*xRot[i] );
      rotateY( -radians( frameCount)*yRot[i] );
      rotateZ( -radians( frameCount)*zRot[i] ); 
noFill();
stroke( cols[i] );
beginShape();
  vertex(x+50, y, z+50);
  vertex(x, y+100, z);
  vertex(x+100, y+100, z);
  vertex(x+50, y, z+50);
  vertex(x+50, y+100, z+100);
  vertex(x+100, y+100, z);
  vertex(x, y+100, z);
  vertex(x+50, y+100, z+100);
endShape();
 
popMatrix();
}}

void move() {
  x = x + speed; }
  
void bounce() {
  if ((x > width) || (x < 0)) {
    speed = speed * - 0.2;}}
  

