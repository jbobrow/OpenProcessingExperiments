
void setup(){
  size(400,400);
  noFill();
  smooth();
  }
void draw(){
  background(255);
  stroke(0,0,255);
  strokeWeight(5);
  ellipse(70,70,70,70);
  stroke(0,0,0);
  ellipse(105,70,70,70);
  stroke(255,255,0);
  ellipse(85,105,70,70);
  stroke(0,255,0);
  ellipse(120,105,70,70);
  float x=int(random(0,400));
  float y=int(random(0,400)); 
  stroke(255,0,0);
  if((x!=140) && (y!=70)){
    ellipse(x,y,70,70);
    }
  else{
    ellipse(140,70,70,70);
    noLoop();
    }
  }
