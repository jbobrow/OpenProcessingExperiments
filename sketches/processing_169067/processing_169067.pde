
PFont font;
void setup(){
  size(600,600);
  font = loadFont("MarkerFelt-Wide-48.vlw");
  textFont(font);
  fill(#37BC1B);
}

void draw(){
  if (mousePressed){
    background(0);
    String s = "Matrix";
    
    for (int i=0; i<50; i++) {
      float x = random(0,width);
      float y = random(0,height);
      float sz = random(10,30);
      int substrbegin = (int)random(0, s.length()-1);
      int substrend = (int)random(substrbegin, s.length()-1);
      textSize(sz);
      text(s.substring(substrbegin, substrend),x,y);
    }
  }
}
