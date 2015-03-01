
PVector point;

void setup(){
  background(0,180,250);
  size(1000,800);
  point = new PVector(0, 0);

  frameRate(20);
  stroke(0,80,0);
  //fill(22,95,26,100);
  
}

void draw(){
  translate(width/2, height);
  for(int i = 0; i < 1000; i++){
    int rnd = (int)random(0,100);
    point = iterate(point, rnd);
    ellipse(80*point.x, -80*point.y,.25,.25);
   //ellipse(0,0,100,100); 
  }

}

PVector iterate(PVector old, int index){
  float x,y;
  if(index <85){
    x = .85*old.x + .04*old.y;
    y = -.04*old.x + .85*old.y + 1.6;
  } else if (index < 92){
    x = .2 * old.x -.26*old.y;
    y = .23 * old.x + .22 * old.y + 1.6;
  } else if (index < 99){
    x = -.15 * old.x + .28*old.y;
    y = .26 * old.x + .24*old.y + .44;
  } else {
    x = 0;
    y = .16 * old.y;
  }
  return new PVector(x,y);
}
