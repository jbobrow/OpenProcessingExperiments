
PVector card1Pos;
PVector card2Pos;
PVector card3Pos;
PVector card4Pos;
PVector gravity;

Card card1;
Card card2;
Card card3;
Card card4;

class Card {
  PVector pos;
  PVector vel;
  boolean offScreen;
  boolean stalled;
  
  Card( float x, float y ) {
    pos = new PVector( x, y );
    vel = new PVector( random( -10, 10 ), 0 );
    offScreen = false;
    stalled = false;
  }
  
  void Update() {
    vel.add( gravity );
    pos.add( vel );
    if( pos.y >= height ) {
      pos.y = height;
      vel.y = -vel.y;
    }
    
    if( vel.mag() < 0.5 )
      stalled = true;
    
    if( pos.x+150 < 0 )
      offScreen = true;
    if( pos.x > width )
      offScreen = true;
  }
  
  void Render() {
    quad( pos.x, pos.y, pos.x+150, pos.y, pos.x+150, pos.y-210, pos.x, pos.y-210 );
  }
}

void setup() {
  size( 1024, 768 );
  background( #008000 );
  
  card1Pos = new PVector( 85, 250 );
  card2Pos = new PVector( 320, 250 );
  card3Pos = new PVector( 555, 250 );
  card4Pos = new PVector( 790, 250 );
  
  gravity = new PVector( 0, 5 );
  
  card1 = new Card( card1Pos.x, card1Pos.y );
  card2 = new Card( card2Pos.x, card2Pos.y );
  card3 = new Card( card3Pos.x, card3Pos.y );
  card4 = new Card( card4Pos.x, card4Pos.y );
}

void draw() {
  if( card1.offScreen || card1.stalled )
    card1 = new Card( card1Pos.x, card1Pos.y );
  if( card2.offScreen || card2.stalled )
    card2 = new Card( card2Pos.x, card2Pos.y );
  if( card3.offScreen || card3.stalled )
    card3 = new Card( card3Pos.x, card3Pos.y );
  if( card4.offScreen || card4.stalled )
    card4 = new Card( card4Pos.x, card4Pos.y );
  
  card1.Update();
  card2.Update();
  card3.Update();
  card4.Update();
  
  card1.Render();
  card2.Render();
  card3.Render();
  card4.Render();
}

