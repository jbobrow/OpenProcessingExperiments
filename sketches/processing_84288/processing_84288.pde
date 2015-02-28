

int w = 400, h = 400, r_type = 0, iterations = 0;
float radius = 350;

void setup()
{

    size( 400, 400 );
    clearContext();
  
}

void mousePressed()
{
  
  r_type++;
  r_type %= 7;
  clearContext();
  
}

void clearContext()
{
  
  background( 20 );
  noFill();
  
  stroke( 0xFFFF0000 );
  strokeWeight( 5 );
  ellipse( w * .5, h * .5, radius, radius );
  
  strokeWeight( 1 );
  stroke( 0x80FFFFFF );
  
  iterations = 0;
  printLabel();
  
}

void draw()
{
  
  float random_value = 0;
  
  switch( r_type )
  {
    case 0:  
            random_value = random( 1 );   
            break;
    case 1:  
            random_value = random( 1 ) *  random( 1 );   
            break;
    case 2:  
            random_value = sqrt( random( 1 ) );   
            break;
    case 3:  
            random_value = .25 * ( random( 1 ) );
            if( random( 1 ) > .5 ) random_value = 1 - ( .25 * ( random( 1 ) ) );   
            break;
    case 4:  
            random_value = .5 * ( random( 1 ) + random( 1 ) );  
            break;
    case 5:  
            random_value = .25 * ( random( 1 ) + random( 1 ) + random( 1 ) + random( 1 ) );   
            break;
    case 6:  
            float s = random( 1 ) - random( 1 ) + random( 1 ) - random( 1 );
            if( s < 0 ) s += 4;
            random_value = .25 * s;   
            break;
  }
  
  float r = radius * random_value; 
  
  ellipse( w * .5, h * .5, r,r );
  
  iterations++;
  if( iterations > 1000 ) clearContext();
  
}

void printLabel()
{
  
  textSize(16);
  switch( r_type )
  {
    case 0:  
            text("type: random( 1 )", 10, 30);
            break;
    case 1:  
            text("type: random( 1 ) *  random( 1 )", 10, 30);
            break;
    case 2: 
            text("type: sqrt( random( 1 ) )", 10, 30);
            break;
    case 3:  
            text("type: .25 * random( 1 ) || 1 - ( .25 * ( random( 1 ) ) )", 10, 30);
            break;
    case 4:  
            text("type: .5 * ( random( 1 ) + random( 1 ) )", 10, 30); 
            break;
    case 5:  
            text("type: .25 * ( random( 1 ) + random( 1 ) + random( 1 ) + random( 1 ) )", 10, 30);
            break;
    case 6:  
            text("type: s = random( 1 ) - random( 1 ) + random( 1 ) - random( 1 )\nif( s < 0 ) s += 4\nrandom_value = .25 * s", 10, 30);
            break;
  }
}
