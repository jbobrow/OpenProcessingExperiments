
//Rachel Knoll by geometric patterns 1/28
//First make your background black. Then you must create a ‘grid’ of triangles 
//across the canvas in whatever way you see fit but they must be in even lines. 
//Put a circle in the center of each triangle. Fill the triangles and circle with 
//color, the same colors can be connected to create new shapes if wanted. 
//The outline of the triangles and circles should be grey — there are no other 
//color restrictions.

int g = 200;
int b = 170;
void setup() {
  background(0); 
  size(400,400);
  smooth();
  //noLoop();
}

void draw() {
  
  fill(0,20);
  rect(-20,-20,20+width, 20+height);
  translate(-450,-50);
  stroke(100);
  strokeWeight(1);
  g += 1;
  b += 1;
  if ( b >= 200)
    b = 150;
  if ( g >= 255)
    g = 200;
     float d = int( random(30,100) );
  for ( int i = 0; i < 30; i++) {
    for ( int j = 0; j < 20; j++) {
      fill(color(random(150,255),g,b));
      int r = color(255,g,b); 
      fill(r);
     
      float y = j * d;
      float x = i * d;
      triangle( x,y, x+d,y, x+d,y+d );
      fill(color(b,g,r, 30));
      ellipse( x+(d/7*5),y+(d/3)-(d/20), d/5, d/5);
    }
  }
}
                
