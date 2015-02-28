


void setup (){
  size(400,400);
  background(9,36,183);
  noFill();
  smooth();
  
  fill(200,200,30,255);
  ellipse(200,200,340,340);
  fill(5,44,157,255);
  ellipse(200,200,100,100);
  noStroke();
  noFill();
  makePoly(3, width/2,height/2,6,150,255,8,MITER);
  rect(20,20, 360,360);
}



void makePoly(int geom, int x, int y, int points,float radius, 
  int strokeCol, float strokeWt, int strokeJn){
  int geomPicker = int(random(1,geom));
  if(geomPicker == 1){
  float px=0, py=0;
  float angle = 0;
  stroke(strokeCol);
  strokeJoin(strokeJn);
  strokeWeight(strokeWt);
  beginShape();
  
  for(int i=0; i<points; i++){
    px = x+cos(radians(angle))*radius;
    py = y+sin(radians(angle))*radius;
    vertex(px,py);
    angle+=360/points;
  }
  endShape(CLOSE);
  
  if(geomPicker == 2){
     float pxx=2, pyy=3;
  float angle2 = 0;
  stroke(strokeCol);
  strokeJoin(strokeJn);
  strokeWeight(strokeWt);
  beginShape();
  
  for(int i=0; i<points; i++){
    px = x+cos(radians(angle))*radius;
    py = y+sin(radians(angle))*radius;
    vertex(pxx,pyy);
    angle+=360/points;
  }
  endShape(CLOSE);
  }
  }
  }


