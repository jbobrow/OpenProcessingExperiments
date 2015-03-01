
float xX = 10;
float xY = 10;
float yX = 10;
float yY = 10;
int []sea = new int [100];
void setup(){
  size(1200,700);
}
void draw(){
  xX= yX+yX;
  xY = yY+xY;
  for(int i = 0; i < 100; i++){
    sea[i] = i*2;
    fill(xX*1.5,xY*2.5,yX+yY);
    ellipse(i*xY/2.5,i*xX/1.5,sea[i],sea[i]);
    stroke(0,0,255,50);
    line(i*yY/1,i*yX/1,sea[i],sea[i]);
  }
}
