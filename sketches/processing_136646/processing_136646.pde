
float [] red = {255,125,30};
float[]grn = {17,152,15};
float [] blu = {255,0,175};


void setup (){
  size(100,100);
  noStroke();
  frameRate(15);
  background(6,6,6);
}

void draw(){
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/2,height/2,150,150);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/2,height/2,100,100);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/2,height/2,60,60);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/2,height/2,30,30);
  
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/6,height/6,150,150);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/6,height/6,100,100);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/6,height/6,60,60);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/6,height/6,30,30);
  
   fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/1.2,height/1.2,150,150);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/1.2,height/1.2,100,100);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/1.2,height/1.2,60,60);
  fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(width/1.2,height/1.2,30,30);
}

