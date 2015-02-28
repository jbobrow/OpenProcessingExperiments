
int dia;
PVector position;
PVector directionLeft;
PVector directionRight;

PVector point;

ArrayList<PVector> vectors;
ArrayList<PVector> vector2;
void setup() {  //setup function called initially, only once
  size(600, 250);
  background(255);  //set background white

  dia = 40;

  
 vectors = new ArrayList<PVector>();
 vectors.add(new PVector(55, 50, 10));
 vectors.add(new PVector(200, 100, dia));
 vectors.add(new PVector(80, 200, 60));
 vectors.add(new PVector(100, 130, dia));
 
 vectors2 = new ArrayList<PVector>();
 vectors2.add(new PVector(400, 70, dia));
 vectors2.add(new PVector(500, 100, dia));
 vectors2.add(new PVector(470, 170, dia));
 vectors2.add(new PVector(270, 180, dia));
 vectors2.add(new PVector(300, 130, dia));
 
 position = new PVector(40,40);
 //println(vectors.get(0));
 //println(vectors.size());
 
}

void drawCircle(PVector v) {
  ellipse(v.x, v.y, v.z, v.z);
}

PVector rotate2D(PVector v, float theta) {
  PVector vector = new PVector();
  vector.x = v.x*cos(theta) - v.y*sin(theta);
  vector.y = v.x*sin(theta) + v.y*cos(theta);
  vector.z = v.z;
  return vector;
}

PVector vLength(PVector v, float len) {

  PVector vector = v.get();
  float r = v.z;
  vector.z = 0;


  vector.normalize();

  vector.x = vector.x * len;
  vector.y = vector.y * len;
  vector.z = 10;
  
  return vector;
}

PVector rotateUsw(PVector p1, PVector p2, float rot, float len)
{
    PVector vec = new PVector(p2.x-p1.x,p2.y-p1.y);
    vec = rotate2D(vec, rot);
    vec = vLength(vec, len);
    vec.add(p1);
    return vec;
}

int getFactor(PVector p1, PVector p2, PVector triCenter)
{  
    PVector a = rotateUsw(p1, triCenter, radians(-90), p1.z/2);  
    PVector b = rotateUsw(p1, triCenter, radians(90), p1.z/2);  
    
    PVector v12 = new PVector(p1.x+(p2.x-p1.x)/2, p1.y+(p2.y-p1.y)/2);
    
    
    //println("a:"+intersect(v12.x, v12.y, triCenter.x, triCenter.y, a.x, a.y, p2.x, p2.y));
    //println("b:"+ intersect(v12.x, v12.y, triCenter.x, triCenter.y, b.x, b.y, p2.x, p2.y));
    
    int factor = 1; 
    if (intersect(v12.x, v12.y, triCenter.x, triCenter.y, a.x, a.y, p2.x, p2.y))
    {
        factor = -1;
    }
    return factor;
}

void drawVectors(ArrayList<PVector> vectors)
{
  PVector triCenter = new PVector();
  
  for (int i = 0; i < vectors.size(); i++) {

      triCenter.x += vectors.get(i).x;
      triCenter.y += vectors.get(i).y;
  }
  
  triCenter.x = triCenter.x/vectors.size();
  triCenter.y = triCenter.y/vectors.size(); 
  triCenter.z = 5;

    
    
    
  drawCircle(triCenter); 

  for (int i = 0; i < vectors.size(); i++) {
      
      PVector v1 = vectors.get(i);
      
      int i2 = (i+1==vectors.size())?0:i+1;

      PVector v2 = vectors.get(i2);
      
      drawCircle(v1);  
      
      factor = getFactor(v1,v2,triCenter);
      
      PVector vec1 = rotateUsw(v1, v2, radians(-90*factor), v1.z/2);  
      line(v1.x, v1.y, vec1.x, vec1.y);
      
      PVector vec2 = rotateUsw(v2, v1, radians(90*factor), v2.z/2);  
      line(v2.x, v2.y, vec2.x, vec2.y);
      
      line(vec1.x, vec1.y, vec2.x, vec2.y);
      
      
      line(v1.x, v1.y, v2.x, v2.y); 
      
      
      PVector point1 = getDistance( vec1.x, vec1.y, vec2.x, vec2.y, position.x, position.y );
      PVector circ1 = getDistanceToCircle(v1, position.x, position.y);
      
      if (point1.z<point.z)  
      {
          point = point1;
      }
 
      if (circ1.z<point.z)  
      {
          point = circ1;
      }

   }
}


void draw() {  //draw function loops 
  //noStroke();
  background(255);  //set background white
  fill(0,100,100,125);
  
  if (mousePressed == true) {
     position = new PVector(mouseX, mouseY);
  }
 //vectors.set(0, new PVector(mouseX, mouseY, 10));
  
  
 
  
  
  point = new PVector(0,0,10000);
  
  drawVectors(vectors);
  drawVectors(vectors2);
   
  point.z = 5;

  drawCircle(point);  
  //line(point.x, point.y, mouseX, mouseY);
  
  
  //PVector player = new PVector( position.x-point.x, position.y-point.y);
  PVector player = new PVector(point.x-position.x, point.y-position.y);
  
  player = vLength(player, 10);
  player.add(position);
  player.z = 20;
  //line(point.x, point.y, player.x, player.y);
  //line(position.x, position.y, player.x, player.y);

  
  directionRight = rotateUsw(player, point, radians(-90), 4);  
  directionLeft = rotateUsw(player, point, radians(90), 4);  

  



  position.z = 10;  
  drawCircle(position);  

  float dist = distance(player, point);

  if (dist>10)
  {
      position = player;
  }
  else
  {
    player = new PVector( position.x-point.x, position.y-point.y);
  
    player = vLength(player, 10);
    player.add(point);
    player.z = 20;


    
    directionRight = rotateUsw(player, point, radians(-90), 4);  
    directionLeft = rotateUsw(player, point, radians(90), 4);  
    
  }
  
    line(position.x, position.y, player.x, player.y);
    //line(point.x, point.y, player.x, player.y);
    line(player.x, player.y, directionRight.x, directionRight.y);
    drawCircle(player);  

  
  if (keyPressed == true) 
  {
      if (keyCode == 37) {
          position = directionLeft;

      } else if (keyCode == 39) {
          position = directionRight;
      } else if (keyCode == 38) {
      
          player = new PVector( position.x-point.x, position.y-point.y);
  
          player = vLength(player, 16);
          player.add(position);
          player.z = 20;
          position = player;  
      }
      
      //println(keyCode);
  }
  //position = direction2;
  
}

float distance(PVector p1, PVector p2)
{
  float dx = p1.x - p2.x; 
  float dy = p1.y - p2.y; 
  return sqrt( dx*dx + dy*dy ); 
}


PVector getDistanceToCircle(PVector circle, float mX, float mY)
{
   //println(p1+" : "+mX+" : "+mY);
   PVector circ1 = new PVector(mX-circle.x,mY-circle.y);
   circ1 = vLength(circ1, circle.z/2);
   
   circ1.add(circle);

   float dx = (mX-circ1.x);
   float dy = (mY-circ1.y);

   circ1.z = sqrt( dx*dx + dy*dy ); 
   return circ1;
}

boolean intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){

  float a1, a2, b1, b2, c1, c2;
  float r1, r2 , r3, r4;
  float denom, offset, num;

  // Compute a1, b1, c1, where line joining points 1 and 2
  // is "a1 x + b1 y + c1 = 0".
  a1 = y2 - y1;
  b1 = x1 - x2;
  c1 = (x2 * y1) - (x1 * y2);

  // Compute r3 and r4.
  r3 = ((a1 * x3) + (b1 * y3) + c1);
  r4 = ((a1 * x4) + (b1 * y4) + c1);

  // Check signs of r3 and r4. If both point 3 and point 4 lie on
  // same side of line 1, the line segments do not intersect.
  if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)){
    return false;
  }

  // Compute a2, b2, c2
  a2 = y4 - y3;
  b2 = x3 - x4;
  c2 = (x4 * y3) - (x3 * y4);

  // Compute r1 and r2
  r1 = (a2 * x1) + (b2 * y1) + c2;
  r2 = (a2 * x2) + (b2 * y2) + c2;

  // Check signs of r1 and r2. If both point 1 and point 2 lie
  // on same side of second line segment, the line segments do
  // not intersect.
  if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))){
    return false;
  }

  //Line segments intersect: compute intersection point.
  denom = (a1 * b2) - (a2 * b1);

  if (denom == 0) {
    return true;
  }

  if (denom < 0){ 
    offset = -denom / 2; 
  } 
  else {
    offset = denom / 2 ;
  }

  // The denom/2 is to get rounding instead of truncating. It
  // is added or subtracted to the numerator, depending upon the
  // sign of the numerator.
  num = (b1 * c2) - (b2 * c1);
  if (num < 0){
    x = (num - offset) / denom;
  } 
  else {
    x = (num + offset) / denom;
  }

  num = (a2 * c1) - (a1 * c2);
  if (num < 0){
    y = ( num - offset) / denom;
  } 
  else {
    y = (num + offset) / denom;
  }

  // lines_intersect
  return true;
}

boolean same_sign(float a, float b){

  return (( a * b) >= 0);
}

/**
 * Returns a point on the line (x1,y1) -> (x2,y2) 
 * that is closest to the point (x,y)
 * 
 * The result is a PVector. 
 * result.x and result.y are points on the line. 
 * The result.z variable contains the distance from (x,y) to the line, 
 * just in case you need it :) 
 */
PVector getDistance( float x1, float y1, float x2, float y2, float x, float y ){
  PVector result = new PVector(); 
  
  float dx = x2 - x1; 
  float dy = y2 - y1; 
  float d = sqrt( dx*dx + dy*dy ); 
  float ca = dx/d; // cosine
  float sa = dy/d; // sine 
  
  float mX = (-x1+x)*ca + (-y1+y)*sa; 
  
  if( mX <= 0 ){
    result.x = x1; 
    result.y = y1; 
  }
  else if( mX >= d ){
    result.x = x2; 
    result.y = y2; 
  }
  else{
    result.x = x1 + mX*ca; 
    result.y = y1 + mX*sa; 
  }
  
  dx = x - result.x; 
  dy = y - result.y; 
  result.z = sqrt( dx*dx + dy*dy ); 
  
  return result;   
}
