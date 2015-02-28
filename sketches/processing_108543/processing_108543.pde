
float angle=0.0;
float offset=120;
float scalar=30;
float speed=0.05;


void setup(){
  size(240,200);
  smooth();
  stroke(random(255),random(255),random(255),random(120));
  fill(204);

}


void draw(){
  
  float y1=offset+sin(angle)*scalar;
  
  triangle(0,y1,0,120,20,120);
  triangle(40,y1,20,120,60,120);
  triangle(80,y1,60,120,100,120);
  triangle(120,y1,100,120,140,120);
  triangle(160,y1,140,120,180,120);
  triangle(200,y1,180,120,220,120);
  triangle(240,y1,220,120,260,120);
  
  angle+=speed;
  
  
  
}
