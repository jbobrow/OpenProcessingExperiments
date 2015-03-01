
 int diameter=50;
 
void setup(){
  
 size(600,600);
 background(0);
 }



void draw(){
  background(0);
  for( int i = 50;
  i < 600;
  i+=50 )
  { fill( 255,255,255);
    ellipse(i,mouseX,diameter,mouseY);
  }
  
}


