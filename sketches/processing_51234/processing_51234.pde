
Point[] pts = new Point[30]; 
int count = 0;
float scalar = 100.0;
float angle = 0.0;
float speed = 0.5;
float offset = 0;
int j = 0;

class Point{
    float x;
    float y;
    Point(float _x, float _y){ 
      x = _x;
      y = _y; 
    }
}

void setup(){
    size(400, 400);
    smooth();
    frameRate(60);
}

void draw(){ 
  background(255);
  stroke(#556270);
  fill(200,0);
  beginShape();
  for(int i = 0; i<pts.length; i++){
  if(pts[i] != null) {
  vertex(pts[i].x, pts[i].y);
} 
 
}

endShape(); 

    if(count > 14){
    count = 0; 
}
    strokeWeight(1);
    float y1 = offset+sin(angle)*scalar;
    float y2 = offset+cos(angle)*scalar;
    Point newPoint = new Point(y1+width/2, y2+height/2); 
    pts[count] = newPoint;
    count++;
    angle+=speed;
    j++;
    if (j >= 300) {
      j-=300;
    }
    
    if (keyPressed == true) {
      speed /= 2;
    } else {
      speed = 10+mouseX;
    }
    



}



                                
