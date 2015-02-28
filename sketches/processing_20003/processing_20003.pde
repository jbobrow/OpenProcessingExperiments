
void setup(){
  size(400,400);
}
void draw(){
}
void mousePressed(){
  background(255);
  smooth();

  fill(83,175,93,85);//85% opacity
  noStroke();
  beginShape();
  vertex(250,50);
  vertex(350,50);
  vertex(350,150);
  vertex(250,150);
  endShape(CLOSE);
  
  fill(74,90,167,75);//75% opacity
  stroke(29,35,62,75);//75% opacity
  beginShape(TRIANGLE_FAN);
  vertex(300,100);
  vertex(300,50);
  vertex(350,100);
  vertex(300,150);
  vertex(250,100);
  vertex(300,50);
  endShape();

  for(int i=0;i<width;i++)
  vertex(0, random(0,0),
  width, random(width,height));
  
}
  

  



