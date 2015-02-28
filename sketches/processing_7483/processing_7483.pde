
class JigglyTriangle {
 
  /** the rate at which the triangle's verts move **/
  float jiggleRate;
  
  // the bounding box around the triangle
  /** the maximum width of the bounding box **/
  float maxW;
  /** the maximum height of the bounding box **/
  float maxH;
  
  /** x noise values **/
  float[] x;
  /** y noise values **/
  float[] y;
  
  /** the color of the triangle **/
  color col;
  
  /** default constructor **/
  JigglyTriangle() {
    this( random(.1), 300, 300, color( random( 255 ), 255, random( 255 ), 50 ) ); 
  }
  
  /**
  *   Custom constructor
  **/
  JigglyTriangle( float jiggleRate, float maxW, float maxH, color col ) {
    this.jiggleRate = jiggleRate;
    this.maxW = maxW;
    this.maxH = maxH;
    this.col = col;
    x = new float[3];
    y = new float[3];
    for( int i = 0; i < 3; i++ ) {
      x[i] = random(2);
      y[i] = random(1);
    }
  }
  
  /**
   *  Updates the noise values for all coordinates
   **/
  void jiggle() {
    for( int i = 0; i < 3; i++ ) {
      x[i] += jiggleRate ;
      y[i] += jiggleRate ;
    }
  }
  
  /**
   *  Displays the triangle
   **/
  void display() {
    pushStyle();
    stroke( col );
    fill( col );
    triangle( 
      noise(x[0])*maxW, 
      noise(y[0])*maxH, 
      noise(x[1])*maxW, 
      noise(y[1])*maxH, 
      noise(x[2])*maxW, 
      noise(y[2])*maxH ); 
    popStyle();
  }
  
}

