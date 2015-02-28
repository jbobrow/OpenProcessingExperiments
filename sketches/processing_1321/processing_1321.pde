
PolyPoints[] points;

void setup(){
  size(800, 600);
  background(0);
  smooth(); 
  translate(width/2, height/2);
  strokeWeight(.5);
  stroke(255,255,255);
  noFill();
  calculatePolygonPoints();
  drawPolygon();  
}

void calculatePolygonPoints(){
  // draw flower pedal
  float r1=200, r2=0, a=0;
  int i=0, total=90;
  float increase = (r1/2)/total;  
  ellipse(0,0,r1*2,r1*2);// show major radius
  float x=0, y=0, cosa, sina;
  float px1, px2, py1, py2;
  
  points = new PolyPoints[total+89];
  
  stroke(255,0,255);
  
  for(i=0; i<total; i++){
    a = i*PI/180;
    cosa = cos(a);
    sina = sin(a);
    r2 += increase;    
    x = r1 * sina;
    y = r1 * cosa;
    ellipse(x,y,r2*2,r2*2); // show minor radius
    // save outer poly points of r2    
    px1 = (r1+r2) * sina;
    py1 = (r1+r2) * cosa;    
    px2 = (r1-r2) * sina;
    py2 = (r1-r2) * cosa;
    points[i] = new PolyPoints(px1, py1, px2, py2);    
    // draw around the last circle
    if(i==total-1){
      int j=0;
      for(j=0; j<90; j++){
        // calc from right to left of the last circle
        a = (90+j)*PI/180;
        px1 = x + (r2 * sin(a));
        py1 = y + (r2 * cos(a));        
        // calc from left to right of the last circle
        a = (270-j)*PI/180;
        px2 = x + (r2 * sin(a));
        py2 = y + (r2 * cos(a));
        points[i+j] = new PolyPoints(px1, py1, px2, py2);    
      }
    } 
  }
}

void drawPolygon() {
  int i=0, n=points.length;
  
  PolyPoints hp;
  PolyPoints cp;
  
  strokeWeight(2);
  stroke(0,255,0);
  
  for(i=0; i<n; i++){
     if(i>0){
       hp = points[i-1];
       cp = points[i];
       line( hp.x1, hp.y1, cp.x1, cp.y1 );
       line( hp.x2, hp.y2, cp.x2, cp.y2 );
       // connect the last two
       if(i==n-1){
         line( hp.x2, hp.y2, cp.x2, cp.y2 );
       }
     }
  }
}

class PolyPoints{  
  public float x1;
  public float y1;
  public float x2;
  public float y2;  
  PolyPoints(float x1, float y1, float x2, float y2){
    this.x1 = x1;
    this.y1 = y1; 
    this.x2 = x2;
    this.y2 = y2; 
  }
}

