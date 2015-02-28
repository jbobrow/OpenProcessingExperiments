
//Jules Tran

PFont font;
 
void setup() {
  size(600,800);
  noStroke();
  font = loadFont("AppleGothic-48.vlw");
}
 
void draw() {
  background(13,72,32);
  

  float h = map(hour(),0,23,30,(width-30));
  float m = map(minute(),0,60,30,(width-30));
  float s = map(second(),0,60,30,(width-30));
 
  fill(255,0,0,191);
  rect(h,0,30,250);
  fill(255,0,0,127);
  rect(m,200,30,250);
  fill(255,0,0,63);
  rect(s,400,30,250);

  
  
  int ss = second();
  int mm = minute();
  int hh = hour();
  
   fill(255,0,0);
  String t = hh + ":" + nf(mm, 2) + ":" + nf(ss, 2);
  textFont(font, 48);
  text (t, 200, 720);
 

  
  }
  
  //Original Nidhi Malhotra color clock

   

 




