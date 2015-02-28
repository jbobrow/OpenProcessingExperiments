
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
      //quad 2
      //center
      vertex( 3*width/4 - width/4 * cos(.01 * a), 3*height/4 - height/4 * cos(.01 * b));
      //top left
      vertex(width/4 + width/4 * cos(.01 * a),0);
      //left top
      vertex(0,height/4 + height/4 * cos(.01 * b));
    endShape(CLOSE);
    
    beginShape();
      //quad 4
      //center
      vertex( 3*width/4 - width/4 * cos(.01 * a), 3*height/4 - height/4 * cos(.01 * b));
      //bottom right
      vertex(width - (width/4 + width/4 * cos(.01 * a)),height);
      //right bottom
      vertex(width,height - (height/4 + height/4 * cos(.01 * b)));
    endShape(CLOSE);
    
    beginShape();
      //quad 1
      //center
      vertex( 3*width/4 - width/4 * cos(.01 * a), 3*height/4 - height/4 * cos(.01 * b));
      //top right
      vertex(width - (width/4 + width/4 * cos(.01 * a)),0);
      //right top
      vertex(width,height/2 - (height/4 + height/4 * cos(PI + .01 * b)));
    endShape(CLOSE);
        
    beginShape();
      //quad 3
      //center
      vertex( 3*width/4 - width/4 * cos(.01 * a), 3*height/4 - height/4 * cos(.01 * b));
      //bottom left
      vertex(width/4 + width/4 * cos(.01 * a),height);
      //left bottom
      vertex(0,height - (height/4 + height/4 * cos(.01 * b)));
    endShape(CLOSE);
  
  a = a + .5;
  b = b + .5;
 

 
}                               
