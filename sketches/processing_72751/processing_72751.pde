
void setup(){
 size(586,700); 
}

void drawAstroid(int cx,int cy,int radius){//center of astroid in x/y; radius
  float p = 10; //p points per axis of each astroid
  float gap = radius/p; //gaps between points on axis
  for (int i = 1; i<p; i=i+1){
    line(cx,cy-i*gap,cx+radius-(i*gap),cy);
    line(cx,cy-i*gap,cx-radius+(i*gap),cy);
    line(cx,cy+i*gap,cx-radius+(i*gap),cy);
    line(cx,cy+i*gap,cx+radius-(i*gap),cy);
  }
}

void draw(){
  background(random(180,225),50,50);
  smooth();
  int radius = 39;
  for (int i = radius; i<18*radius; i = i+radius){//cols
    for (int j = radius; j<15*radius; j = j+radius){//rows
      strokeWeight(1);
      stroke(random(25,125));
      drawAstroid(j,i,radius);
    }
  }
}
