
/*
Class: Asteroid Class
Description: Generate lines etc for drawing of an asteroid object
Author: Jamie Watson 2010
*/

public class Asteroid extends Moveable{
  
  boolean cleanup = false;  //Flag for removing from the game
  
  float asteroidScale = 1.5F;
  boolean shield = true;
  int shield_time = 0;
  
  float score = 0;
  private int score_opacity = 255;
  
  private float rotation = 0;
  
  private int asteroid_type = 0;
  private int multiplier =0;
  private boolean hasMultiplier = false;
  
  public int current_multiplier = 1;
  
  Asteroid(float s, float x, float y,float dir){

    super( x, y, -0.5F + random(1), -0.5F + random(1) );
    direction = random(360);
    asteroidScale = s;
    
    asteroid_type = (int) random( 3 );
    rotation = -1.0F + random( 2.0F );
    
    if( (int)random( 10 ) == 1 ) hasMultiplier = true;
    
    multiplier = (int)random( 10 );
    if( multiplier < 6 ) multiplier = 2;
    else if( multiplier < 8 ) multiplier = 3;
    else if( multiplier < 9 ) multiplier = 4;
    else multiplier = 5;
    
    score = (2-s)*50;
    
    updateLines();
    
    dead_particles.noRepeat();
    dead_particles.setColor( 255 );
    
    shield_time = millis() + 2500;
    
  }
  
  //Method to update the lines of the ship
  protected void updateLines(){
    
    switch(asteroid_type){
      case 0:
      PVector[] l0 = {
        new PVector( getPosition().x + cos( radians( direction ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 60 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 60 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 120 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 120 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 150 ) ) * (5*asteroidScale), getPosition().y + sin( radians( direction + 150 ) ) * (5*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 200 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 200 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 260 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 260 ) ) * (15*asteroidScale) ),
      };
      lines=l0;
      break;
      
      case 1: 
      PVector[] l1 = {
        new PVector( getPosition().x + cos( radians( direction ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 60 ) ) * (5*asteroidScale), getPosition().y + sin( radians( direction + 60 ) ) * (5*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 120 ) ) * (10*asteroidScale), getPosition().y + sin( radians( direction + 120 ) ) * (10*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 150 ) ) * (10*asteroidScale), getPosition().y + sin( radians( direction + 150 ) ) * (10*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 200 ) ) * (5*asteroidScale), getPosition().y + sin( radians( direction + 200 ) ) * (5*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 260 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 260 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 300 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 300 ) ) * (15*asteroidScale) ),
      };
      lines= l1;
      break;
      
      case 2:
      PVector[] l2 = {
        new PVector( getPosition().x + cos( radians( direction ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 60 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 60 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 80 ) ) * (10*asteroidScale), getPosition().y + sin( radians( direction + 80 ) ) * (10*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 120 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 120 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 150 ) ) * (15*asteroidScale), getPosition().y + sin( radians( direction + 150 ) ) * (15*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 200 ) ) * (10*asteroidScale), getPosition().y + sin( radians( direction + 200 ) ) * (10*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 260 ) ) * (10*asteroidScale), getPosition().y + sin( radians( direction + 260 ) ) * (10*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 280 ) ) * (5*asteroidScale), getPosition().y + sin( radians( direction + 280 ) ) * (5*asteroidScale) ),
        new PVector( getPosition().x + cos( radians( direction + 300 ) ) * (5*asteroidScale), getPosition().y + sin( radians( direction + 300 ) ) * (5*asteroidScale) ),
      };
      lines = l2;
      break;
    }
    
    
  }
  
  public void draw(){
    if( !isAlive() ) return;
        
    if( shield ){ 
      float d = findLargestRadius()*2;
      stroke(255,(shield_time-millis())/10);noFill();
      ellipse( position.x, position.y, d, d );
      
      /*stroke( 255,255 );
      ellipse( position.x, position.y, d, d );*/
    }
    
    super.draw();    
  }
  
  public void update(){
    
    
    if( !isAlive() ){
      if( millis() >= die_time ){
        cleanup = true;
      }
      
      fill( 255, score_opacity-- );
      if( score_opacity <= 0 ) score_opacity = 0;
      textFont(gameFont, 16);
      if( hasMultiplier && score > 0 )
        text( "X" + (int)multiplier + " MULTIPLIER", position.x, position.y );
      else
        text( (int)score * current_multiplier, position.x, position.y );      
      textFont(gameFont, 8 );
      position.y -= random(0.5);
      position.x += sin( radians(direction) ) / 5;
      direction += random(2);
    }else{
      super.update();
      updateLines();
      direction+= rotation;
    }
    
    if( shield_time <= millis() ) shield = false;
    
    dead_particles.update();    
  }
  
  public void die(){
    
    if( !isAlive() ) return;
    
    dead = true;
    die_time = millis() + 1000 + (int)random(5000); //5 seconds from now
    direction = random(360);
    
    //Add particles to the system
    for( float ang =0; ang < 360; ang += 3.6F / asteroidScale ){
      float v = random(1,2.1F) * asteroidScale;
      dead_particles.addParticle( new EllipseParticle( new PVector( position.x, position.y ), new PVector( cos( radians(ang) )*v, sin( radians(ang) ) *v), 200 ));
    }
  
    dead_particles.addParticle( new LineParticle( new PVector( position.x, position.y ), new PVector( cos( radians( random( 360 ) ) ) * 0.1, sin( radians( random( 360 ) ) ) * 0.1 ), 200, 13*asteroidScale, random(360) ) );
    dead_particles.addParticle( new LineParticle( new PVector( position.x, position.y ), new PVector( cos( radians( random( 360 ) ) ) * 0.1, sin( radians( random( 360 ) ) ) * 0.1 ),200, 13*asteroidScale, 70 ) );
    dead_particles.addParticle( new LineParticle( new PVector( position.x, position.y ), new PVector( cos( radians( random( 360 ) ) ) * 0.1, sin( radians( random( 360 ) ) ) * 0.1 ),200, 6.5F*asteroidScale, 200 ) );
    dead_particles.addParticle( new LineParticle( new PVector( position.x, position.y ), new PVector( cos( radians( random( 360 ) ) ) * 0.1, sin( radians( random( 360 ) ) ) * 0.1 ),200, 6.5F*asteroidScale, 290 ) );
    dead_particles.addParticle( new LineParticle( new PVector( position.x, position.y ), new PVector( cos( radians( random( 360 ) ) ) * 0.1, sin( radians( random( 360 ) ) ) * 0.1 ),200, 3.25F*asteroidScale, 290 ) );
    
  }
  
  public void setScore( float s ){
    score = s;
  }
  
  public boolean hasMultiplier(){
    return hasMultiplier;
  }
  
  public int getMultiplier(){
    return multiplier;
  }
  
}

