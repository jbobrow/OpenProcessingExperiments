
PFont font;
String s1= "Don't give up";
String s2= "We have final!";

void setup(){
  size(600,600);
  font = loadFont("AmericanTypewriter-Bold-30.vlw");
  textFont(font);
}

void draw(){
  if(mousePressed){
    background(0);
    for (int i=0; i<100; i++) {
      float x= random(0,width);
      float y = random(0,height);
      float sz =random(10,30);
      int substrbegin1 = (int)random(0,s1.length()-1);
      int substrend1 = (int)random(substrbegin1+1, s1.length()-1);
      fill(255);
      textSize(sz);
      text(s1.substring(substrbegin1, substrend1),x,y/2);
    }
      fill(255,255,0);
      textSize(30);
      text(s2,width/2,height*4/5);
    }
  }

