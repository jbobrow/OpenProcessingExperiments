
float circleX;
float circleY;

void setup() {
size(500, 500);
background(#E8EAEA);
stroke(#B49EB4);
strokeWeight(.25);
fill(255);
circleX = width * 0.5;
circleY = height * 0.5;
}

int resolution = 50;
float radius = 100;


void draw(){
  
  resolution=mouseX;
  radius=mouseY*0.5;
  
  beginShape();
  for ( int i=0; i<resolution; i=i+1 ) {
    
    float waveAngle = map( i, 0, resolution, 0, TWO_PI*20 );
    float waveOffset = sin(waveAngle) * 100;
     
    float angle = map( i, 0, resolution, 0, TWO_PI ); //0 to TWO_PI is 0 to 360 degrees
    float circleOffX = cos(angle) * (radius + waveOffset); //x offset from circle center
    float circleOffY = sin(angle) * (radius + waveOffset); //y offset from circle center
    
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;
    
    vertex( x,y );
  }
  endShape(CLOSE);
  
  
  
  stroke(#A535A5);
  fill(#D9FAF8);
  
  beginShape();
  for ( int i=0; i<resolution; i=i+1 ) {
    
    float waveAngle = map( i, 0, resolution, 0, TWO_PI*10 );
    float waveOffset = sin(waveAngle) * 50;
     
    float angle = map( i, 0, resolution, 0, TWO_PI ); //0 to TWO_PI is 0 to 360 degrees
    float circleOffX = cos(angle) * (radius + waveOffset); //x offset from circle center
    float circleOffY = sin(angle) * (radius + waveOffset); //y offset from circle center
    
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;
    
    vertex( x,y );
  }
  endShape(CLOSE);
  
  //radius = 175;
  
  stroke(#A535A5);
  fill(#CBD8D8);
  
  beginShape();
  for ( int i=0; i<resolution; i=i+1 ) {
    
    float waveAngle = map( i, 0, resolution, 0, TWO_PI*100 );
    float waveOffset = sin(waveAngle) * 80;
     
    float angle = map( i, 0, resolution, 0, TWO_PI ); //0 to TWO_PI is 0 to 360 degrees
    float circleOffX = cos(angle) * (radius + waveOffset); //x offset from circle center
    float circleOffY = sin(angle) * (radius + waveOffset); //y offset from circle center
    
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;
    
    vertex( x,y );
  }
  endShape(CLOSE);
}

