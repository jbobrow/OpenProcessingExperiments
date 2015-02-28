

int mainRadius = 120;
int oX,oY;
float angle;

void setup() {
  size(400,400);
  oX = 0;//width/2;
  oY = 0;//height/2;
  
  angle = random(360);
  stroke( random(55)+100,random(100)+50,random(100)+50,40 );
  strokeCap( PROJECT );
  
  noFill();
}

void draw(){

  noStroke();
  fill(200,200,200,8);
  rect(0,0,width,height);
  noFill();
  pushMatrix();
  translate( width/2, height/2);
  scale( 1+noise(random(0,0.05) ) );
  angle ++;
  if(angle>360) angle-=360; 
  float oldAngle = angle +(random(64)-36);
  float newAngle = angle-180 +(random(64)-36);

  strokeWeight( 4 );
  stroke( 0,0,0,10 );
  drawCurve( oldAngle, newAngle, mainRadius+10 );
  
  strokeWeight( 3 );
  stroke( 255,255,255,150 );
  drawCurve( oldAngle, newAngle, mainRadius );

  strokeWeight( 2 );
  stroke( random(55)+100,random(100)+50,random(100)+50,80 );
  drawCurve( oldAngle, newAngle, mainRadius-10 );
//noLoop();
  noStroke();
  fill(200,200,200,18);
  ellipse( oX,oY, 200,200 );
  fill(200,200,200,255);
 // ellipse( oX,oY, 160,160 );
  popMatrix();
  /*
    pushMatrix();
  translate( width/2.7, height/2.7 );
    
    for( int f = 60; f > 15; f-=1 ) {
        noFill();
        fill( 200,200,200,25-(f/3));
        ellipse(0,0,f*2,f*2);
    }
  popMatrix();
  */
}

void drawCurve( float oldAngle, float newAngle, float mRadius ) {
  curve(  oX+(random(mRadius)-mRadius/2), oX+(random(mRadius)-mRadius/2),
          //oX +cos(  radians(angle))*mainRadius, oY + sin(radians(angle))*mainRadius,
          oX +cos(radians(oldAngle))*mRadius, oY + sin(radians(oldAngle))*mRadius,  
          oX +cos(radians(newAngle))*mRadius, oY + sin(radians(newAngle))*mRadius, 
          oX+(random(mRadius)-mRadius/2), oX+(random(mRadius)-mRadius/2)
          //oX +cos(radians(newAngle))*mainRadius, oY + sin(radians(newAngle))*mainRadius
          );  
}
