
void setup(){
  size(640, 480);
  smooth();
  background(0);
}
void draw(){
}
void mousePressed(){
  background(0);
  fill (255);
  stroke (255);

  int hei=int(random(0, 480));
  int wid=int(random(0, 640));
  int a=int(random(80, 160));
  int b=int(random(40, 80));
  int c=int(random(20, 40));
  int d=int(random(10, 20));
  int e=int(random(5, 10));
  
  strokeWeight (20);
  line (wid, hei, wid, hei+a);
  line (wid, hei, wid, hei-a);
  line (wid, hei, wid+a, hei);
  line (wid, hei, wid-a, hei);
  
  line (wid, hei, wid+a, hei+a);
  line (wid, hei, wid-a, hei-a);
  line (wid, hei, wid-a, hei+a);
  line (wid, hei, wid+a, hei-a);
  strokeWeight (15);
  line (wid, hei+a, wid+b, hei+a+b);
  line (wid, hei+a, wid-b, hei+a+b);
  line (wid, hei-a, wid+b, hei-a-b);
  line (wid, hei-a, wid-b, hei-a-b);
  line (wid+a, hei, wid+a+b, hei+b);
  line (wid+a, hei, wid+a+b, hei-b);
  line (wid-a, hei, wid-a-b, hei+b);
  line (wid-a, hei, wid-a-b, hei-b);
  
//  PF font;
//  font = loadFont ("");
//  textFont(font);
textSize(70);
text("BLACKICE", wid-a-50, hei+a+b+60);
  
}

