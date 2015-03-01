
//////////////////////////////////////////////////////////////////////////
//  Copyright 2014 Miguel Alejandro Moreno Barrientos
//
//  Hold On! is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Hold On! is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Hold On!.  If not, see <http://www.gnu.org/licenses/>.
//////////////////////////////////////////////////////////////////////////

ArrayList<Shape> listShapes;  // enemies shapes
Shape player;  // player shape
boolean dragging = false;  // mouse dragging
int SIZE = 0;  // screen size
float BOARD_SIZE = 0;
float PLAYER_SIZE = 0;
int timestamp, finalTime;  // start time and final lapse time
double speed;  // enemies speed
final int NOT_STARTED = 0, PLAYING = 1, END_GAME = 2;  // game states
int playing = NOT_STARTED;  // game state


void setup()
{
  // set sizes
  //SIZE = min( displayWidth, displayHeight );  //only in desktop mode
  SIZE = 600;
  BOARD_SIZE = gameMap( 0.8 );
  PLAYER_SIZE = gameMap( 0.08 );
  size( 600, 600 );
  //size( SIZE, SIZE, P2D );  //only in desktop mode
  

  // only in desktop mode
  /*if ( frame != null )
  {
    frame.setTitle( "Hold On!" );
    frame.setResizable( false );
    frame.setLocationRelativeTo( null );  // center sketch
  }*/
  
  
  noStroke();
  noSmooth();
  
  
  // set game parameters at start
  initialize();
}


void initialize()
{
  playing = NOT_STARTED;
  
  
  // create enemies 
  listShapes = new ArrayList<Shape>();
  // PVector.random2D() doesn't work in Javascript mode ¿¿??
  listShapes.add( new Shape( gameMap( 0.1 ), gameMap( 0.1 ), new PVector( gameMap( 0.1 ), gameMap( 0.1 ) ), new PVector( cos( random( TWO_PI ) ), sin( random( TWO_PI ) ) ), color( 0, 0, 255 ) ) );
  listShapes.add( new Shape( gameMap( 0.13 ), gameMap( 0.1 ), new PVector( gameMap( 0.771 ), gameMap( 0.1 ) ), new PVector( cos( random( TWO_PI ) ), sin( random( TWO_PI ) ) ), color( 0, 0, 255 ) ) );
  listShapes.add( new Shape( gameMap( 0.09 ), gameMap( 0.15 ), new PVector( gameMap( 0.1 ), gameMap( 0.751 ) ), new PVector( cos( random( TWO_PI ) ), sin( random( TWO_PI ) ) ), color( 0, 0, 255 ) ) );
  listShapes.add( new Shape( gameMap( 0.18 ), gameMap( 0.05 ), new PVector( gameMap( 0.721 ), gameMap( 0.85 ) ), new PVector( cos( random( TWO_PI ) ), sin( random( TWO_PI ) ) ), color( 0, 0, 255 ) ) );
  
  
  // create player
  player = new Shape( PLAYER_SIZE, PLAYER_SIZE, new PVector( ( width - PLAYER_SIZE ) / 2, ( height - PLAYER_SIZE ) / 2 ), new PVector( cos( random( TWO_PI ) ), sin( random( TWO_PI ) ) ), color( 255, 0, 0 ) );
}


void draw()
{
  // game time
  int lapse = 0;
  switch( playing )
  {
    //case NOT_STARTED:  lapse = 0; break;
    case PLAYING:  lapse = millis() - timestamp; break;
    case END_GAME:  lapse = finalTime; break;
  }


  // board
  background( 0 );
  fill( 255 );
  rectMode( CENTER );
  rect( width / 2, height / 2, BOARD_SIZE, BOARD_SIZE );
  rectMode( CORNER );
  
  // adjust speed
  speed = 0.002 * SIZE * sqrt( lapse / 1000. );
    
  
  // move elements
  movement();
  
  
  // draw enemies shapes
  for ( Shape shape : listShapes )
    shape.draw();
  
  
  // draw player shape
  player.draw();


  // detect collision
  if ( playing == PLAYING )
    collision();
  
  
  // draw time
  textSize( 16 );
  textAlign( RIGHT, TOP );
  fill( 0, 255, 0 );
  text( lapse / 1000. + " seconds", width - 1, 1 );
  
  
  // end game message
  if ( playing == END_GAME )
  {
    textSize( 48 );
    textAlign( CENTER, CENTER );
    fill( 0 );
    text( "Your time\n" + ( finalTime / 1000. ) + "\nseconds", width / 2 + 1, height / 2 + 1 );
    fill( 0, 200, 0 );
    text( "Your time\n" + ( finalTime / 1000. ) + "\nseconds", width / 2, height / 2  );
  }
}


float gameMap( float pos )
{
  return map( pos, 0, 1, 0, SIZE );
}


void movement()
{
  if ( playing != 1 )  // NOT PLAYING
    return;
  
  // move enemies
  for ( Shape shape : listShapes )
  {
    // new coordinates
    shape.getPosition().x += speed * shape.getDirection().x;
    shape.getPosition().y += speed * shape.getDirection().y;


    // detect wall collision
    if ( shape.getPosition().x < 0 )
    {
      shape.getDirection().x *= -1;
      shape.getPosition().x = -shape.getPosition().x;
    }
    else if ( shape.getPosition().x + shape.width - 1 >= width )
    {
      shape.getDirection().x *= -1;
      shape.getPosition().x = width + 1 - shape.width;
    }
    if ( shape.getPosition().y < 0 )
    {
      shape.getDirection().y *= -1;
      shape.getPosition().y = -shape.getPosition().y;
    }
    else if ( shape.getPosition().y + shape.height - 1 >= height )
    {
      shape.getDirection().y *= -1;
      shape.getPosition().y = height + 1 - shape.height;
    }
  }
}


void collision()
{
  // collision with the edges 
  if ( player.getPosition().x < ( width - BOARD_SIZE ) / 2. ||
       player.getPosition().y < ( height - BOARD_SIZE ) / 2. ||
       player.getPosition().x + player.width > width - ( width - BOARD_SIZE ) / 2. ||
       player.getPosition().y + player.height > height - ( height - BOARD_SIZE ) / 2.
  )
  {
    finalTime = millis() - timestamp;
    playing = 2;
    dragging = false;
  }
  
  // collision with enemies
  for ( Shape shape : listShapes )
  {
    if ( player.getPosition().x + player.width >= shape.getPosition().x &&
         player.getPosition().x < shape.getPosition().x + shape.width &&
         player.getPosition().y + player.height >= shape.getPosition().y &&
         player.getPosition().y < shape.getPosition().y + shape.height
    )
    {
      finalTime = millis() - timestamp;
      playing = END_GAME;
      dragging = false;
    }   
  }
}


void mousePressed()
{
  if (  mouseX >= player.getPosition().x &&
        mouseX <= ( player.getPosition().x + player.width ) &&
        mouseY >= player.getPosition().y &&
        mouseY <= ( player.getPosition().y + player.height )
     )
  {
    switch ( playing )
    {
      case NOT_STARTED:  // START GAME
      {
        playing = PLAYING; 
        timestamp = millis();
        //break;
      }
      case PLAYING:  // MOVE PLAYER
      {
        //noCursor();  //only in desktop mode
        dragging = true;
        break;
      }
      case END_GAME:  // RESTART GAME
      {
        initialize();
        timestamp = millis();
        break;
      }
    }
  }
}


void mouseReleased()
{
  //cursor();  //only in desktop mode
  dragging = false;
}


void mouseDragged()
{
  if ( dragging )
  {
    player.getPosition().x = mouseX - player.width / 2;
    player.getPosition().y = mouseY - player.height / 2;
  }
}


public class Shape
{
  float width, height;
  PVector position;
  PVector direction;
  color colour;


  Shape( float swidth, float sheight, PVector position, PVector direction, color colour )
  {
    this.width = swidth;
    this.height = sheight;
    this.position = position;
    this.direction = direction;
    this.colour = colour;
    
    // unit direction vector
    if ( direction.mag() != 0 )
    {
      this.direction.x /= direction.mag();
      this.direction.y /= direction.mag();
    }
  }
  
  
  PVector getPosition()
  {
    return position;
  }
  
  
  PVector getDirection()
  {
    return direction;
  }
  
  color getColor()
  {
    return colour;
  }
 
  
  void draw()
  {
    fill( colour );
    rect( position.x, position.y, this.width, this.height );
  }

}  // end class Shape



