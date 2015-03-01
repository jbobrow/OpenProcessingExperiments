
ArrayList<PVector> points;
float[] xspeed = new float[2];
float[] yspeed = new float[2];

void setup(){
  size(400,400);
  points = new ArrayList<PVector>();
  for(int i=0;i<2;i++){
    PVector p = new PVector(random(0,width),random(0,height));
    points.add(p);
  }
  
  for(int x=0;x<xspeed.length;x++)  xspeed[x] = random(-2,2);
  for(int y=0; y<yspeed.length; y++)  yspeed[y] = random(-2,2);
}

void draw(){
  background(0);
  stroke(#92ECF5);
  noFill();
  
  beginShape();
  for(int i=0; i<2;i++){
    PVector p = points.get(i);
    vertex(p.x,p.y);
  }
  endShape();
  
  for(int i=0; i<2;i++){
    PVector p = points.get(i);
    ellipse(p.x,p.y,(i+1)*20,(i+1)*20);
  }
  
  for(int i=0; i<2;i++){
    PVector p = points.get(i);
    if(p.x < (i+1)*10 || p.x > width-(i+1)*10)  xspeed[i] *= -1.0f;
    if(p.y < (i+1)*10 || p.y > height-(i+1)*10) yspeed[i] *= -1.0f;
    p.x += xspeed[i];
    p.y += yspeed[i];
  }
}
