
PFont myFont;

void setup() {
  size(450,450);
  background(255);
  myFont = createFont("Helvetica-48.vlw", 24);
  textFont(myFont);
  String st = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  translate(0,0);
  for(int i=0;i<450;i=i+20)
  for(int j=0;j<450;j=j+20)
  {
  textFont(myFont,random(abs(i-300)));
  fill(0,0,0, random(abs(i-330)));
  text("T",i,random(j));
  }
}
