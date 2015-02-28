
int k = 1;
int j = 1;
float t;
float p;

float R=125; 


float centerR=125; 


float a=PI/2; 


float a1=PI; 


float a2=3*PI/2; 


float pathR=125; 


float pathG=125; 


float G=125; 


float centerG=125; 


float pathB=125; 


float B=125; 


float centerB=125; 


Ball[] balls; 
int numBalls = 200; 

void setup(){ 
size( 1000, 1000 ); 
balls = new Ball[ numBalls ]; 
for ( int i=0; i<numBalls; i++ ){ 
balls[i] = new Ball( random(width), random(height), random(1,10) ); 
} 
} 


  


void draw(){ 


  background( 255, 200, 200 ); 


  for ( int i=0; i<numBalls; i++ ){ 


    if ( i==0 ){ 


      
      fill (pathR,pathG,pathB);
pathR=centerR+R*sin(a); 
a=a+.03; 
pathG=centerG+G*sin(a1); 
a1=a1+.03; 
pathB=centerB+B*sin(a2); 
a2=a2+.03; 


    } 


    else{ 


      fill( 255 ); 


    } 


    balls[i].update(); 


    balls[i].render(); 


  } 


  println( balls[0].x + ", " + balls[0].y ); 


} 


class Ball{ 


  float x; 


  float y; 


  float vx; 


  float vy; 


  float r; 


    


  Ball( float _x, float _y, float _r ){ 


    x = _x; 


    y = _y; 


    vx = random( 5 ); 


    vy = random( 5 ); 


    r = _r; 


  } 


    


  void update(){ 


    x += vx; 


    y += vy; 


      


    vy += 0.1; 


    //vx *= 0.99; 


    //vy *= 0.99; 


      


    if ( x < 0 || x > width ){ 


      vx *= -1; 


      if ( x<0 ) x = 0; 


      else if ( x>width ) x = width; 


    } 


    if ( y < 0 || y > height ){ 


      vy *= -1; 


      if ( y<0 ) y = 0; 


      else if ( y>height ) y = height; 


    } 


      


  } 


    


  void render(){ 


    stroke(0); 


    ellipse( x+100, y+100, r+125, r+100 ); 
    ellipse( x+62.75, y+50, r+25, r+25);
    ellipse( x+137.5, y+50, r+25, r+25);
    ellipse( x+100, y+100, r+25, r+25);
    ellipse( x+100, y+100, r+12.5, r+12.5);
    ellipse(x+100, y+100, r+12.5, r+12.5);
    ellipse(x+75, y+150, r+12.5, r+25);
    ellipse(x+125, y+150, r+12.5, r+25);


  } 


} 



