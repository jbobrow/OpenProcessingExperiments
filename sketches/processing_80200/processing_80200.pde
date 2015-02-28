


void setup(){
  size(1000,600);
  background(0);
  smooth();
  noStroke();
  
}
void draw(){
  float s = map(second(),0,60,0,1200);
  float s1= map(second(),0,60,0,2000);
  float s2= map(second(),0,60,1000,-1000);
  float s3= map(second(),0,60,600,-600);
  float m= map(minute(),0,60,200,0);
  float m1= map(minute(),0,60,600,1000);
  float m2= map(minute(),0,60,400,600);
  float m3= map(minute(),0,60,400,0);
  float h= map(hour(),0,24,0,300);
  float h1=map(hour(),0,24,600,300);
  float h2= map(hour(),0,24,0,500);
  float h3= map(hour(),0,24,1000,500);
  
  fill(0,100);
  rect(0,0,1000,h);
  rect(0,h1,1000,600);
  rect(0,0,h2,600);
  rect(h3,0,1000,600);
  fill(255,12);
  rect(0,0,width,height);
  
  fill(0,6,255,100);
  triangle(1000,0,s2,0,1000,s);
  fill(255,142,142,100);
  triangle(0,0,s1,0,0,s);
  fill(182,154,250,100);
  triangle(1000,600,s2,600,1000,s3);
  fill(255,3,11,100);
  triangle(0,600,s1,600,0,s3);
  
  fill(255,0,196,100);
  beginShape(TRIANGLE_FAN);
  vertex(500,m);
  vertex(m1,300); 
  vertex(500,m2); 
  vertex(m3,300); 
endShape();

}

