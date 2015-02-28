
/*
  // thomas diewald
  // 
  // hilbert curve - quick and short example
  //
  // 16.11.2010
  // last updated: 16.11.2010 (thomas)
*/

int levels = 4; // recursion depth

void setup(){
  size(600,600);
}



void draw(){
  levels = mouseX/95;

  noStroke(); fill(255, 10); 
  rect(0,0, width, height);

  Vector c[] = hilbert(  new Vector(width/2, height/2, 0) , 300.0,    levels,      0, 1, 2, 3); // hilbert(center, side-length, recursion depth, start-indices)
  
  strokeWeight(width/95-levels); stroke(map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 100), 50);
  for(int i = 0; i < c.length-1; i++)
    line(c[i].x, c[i].y, c[i+1].x, c[i+1].y);
}





Vector[] hilbert( Vector c_,  float side,   int iterations,      int index_a, int index_b, int index_c, int index_d ){ 
  Vector c[] = new Vector[4];
  c[index_a] = new Vector(  c_.x - side/2,   c_.y - side/2, 0  );
  c[index_b] = new Vector(  c_.x + side/2,   c_.y - side/2, 0  );
  c[index_c] = new Vector(  c_.x + side/2,   c_.y + side/2, 0  );
  c[index_d] = new Vector(  c_.x - side/2,   c_.y + side/2, 0  );

  if( --iterations >= 0) {
    Vector tmp[] = new Vector[0];
    tmp = (Vector[]) concat(tmp, hilbert ( c[0],  side/2,   iterations,    index_a, index_d, index_c, index_b  ));
    tmp = (Vector[]) concat(tmp, hilbert ( c[1],  side/2,   iterations,    index_a, index_b, index_c, index_d  ));
    tmp = (Vector[]) concat(tmp, hilbert ( c[2],  side/2,   iterations,    index_a, index_b, index_c, index_d  ));
    tmp = (Vector[]) concat(tmp, hilbert ( c[3],  side/2,   iterations,    index_c, index_b, index_a, index_d  ));
    return tmp;
  }
  return c;
}





class Vector{
  float x, y, z;
  Vector( float x, float y, float  z){
    this.x = x; 
    this.y = y; 
    this.z = z; 
  }
}

