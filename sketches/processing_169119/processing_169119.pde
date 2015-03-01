


PFont font;
void setup(){
  size(600,600,P2D);
  
  font=loadFont("AppleMyungjo-48.vlw");
  textFont(font);
   fill (0, 255, 0);

}

void draw(){
  background(0);
    String s= "Processing";
    
    
    for(int i=0; i<100; i+=1) {
      frameRate(7);
      float x=random(0,width);
      float y=random(0,height);
      float sz= random(30,50);
      int substrbegin= (int)random(0,s.length()-1);
      int substrend= (int)random(substrbegin+1, s.length()-1);
      textSize(sz);
      text(s.substring(substrbegin, substrend),x,y );
    }
  }

