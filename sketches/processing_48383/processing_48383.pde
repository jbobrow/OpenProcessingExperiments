
void setup()
{
size(400, 600) ;
background(0, 225, 0) ;
smooth() ;
strokeWeight(5) ;
line(180, 0, 180, 120) ;
line(120, 0, 120, 320) ;
line(300, 0, 300, 385) ;



}

void draw()
{
fill(random(256), random(256), random(256) ) ;
ellipse( 170, 200, 175, 175 ) ;
frameRate(5) ;

fill(random(256), random(256), random(256) ) ;
ellipse( 300, 450, 125, 125 ) ;
frameRate(5) ;
  
fill(random(256), random(256), random(256) ) ;
ellipse( 120, 375, 100, 100 ) ;
frameRate(5) ;

textAlign(CENTER) ;
textSize(36) ;
text("Merry Christmas!" ,200, 550) ;
}

