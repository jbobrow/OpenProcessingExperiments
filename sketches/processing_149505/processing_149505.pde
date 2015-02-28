

Monster[] monsters; 
int numMonsters = 200; 
void setup(){ 
size( 1000, 1000 ); 


  monsters = new Monster[ numMonsters ]; 


  for ( int i=0; i<numMonsters; i++ ){ 


    monsters[i] = new Monster( random(width), random(height), random(1,10) ); 


  } 


} 


  


void draw(){ 


  background( 255 ); 


  for ( int i=0; i<numMonsters; i++ ){ 


    if ( i==0 ){ 


      fill( 255, 0, 0 ); 


    } 


    else{ 


      fill( 255 ); 


    } 


    monsters[i].update(); 


    monsters[i].render(); 


  } 


  println( monsters[0].x + ", " + monsters[0].y ); 


} 


class Monster{ 


  float x; 


  float y; 


  float vx; 


  float vy; 


  float r; 


    


  Monster( float _x, float _y, float _r ){ 


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


    ellipse( x, y, r, r ); 
    ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (0);


ellipse(400, 400, 50, 50); 
colorMode(HSB);

fill (0);



ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);


  } 


} 



