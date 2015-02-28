
void setup(){
size(200,200);
colorMode(HSB,100);
background(100);
smooth();
}
void draw(){
  translate(random(width),random(height));
  drawSmile(0,0);
}
void drawSmile(int x,int y){
  scale(random(0.3,1.0));
  strokeWeight(2);
  stroke(0);
  fill(random(10,30),99,99,90);
  rotate(random(0,TWO_PI));
  ellipse(x,y,50,50);
  fill(0,0,0);
  ellipse(x-10,y-5,5,5);
  ellipse(x+10,y-5,5,5);
  noFill();
  arc(x,y+5,20,20,0,PI);
  for(int i=0; i<10;i++){ 
  stroke(random(90,100),99,99,30);
  strokeWeight(0.5);
  float d=(random(3,10));
  ellipse(random(x-20,x-12),random(y+2,y+6),d,d);
  ellipse(random(x+12,x+20),random(y+2,y+6),d,d);
  }
}


