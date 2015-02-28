
0000import gifAnimation.*;
boolean gifbool = false;
GifMaker gifExport;

float t = 0;

float x, y;
float easeX, easeY;

int taa = 100;
float easing = 0.0004;

int overtonesY = 1;
int overtonesX = 2;

void setup(){
  
  size( 500, 500, P2D );
  //size(displayWidth, displayHeight, P2D);
  frameRate(30);
  
  strokeWeight(1);
  stroke(255);
  background(0);
  
  mouseX = width/2;
  mouseY = height*4/5;

 if( gifbool ){
  gifExport = new GifMaker(this, "export"+year()+month()+day()+hour()+minute()+second()+".gif");
  gifExport.setRepeat(0);  
 }
  
}

void draw(){
  
  //background(0);
  
  fill(0,100);
  noStroke();
  rect(0,0,width,height);
  
  stroke(255);
  for( int f=0; f<taa; f++){
    
    float targetX = mouseX;
    float dx = targetX - easeX;
    if(abs(dx) != 0) {
      easeX += dx * easing;
    }
    
    float targetY = mouseY;
    float dy = targetY - easeY;
    if(abs(dy) != 0) {
      easeY += dy * easing;
    }
    
    x=0;
    for( float i=1; i<overtonesX+1; i++){
      x += cos(t*(i*2-1))/(i*2-1);
    } 
    
    y = sin(t);
    
    stroke(255);
    point( x*100 + width/2, y*100 + height/2 ); 
    
    t+= easeY*10000000;
  }
  
  /*point( mouseX, mouseY );
  point( easeX, easeY );*/
  
  println(frameRate);
  /*println( x +", "+ y );
  println( x +", "+ y );*/
  
  /* gif */ if( gifbool ){ gifExport.setDelay(1000/30); gifExport.addFrame(); }
}





//boolean sketchFullScreen() { return true; }

void keyPressed() {
  
  if( key == 'w' ){  overtonesX++; }
  if( key == 's' && overtonesX > 1){  overtonesX--;  }
  
  if( key == 'e' ){  overtonesY++; }
  if( key == 'd' && overtonesY > 1){  overtonesY--;  }
  
  if( key == 'g' ){
    gifExport.finish();  
  }
  
}


