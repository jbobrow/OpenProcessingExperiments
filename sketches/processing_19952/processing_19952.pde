
PFont my_font;
String x; //the text can repeat itself as an x value

void setup(){
  size(250, 250);
  smooth();//texts looks smooth
  my_font=loadFont("STHeiti-48.vlw"); //heiti
  textAlign(CENTER);
  noLoop();
  }

void draw(){
  background (255);
  textFont(my_font, 40);//(font, size of the font)
  fill(245, 228, 30);
  text("L1W3Z2L1W3Z2", width/2, 90);
  fill(0, 130, 140);
 
 
textFont(my_font, 30); //(font, size of the font)
  x="L1W 3Z2";
  fill(20, 33, 10, 80);
  text(x, width/2, height/2);
  text("L 1 W  3  Z  2", width/2, 50);//above blue code
  fill(20, 33, 10, 120);
  text("L 1  W   3   Z   2", width/2, 28);
  text(x, width/2, 160);
  text(x, width/2, 184);
  text(x, width/2, 210);
  fill(20, 33, 10, 70);
  text(x, width/2, 248);
  

 
}

  
  


