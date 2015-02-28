
PFont myFont;

void setup() {
  size(450,450);
  background(255);
  myFont = createFont("Helvetica-48.vlw", 24);
  textFont(myFont,10);
  for(int i=0;i<450;i=i+20)
  {
  for(int j=0;j<450;j=j+20)
  {
  fill(0,0,0);
  textFont(myFont,50);
  text("K",i,j);
  if(i%100==0 || j%100==0);
  {
  fill(255,255,255);
  textFont(myFont, 50);
  text("i",i,j);
  fill(170,167,167);
  }
}
}
}
