
void setup() {
  size(240,120);
  smooth();
}
void draw() {//drawing characters
  textSize(30);
  boxedCharacter('P',0,20);
  boxedCharacter('E',20,20);
  boxedCharacter('T',40,20);
  boxedCharacter('E',60,20);
  boxedCharacter('R',80,20);
}
void boxedCharacter(char c,int x,int y) {
  pushMatrix();
  fill(0);
  float ascent = textAscent();
  float descent = textDescent();
  float cw = textWidth(c);
  translate( x, y);
  text(c,x,y);  
  //line(x,y-ascent,x+cw,y-ascent);//top line
  //line(x,y+descent,x+cw,y+descent);//bottom line
  //line(x,y-ascent,x,y+descent);//left line
  //line(x+cw,y-ascent,x+cw,y+descent);//right line
  fill(0,0,0,0);
  rect(x,y-ascent,cw,ascent+descent);//one sqaure
  popMatrix();
}


