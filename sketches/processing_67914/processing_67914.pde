
Trixel[] trixel;
int n = 0;
int count;
int wCount = 4;
int hCount = 3;
int tv = 4;
float px=0.0,py=0.0;


void setup() {
  size(320,480);
  count = wCount*hCount*tv;
  trixel = new Trixel[count];
  for(int i=0; i<hCount; i++) {
    for(int j=0; j<wCount; j++) {
      for(int k=0; k<tv; k++) {
        trixel[n++] = new Trixel(j, i, k);  
      }
    }
  }
}

void draw() {
  background(255);
  
  px = mouseX - width/2;
  py = mouseY - height/2;
  
  pushMatrix();
  //translate(width/2,height/2);
  //rotate(radians(mouseX));
  for (int i = 0; i < count; i++) {
    trixel[i].draw(px,py);
  }
  popMatrix();
  stroke(255);
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
}


class Trixel {
  float x1, y1, x2, y2, x3, y3;
  float x, y;
  float mx,my;
  int v;

  float s = 140; 
  float h = 0.5 * sqrt(3) * s; 
  float radius = sqrt(3)/3 * s;
  float angle = (TWO_PI / 6) * 2;
  
  Trixel(float tx, float ty, int inv) {
    v = inv;
    if(v == 0) {
      x = s/2     + tx*s;
      y = radius  + ty*h*2; 
    }
    if(v == 1) {
      x = s/2     + tx*s;
      y = radius  + ty*h*2 + radius;  
    }
    if(v == 2) {
      x = tx*s;
      y = h+radius + ty*h*2; 
    }
    if(v == 3) {
      x = tx*s;
      y = h/3 + ty*h*2; 
    }
    x = x  + width/2    - wCount*s/2        + s/2;
    y = y  + height/2  - (hCount+1)*radius  - h/3;
    
    x1 = 0;
    y1 = -radius;
      
    x2 = x1 + cos( angle ) * s;
    y2 = y1 + sin( angle ) * s;
    
    x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
    y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
  }
  void draw(float spX, float spY) {
    x -= spX/100;
    y -= spY/100;
    
    if(x>width+s) {
      x = x - s*wCount;
    }
    
    if(x<-s) {
      x = x + s*wCount;
    }
    
    if(y>height+h) {
      y = y - h*(hCount+3);
    }
    
    if(y<-h) {
      y = y + h*(hCount+3);
    }
    
    mx = mouseX - x;
    my = mouseY - y;
    
    stroke(255, 204, 0);
    strokeWeight(1);
    if(checkCollision(mx,my)){
      fill(255,0,0);
    } else {
      fill(0, 128);  
    }

    
    pushMatrix();
    translate(x, y); 
    if(v == 1 || v == 3) {
      rotate(radians(180));
    }  
    triangle(x1, y1, x2, y2, x3, y3);
    popMatrix();
  }
  
  
  boolean checkCollision(float cx, float cy) {
    float tArea,t1Area,t2Area,t3Area;
    tArea  = triangleArea(x1,y1,x3,y3,x2,y2);
    t1Area = triangleArea(cx,cy,x2,y2,x3,y3);
    t2Area = triangleArea(cx,cy,x3,y3,x1,y1);
    t3Area = triangleArea(cx,cy,x2,y2,x1,y1);    
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
