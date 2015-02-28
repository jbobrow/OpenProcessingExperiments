

int angle;
int posX;
int posBaseY;



void setup() {
  angle = 0 ;
  posX = 0 ;
  posBaseY = 200 ;
  size(400,400);
  
  smooth();
  
}

void draw(){
  if( angle >= 360 ) { 
    angle=0; 
  }else{ 
    angle = angle+1; 
  }
  if( posX >= width ) { 
    posX=0; 
  }else{ 
    posX = posX +1; 
  }
  stroke( random(255), random(255), random(255) );
  point( posX , posBaseY + (cos( ( angle * PI ) / 180 ) ) *50 );
}

