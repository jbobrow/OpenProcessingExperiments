

 
float moveScale = 0.05;
float movesetX, movesetY;
 
void setup() {
  size(250,250);
  
}
void draw() {
  background(#430220);
  noFill();
  stroke(250,90);
  for(int i = 0; i<300;i+=1) {
    movesetX += 18;
    movesetY += 3;
    drawOneStream();
  }
}
 
void drawOneStream() {
  float x = 1;
  float y = height/3;
  float ox = 1;
  float oy = 0;
  int t = 0;
  while((x>=0) && (x<width) && (y< height) && (y>=0)) {
 
    point(x,y);
    float xmove = noise((t+movesetX) * moveScale);
    float ymove = noise((t + movesetY) * moveScale);
    ox = ((2*ox) + 1 + map(xmove, 0, 2,1,1))/4.0;
    oy = ((3*oy) +  map(ymove,0,1,-1,1))/4.0;
    x += 6*ox;
    y += 2*oy;
    t++;
  }
}



