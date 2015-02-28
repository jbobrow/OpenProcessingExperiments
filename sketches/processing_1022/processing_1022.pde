
//import processing.opengl.*;

ArrayList points;
//PrintWriter output;
Point p, p1;
String filename = "data/positions.txt";
String defaultFilename = "data/default.txt";
float theta;
float yRotateSpeed = .1;
PFont font;
String instructions = 
"space = start over\nanykey = save and quit\nclick and drag = add parts";
String greeting = "be mine";

void setup() 
{
  //size(screen.width, screen.height, P3D);
  size( 800, 800, P3D );
  smooth();
  font = loadFont( "04b03-24.vlw" );
  textFont( font );
  textMode(MODEL);
  theta = 0;
  points = new ArrayList();
  try
  {
    String[] lines = loadStrings( defaultFilename );
    for( int i = 0; i < lines.length; i++ )
    {
      points.add( new Point( lines[i] ) );
      println( i + ": " + points.get( i ).toString() );
    }
  }
  catch( NullPointerException n2 )
  {
    // now do nothing
  } 
  //output = createWriter(filename);
}

void draw() 
{
  background( 255 );
  stroke( 0 );
  fill( 0 );
  if (mousePressed) {
    points.add( new Point( mouseX - width/2, mouseY, dist( pmouseX, pmouseY, mouseX, mouseY ) ) );
    textAlign( TOP, LEFT );   
    text( instructions, 10, 30 );
  }
  translate( width/2, 0, -100 );
  textAlign( CENTER, CENTER );
  text( greeting, 0, height/2 );
  if(! mousePressed )
  {
    rotateY( theta );
    theta += yRotateSpeed; 
  }
  if( points.size() >= 1 )
  {
    p1 = (Point) points.get( 0 );
  }
  for(int i = 1; i < points.size(); i++ )
  {
    p = (Point) points.get( i );
    //p.display();
    p.connectTo( p1 );
    p1 = p;
  }
}

void keyPressed() {
  if( key == ' ' )
  {
    // start over
    points = new ArrayList(); 
  }
//  else
//  {
//    for( int i = 0; i < points.size(); i++ )
//    {
//      output.println( points.get(i).toString() ); 
//    }
//    output.flush(); // Write the remaining data
//    output.close(); // Finish the file
//    exit(); // Stop the program
//  }
}

class Point
{
  int x, y;
  float speed;
  color col;

  Point( int x, int y, float speed )
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
    col = color( random( 255 ), 0, 0, random( 255 ) );
  } 

  Point( String lineOfText )
  {
    String[] pieces = split(lineOfText, '\t' );
    if( pieces.length == 3 )
    {
      x = int(pieces[0]);
      y = int(pieces[1]);
      speed = float(pieces[2]);
    }
    else
    {
      x = -1;
      y = -1;
      speed = 0; 
    }
    col = color( random( 255 ), 0, 0, random( 255 ) );
  }

  void display()
  {
    point( x, y, speed );
  }

  void connectTo( Point p2 )
  {
    strokeWeight( speed );
    stroke( col );
    line( x, y, speed, p2.x, p2.y, speed );
  }

  public String toString()
  {
    return str(x) + '\t' + str(y) + '\t' + str(speed); 
  }
}

void loadDefault()
{

}






