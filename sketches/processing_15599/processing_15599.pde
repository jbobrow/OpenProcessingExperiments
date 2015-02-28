
//////////////////////////////////////////////////////////////////////////////
// DRAWING
//////////////////////////////////////////////////////////////////////////////


void drawCurve(){  
  colorMode(HSB, verts.length-1, 100, 100);
  float col = 0;
  strokeWeight(1f);
  stroke(0);
  noFill();
  beginShape(POLYGON);
    for( float[] v : verts) {
      stroke(col++, 100, 95);
      vertex(v[0], v[1], v[2]);
    }
  endShape();
  colorMode(RGB, 255, 255, 255);
}



void drawCurveExtruded(){
  lights();
  noStroke();
  
  colorMode(HSB, verts.length-1, 100, 100);
  float col = 0;
  int A_col = color(col++, 100, 100);
  
  float size = (float) (SIZE/Math.pow(2,DEPTH));
  float s_extr = size* .20f;
  float s_cube = size* .45f;
  
  for(int i = 0; i < verts.length-1; i++, col++){
    loft(verts[i], verts[i+1], s_extr, A_col, A_col=color(col, 100, 100));
  }
  
  col = 0;
  for( float[] v : verts){
    fill(col++, 100, 50);
    cube(v, s_cube);
  }
  colorMode(RGB, 255, 255, 255);
}

// only in world-axis directions!
void loft(final float[] A, final float[] B, float size, int A_col, int B_col){
  final double EPSILON = 0.0001;
  final float ax = A[0], ay = A[1], az = A[2];
  final float bx = B[0], by = B[1], bz = B[2];
  final float s = size*0.5f, so;
  
  float dir;
  if( Math.abs(dir=(A[2]-B[2])) > EPSILON ){ // extrusion at Z-AXIS
    so = dir>0 ? +s : -s;  
    beginShape(QUAD_STRIP);
    fill(A_col); vertex(ax-s, ay-s, az-so);  fill(B_col); vertex(bx-s, by-s, bz+so); 
    fill(A_col); vertex(ax+s, ay-s, az-so);  fill(B_col); vertex(bx+s, by-s, bz+so); 
    fill(A_col); vertex(ax+s, ay+s, az-so);  fill(B_col); vertex(bx+s, by+s, bz+so); 
    fill(A_col); vertex(ax-s, ay+s, az-so);  fill(B_col); vertex(bx-s, by+s, bz+so); 
    fill(A_col); vertex(ax-s, ay-s, az-so);  fill(B_col); vertex(bx-s, by-s, bz+so); 
    endShape();
  } else if ( Math.abs(dir=(A[1]-B[1])) > EPSILON ){ // extrusion at Y-AXIS
    so = dir>0 ? +s : -s;  
    beginShape(QUAD_STRIP);
    fill(A_col); vertex(ax-s, ay-so, az-s);  fill(B_col); vertex(bx-s, by+so, bz-s); 
    fill(A_col); vertex(ax+s, ay-so, az-s);  fill(B_col); vertex(bx+s, by+so, bz-s); 
    fill(A_col); vertex(ax+s, ay-so, az+s);  fill(B_col); vertex(bx+s, by+so, bz+s); 
    fill(A_col); vertex(ax-s, ay-so, az+s);  fill(B_col); vertex(bx-s, by+so, bz+s); 
    fill(A_col); vertex(ax-s, ay-so, az-s);  fill(B_col); vertex(bx-s, by+so, bz-s); 
    endShape();
  } else if ( Math.abs(dir=(A[0]-B[0])) > EPSILON ){ // extrusion at X-AXIS
    so = dir>0 ? +s : -s;  
    beginShape(QUAD_STRIP);
    fill(A_col); vertex(ax-so, ay-s, az-s);  fill(B_col); vertex(bx+so, by-s, bz-s); 
    fill(A_col); vertex(ax-so, ay+s, az-s);  fill(B_col); vertex(bx+so, by+s, bz-s); 
    fill(A_col); vertex(ax-so, ay+s, az+s);  fill(B_col); vertex(bx+so, by+s, bz+s); 
    fill(A_col); vertex(ax-so, ay-s, az+s);  fill(B_col); vertex(bx+so, by-s, bz+s); 
    fill(A_col); vertex(ax-so, ay-s, az-s);  fill(B_col); vertex(bx+so, by-s, bz-s); 
    endShape();
  }
  
}




void drawCubes(){
  colorMode(HSB, verts.length-1, 100, 100);
  noStroke();
  float s = (float) (SIZE/Math.pow(2,DEPTH)) * 2;
  float col = 0;
  for( float[] v : verts){
    fill(col++, 100, 85);
    cube(v, s);
  }
  colorMode(RGB, 255, 255, 255);
}


void cube(final float[] v, float s){
  s*=0.5f;
  final float[][]CUBE_CORNERS = 
    {
      {  v[0]-s, v[1]-s, v[2]+s  }, // 0   
      {  v[0]+s, v[1]-s, v[2]+s  }, // 1  
      {  v[0]-s, v[1]+s, v[2]+s  }, // 2   
      {  v[0]+s, v[1]+s, v[2]+s  }, // 3
      {  v[0]-s, v[1]-s, v[2]-s  }, // 4   
      {  v[0]+s, v[1]-s, v[2]-s  }, // 5  
      {  v[0]-s, v[1]+s, v[2]-s  }, // 6   
      {  v[0]+s, v[1]+s, v[2]-s  }  // 7
    };

  beginShape(TRIANGLE_STRIP);
  {
    vertex3f( CUBE_CORNERS[0] );  // 0
    vertex3f( CUBE_CORNERS[1] );  // 1
    vertex3f( CUBE_CORNERS[2] );  // 2
    vertex3f( CUBE_CORNERS[3] );  // 3
    vertex3f( CUBE_CORNERS[7] );  // 7
    vertex3f( CUBE_CORNERS[1] );  // 1
    vertex3f( CUBE_CORNERS[5] );  // 5
    vertex3f( CUBE_CORNERS[4] );  // 4
    vertex3f( CUBE_CORNERS[7] );  // 7
    vertex3f( CUBE_CORNERS[6] );  // 6
    vertex3f( CUBE_CORNERS[2] );  // 2
    vertex3f( CUBE_CORNERS[4] );  // 4
    vertex3f( CUBE_CORNERS[0] );  // 0
    vertex3f( CUBE_CORNERS[1] );  // 1 
  }
  endShape();
}


void vertex3f(final float[] v){
  vertex(v[0], v[1], v[2]);
}


