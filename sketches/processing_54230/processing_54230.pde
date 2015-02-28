
float[] xCoords=new float[1300];
float[] yCoords=new float[1300];
float[] xMove=new float[1300];
float[] yMove=new float[1300];

void setup(){
size(1366,768);
smooth();
for (int i=0;i<1300; i++){
xCoords[i]=random(width);
yCoords[i]=random(height);
xMove[i] =random (-5,5);
yMove[i] =random (-5,5);
}
}
void draw(){
  fill(0,20);
  rect(0,0,width,height);
  //CHANGE THIS FILL TO (255) IF YOU DONT LIKE FLASHING COLORS
  fill (random(0,255),random(0,255),random(0,255));
  noStroke();
  for (int i=0;i<1300; i++){
    ellipse(xCoords[i],yCoords[i],30,30);
    xCoords[i]+=xMove[i];
    yCoords[i]+=yMove[i];
  if (xCoords[i]>width|| xCoords[i]<0){
  xMove[i]*=-1;
}
if (yCoords[i]>height|| yCoords[i]<0){
  yMove[i]*=-1;
}
}
}

