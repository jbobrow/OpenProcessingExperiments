
//sketch
//copyright ben corwin 2012
float a, b, c;

void setup()
{
  size( 400, 400);
  background(0,0,0);
  noStroke();
  textSize(10);
  smooth();
  a = 0;
  b = 0;
  c = 0;
}

void draw( )
{

  fill(0,0,225);
  rect(0, 0, width, height);
  fill(225, 0, 0);
    beginShape();
      vertex(width/4 + width/4 * cos(.01 * a), height/4 + height/4 * cos(.01 * b));
      vertex(width/4 + width/4 * cos(.01 * a),0);
      vertex(0,height/4 + height/4 * cos(.01 * b));
    endShape(CLOSE);
    
    beginShape();
      vertex( 3*width/4 - width/4 * cos(.01 * a), 3*height/4 - height/4 * cos(.01 * b));
      vertex(width - (width/4 + width/4 * cos(.01 * a)),height);
      vertex(width,height - (height/4 + height/4 * cos(.01 * b)));
    endShape(CLOSE);
        
  
  a = a + .5;
  b = b + .5;
 

 
}
