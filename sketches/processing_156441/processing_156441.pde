
int screenWidth = 320;
int screenHeight = 480;
float r = 0.0;
int wCount = 8;
int hCount = 7;
int rad = 80;
float twothird = 2.0/3.0;
float d, mx, my;
float speed = 1;
RotateTrixel rotrixel;

void setup() {
  size(320,480);
  rectMode( CENTER );
  rotrixel = new RotateTrixel();

}
void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  float a = atan2(mouseY-height/2, mouseX-width/2);
  rotate(a);
  rotrixel.draw();
  popMatrix();

}

class RotateTrixel {
  GridTrixel gridtrixel;
  
  RotateTrixel() {
    gridtrixel = new GridTrixel(); 
  }
  
  void draw() {
    r = r + speed;  
    d = dist(width/2, height/2, mouseX, mouseY);
    mx = d*cos(radians(-r));
    my = d*sin(radians(-r));
  
    pushMatrix();
    rotate(radians(r));
    gridtrixel.draw();
    fill(0,255,0);
    ellipse(mx,my, 10, 10);
    popMatrix();
    fill(255);
    ellipse(0, 0, 10, 10);
  }
}

class GridTrixel {
  Trixel[] trixel;
  int n = 0;
  int count;
  int angleStart = 2;
  int angleEnd = 6;  
  GridTrixel() {
    count = wCount*hCount*(angleEnd-angleStart);
    trixel = new Trixel[count];
    for(int i=0; i < hCount; i++) {
      for(int j=0; j < wCount; j++) {
        for(int k=angleStart; k < angleEnd; k++) {
          trixel[n++] = new Trixel(j, i, rad, k);  
        }
      }
    }
    
  }
  
  void draw() {
    for (int i = 0; i < count; i++) {
      trixel[i].draw();
    }
  }
}



class Trixel {
  Triangle t;
  float x1, y1, x2, y2, x3, y3;
  float radius;
  boolean inverse;
  
  XY a,b,c;
  XY centroid;

  
  Trixel(float i, float j, float r, int inv) {
      radius = r;
      x1 = (i-(wCount-1)/2)*radius;      
      y1 = (j-(hCount-twothird)/2)*(radius + radius*twothird+5.25)+radius/2+5.25;
      
      float angle = (TWO_PI / 6) * inv;
      x2 = x1 + cos( angle ) * radius;
      y2 = y1 + sin( angle ) * radius;
      
      x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
      y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
      
      a = new XY(x1,y1);
      b = new XY(x2,y2);
      c = new XY(x3,y3);
      centroid = new XY(-1,-1);
      XY bc = new XY(b.x+(c.x-b.x)/2, b.y+(c.y-b.y)/2);
      centroid.set( int(a.x+(bc.x-a.x)*twothird) , int(a.y+(bc.y-a.y)*twothird) );
      
      t = new Triangle(x1,y1,x2,y2,x3,y3); 

  }
    
  void draw() {
    
    if(checkCollision(mx,my,t)){
      fill(0);
      stroke(#00ff00);
    }
    else{
      stroke(#ff0000);
      fill(#ff6600,50);
    }
    t.drawTriangle();
    ellipse(centroid.x, centroid.y, 10, 10);
  }


  boolean checkCollision(float x, float y, Triangle t) {
    float tArea,t1Area,t2Area,t3Area;
    tArea  = triangleArea(t.point1x, t.point1y, t.point3x, t.point3y, t.point2x, t.point2y);
    t1Area = triangleArea(x,y, t.point2x, t.point2y, t.point3x, t.point3y);
    t2Area = triangleArea(x,y, t.point3x, t.point3y, t.point1x, t.point1y);
    t3Area = triangleArea(x,y, t.point2x, t.point2y, t.point1x, t.point1y);    
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


class XY
{
    float x, y;
    
    XY (float xx, float yy)
    {
        x=xx; 
        y=yy;
    }
    
    boolean inside (int xx, int yy)
    { 
        return (xx>x-5 && xx<x+5 && yy>y-5 && yy<y+5); 
    }
    
    void set ( int _x, int _y )
    {
        x=_x; 
        y=_y;
    }
}



