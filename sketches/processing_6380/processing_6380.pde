
Triangle t;

void setup() {
  size(300,300);
  t = new Triangle(width/2,height/4,width-width/4,height-height/4,width/4,height-height/4);
}

void draw() {
  background(0);
  t.drawTriangle();
  if(checkCollision(mouseX,mouseY,t)){
    fill(0);
    stroke(#00ff00);
  }
  else{
    noStroke();
  }
}



class Triangle {
  float point1x;
  float point1y;
  float point2x;
  float point2y;
  float point3x;
  float point3y;
  
  Triangle(float point1x,float point1y,float point2x,float point2y,float point3x,float point3y){
  this.point1x = point1x;
  this.point1y = point1y;
  this.point2x = point2x;
  this.point2y = point2y;
  this.point3x = point3x;
  this.point3y = point3y;        
  }
  
  void drawTriangle() {
    triangle(point1x, point1y, point2x, point2y, point3x, point3y);
  }
}

boolean checkCollision(float x, float y, Triangle t) {
  float tArea,t1Area,t2Area,t3Area;
  tArea  = triangleArea(t.point1x, t.point1y, t.point3x, t.point3y, t.point2x, t.point2y);
  t1Area = triangleArea(x,y, t.point2x, t.point2y, t.point3x, t.point3y);
  t2Area = triangleArea(x,y, t.point3x, t.point3y, t.point1x, t.point1y);
  t3Area = triangleArea(x,y, t.point2x, t.point2y, t.point1x, t.point1y);
  noStroke();
  fill(#ff6600,50);
  triangle(t.point1x, t.point1y, t.point3x, t.point3y, t.point2x, t.point2y);
  fill(#ffff00,50);
  triangle(x,y, t.point2x, t.point2y, t.point3x, t.point3y);
  fill(#00ffff,50);
  triangle(x,y, t.point3x, t.point3y, t.point1x, t.point1y);
  fill(#ff0000,50);
  triangle(x,y, t.point2x, t.point2y, t.point1x, t.point1y);
  
  float totalArea = t1Area+t2Area+t3Area;
  return (totalArea == tArea);
}

float triangleArea(float p1, float p2, float p3, float p4, float p5, float p6) {
  float a,b,c,d;
  a = p1 - p5;
  b = p2 - p6;
  c = p3 - p5;
  d = p4 - p6;
  return (0.5* abs((a*d)-(b*c)));
}

