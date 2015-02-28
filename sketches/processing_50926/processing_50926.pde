
int curTime;
int prevTime;
float deltaTime;

PFont eyeFont;
String eyeText = "SARIF";
int fontSize = 24;
color backgroundColor = color( 63 );

PVector normalizedMousePos = new PVector();

Eye leftEye;
Eye rightEye;


class Eye
{
  PVector centerPos;
  float diameter;
  float curLookDistance;
  PVector curLookOffset;
  float glassesFactor;
  boolean glasses;
  
  boolean flipped;
  
  Eye( float x, float y, float corneaDiameter, boolean flip )
  {
    centerPos = new PVector( x, y );
    diameter = corneaDiameter;
    flipped = flip;
    curLookDistance = 0.0f;
    curLookOffset = new PVector( 0.0f, 0.0f );
    glassesFactor = 0.0f;
    glasses = false;
  }
  
  public void Update()
  {
    float newLookDistance = map( PVector.dist( centerPos, new PVector( mouseX, mouseY ) ), 0, width, -1, 1 );
    curLookDistance += ( newLookDistance - curLookDistance ) * deltaTime;
    
    PVector newLookOffset = PVector.sub( new PVector( mouseX, mouseY ), centerPos );
    newLookOffset.x = constrain( map( newLookOffset.x, -width/2, width/2, -1, 1 ), -1, 1 );
    newLookOffset.y = constrain( map( newLookOffset.y, -height/2, height/2, -1, 1 ), -1, 1 );
    curLookOffset.add( PVector.mult( PVector.sub(newLookOffset, curLookOffset), deltaTime ) );
    
    if( glasses && glassesFactor < 1.0f )
    {
      glassesFactor += deltaTime * 20;
      if( glassesFactor > 1.0f )
        glassesFactor = 1.0f;
    }
    else if( !glasses && glassesFactor > 0.0f )
    {
      glassesFactor -= deltaTime * 20;
      if( glassesFactor < 0.0f )
        glassesFactor = 0.0f;
    }
  }
  
  public void Render()
  {
    drawEye();
  }
  
  private void drawEye()
  {
    pushMatrix();
    
    // Sclera ring
    translate( diameter/4 * curLookOffset.x, diameter/4 * curLookOffset.y );
    noFill();
    stroke( 0 );
    strokeWeight( diameter/128 );
    ellipse( centerPos.x, centerPos.y, diameter*1.5f, diameter*1.5f );
    
    // Cornea trim
    pushMatrix();
    translate( diameter/32 * curLookOffset.x, diameter/32 * curLookOffset.y );
    noStroke();
    fill( 0 );
    ellipse( centerPos.x, centerPos.y, diameter, diameter );
    
    fill( #6F6235 );
    arc( centerPos.x, centerPos.y, diameter - (diameter/16), diameter - (diameter/16), radians(-45 + (180*curLookDistance)), radians(45 + (180*curLookDistance)) );
    arc( centerPos.x, centerPos.y, diameter - (diameter/16), diameter - (diameter/16), radians(135 + (180*curLookDistance)), radians(225 + (180*curLookDistance)) );
    
    // Outer cornea base
    fill( #5A511A );
    ellipse( centerPos.x, centerPos.y, diameter - (diameter/8), diameter - (diameter/8) );
    
    // Lettered cornea ring
    translate( diameter/32 * curLookOffset.x, diameter/32 * curLookOffset.y );
    fill( #FFFF96 );
    ellipse( centerPos.x, centerPos.y, diameter - (diameter/4), diameter - (diameter/4) );
    
    float arcLength = 0.0f;
    float arcRadius = diameter/2.7f;
    
    pushMatrix();
    translate( centerPos.x, centerPos.y );
    rotate( radians((-45*curLookDistance) + 45) );
    for( int i = 0; i < eyeText.length(); i++ )
    {
      float typeScale = diameter / fontSize / 16;
      if( i == 0 || i == eyeText.length() - 1 )
        typeScale *= 1.5;
      
      char currentChar = eyeText.charAt( i );
      float charWidth = textWidth( currentChar );
      arcLength -= charWidth/2 * typeScale;
      float theta = PI + (arcLength/arcRadius);
      
      pushMatrix();
      translate( arcRadius * cos(theta), arcRadius * sin(theta) );
      rotate( theta - PI/2 );
      scale( typeScale );
      fill( 0 );
      text( currentChar, 0, 0 );
      popMatrix();
      
      arcLength -=  charWidth/2 * typeScale;
    }
    popMatrix();
    
    // Inner cornea base
    fill( #5A511A );
    ellipse( centerPos.x, centerPos.y, diameter - (diameter/2.5f), diameter - (diameter/2.5f) );
    
    // Pupil trim
    translate( diameter/32 * curLookOffset.x, diameter/32 * curLookOffset.y );
    fill( #F4EBB2 );
    ellipse( centerPos.x, centerPos.y, diameter/2.5f, diameter/2.5f );
    
    // Pupil
    fill( 0 );
    arc( centerPos.x, centerPos.y, diameter/2.5f, diameter/2.5f, radians(45 + (90*curLookDistance)), radians(75 + (90*curLookDistance)) );
    ellipse( centerPos.x, centerPos.y, diameter/2.666f, diameter/2.666f );
    
    popMatrix();
    
    // Specular
    translate( -diameter/32 * curLookOffset.x, -diameter/32 * curLookOffset.y );
    fill( 255, 191 );
    ellipse( centerPos.x + (diameter/8), centerPos.y - (diameter/16), diameter/16, diameter/16 );
    ellipse( centerPos.x - (diameter/4), centerPos.y + (diameter/8), diameter/16, diameter/8 );
    fill( 255, 127 );
    ellipse( centerPos.x + (diameter/8), centerPos.y + (diameter/4), diameter/8, diameter/16 );
    
    popMatrix();
    
    
    // Eyelid
    fill( backgroundColor );
    float flip = 1.0f;
    if( flipped )
      flip = -1.0f;
    beginShape();
    vertex( centerPos.x - (diameter*flip),        centerPos.y );
    vertex( centerPos.x - (diameter*0.75f*flip),  centerPos.y - (diameter/6) );
    vertex( centerPos.x - (diameter/2*flip),      centerPos.y - (diameter/4) );
    vertex( centerPos.x,                          centerPos.y - (diameter/3) );
    vertex( centerPos.x + (diameter/2*flip),      centerPos.y - (diameter/4) );
    vertex( centerPos.x + (diameter*0.875f*flip), centerPos.y );
    vertex( centerPos.x + (diameter*flip),        centerPos.y + (diameter/3) );
    vertex( centerPos.x + (diameter*0.95f*flip),  centerPos.y + (diameter*0.375f) );
    vertex( centerPos.x + (diameter*0.875f*flip), centerPos.y + (diameter/3) );
    vertex( centerPos.x - (diameter/4*flip),      centerPos.y + (diameter/3) );
    vertex( centerPos.x - (diameter/2*flip),      centerPos.y + (diameter/4) );
    vertex( centerPos.x - (diameter*flip),        centerPos.y );
    vertex( centerPos.x - (diameter*flip),        centerPos.y - diameter );
    vertex( centerPos.x - (diameter*flip),        centerPos.y + diameter );
    vertex( centerPos.x + (diameter*flip),        centerPos.y + diameter );
    vertex( centerPos.x + (diameter*flip),        centerPos.y - diameter );
    vertex( centerPos.x - (diameter*flip),        centerPos.y - diameter );
    endShape( CLOSE );
    
    
    // Glasses
    PVector orig = new PVector( centerPos.x - (diameter*1.25f*flip), centerPos.y - (diameter/3) );
    fill( 31, 250 );
    beginShape();
    vertex( orig.x + (diameter/8*flip), orig.y - (diameter/6) );
    vertex( orig.x - (diameter/16*flip), orig.y );
    vertex( orig.x - (diameter/16*flip), orig.y + (diameter/3) );
    vertex( orig.x + (diameter/8*flip), orig.y + (diameter*0.666f) );
    vertex( orig.x + (diameter*0.666f*flip), orig.y + diameter );
    /**/vertex( orig.x + (diameter*flip), orig.y + (diameter*1.125f) );
    vertex( orig.x + (diameter*flip) + (glassesFactor*diameter*flip), orig.y + (diameter*1.125f) );
    vertex( orig.x + (diameter*0.666f*flip) + (glassesFactor*diameter*2*flip), orig.y + diameter );
    vertex( orig.x + (diameter/8*flip) + (glassesFactor*diameter*2.75f*flip), orig.y + (diameter*0.666f) );
    vertex( orig.x - (diameter/16*flip) + (glassesFactor*diameter*3*flip), orig.y + (diameter/3) );
    vertex( orig.x - (diameter/16*flip) + (glassesFactor*diameter*2.75f*flip), orig.y );
    vertex( orig.x + (diameter/8*flip) + (glassesFactor*diameter*2*flip), orig.y - (diameter/7) );
    endShape( CLOSE );
    
    // Glasses frame
    fill( 0 );
    beginShape();
    vertex( orig.x, orig.y );
    vertex( orig.x, orig.y + (diameter/3) );
    vertex( orig.x + (diameter/4*flip), orig.y + (diameter*0.666f) );
    vertex( orig.x + (diameter*0.75f*flip), orig.y + diameter );
    vertex( orig.x + (diameter*1.25f*flip), orig.y + (diameter*1.125f) );
    vertex( orig.x + (diameter*1.125f*flip), orig.y + (diameter*1.25f) );
    vertex( orig.x + (diameter*0.9f*flip), orig.y + (diameter*1.25f) );
    vertex( orig.x + (diameter*0.75f*flip), orig.y + (diameter*1.125f) );
    vertex( orig.x + (diameter/16*flip), orig.y + (diameter*0.75f) );
    vertex( orig.x - (diameter/4*flip), orig.y + (diameter/2) );
    vertex( orig.x - (diameter/3*flip), orig.y + (diameter/4) );
    vertex( orig.x - (diameter/4*flip), orig.y - (diameter/16) );
    vertex( orig.x, orig.y - (diameter/8) );
    vertex( orig.x + (diameter/4*flip), orig.y - (diameter/4) );
    vertex( orig.x + (diameter/3*flip), orig.y - (diameter/3) );
    vertex( orig.x + (diameter/2*flip), orig.y - (diameter*0.4f) );
    vertex( orig.x + (diameter*0.55f*flip), orig.y - (diameter/4) );
    vertex( orig.x + (diameter/2*flip), orig.y - (diameter/8) );
    vertex( orig.x + (diameter/3*flip), orig.y - (diameter/7) );
    vertex( orig.x + (diameter/4*flip), orig.y - (diameter/7) );
    endShape( CLOSE );
  }
  
  void EnableGlasses()
  {
    glasses = true;
  }
  
  void DisableGlasses()
  {
    glasses = false;
  }
}


void setup()
{
  size( 900, 400 );
  smooth();
  
  curTime = 0;
  prevTime = 0;
  deltaTime = 0;
  
  eyeFont = loadFont( "BookAntiqua-Bold-24.vlw" );
  textFont( eyeFont );
  textAlign( CENTER );
  
  leftEye = new Eye( 210, 200, 128, false );
  rightEye = new Eye( 690, 200, 128, true );
}

void draw()
{
  Update();
  Render();
}

void Update()
{
  prevTime = curTime;
  curTime = millis();
  deltaTime = ( curTime - prevTime ) / 1000.0f;
  
  normalizedMousePos.x = map( mouseX, 0, width, -1, 1 );
  normalizedMousePos.y = map( mouseY, 0, height, -1, 1 );
  
  if( ( mouseX > 210 - 128 ) && ( mouseX < 690 + 128 ) && ( mouseY > 200 - 128 ) && ( mouseY < 200 + 128 ) )
  {
    leftEye.EnableGlasses();
    rightEye.EnableGlasses();
  }
  else
  {
    leftEye.DisableGlasses();
    rightEye.DisableGlasses();
  }
  
  leftEye.Update();
  rightEye.Update();
}

void Render()
{
  background( backgroundColor );
  
  leftEye.Render();
  rightEye.Render();
}


