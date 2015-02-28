
float  d, mm, wCen, hCen, Cir, CirR1, CirR2, CirR3;  

PImage a;  

PFont b;  



void setup() {  

  smooth();  

  size(360, 600);  

  stroke(255);  

  a = loadImage("1.png");
}  





void draw()  

{  


  wCen = 185;  

  hCen = 320;  

  Cir = 350;  

  CirR1 = Cir/3;  

  CirR2 = Cir/2.5;  

  CirR3 = Cir/4;  


  background(255);  

  image(a,0,0,360,600);  




  // month, day  

  b = loadFont ("AmiR-HM-48.vlw");  

  fill(0);  

  textFont(b);    



  int d = day();    

  int mm = month();    

  String f =  nf(mm,2) + "." + nf(d,2);    

  text(f, 135, 500);    





  // time  

  fill(255);    

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  

  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;  

  float h = map(hour()% 12, 0, 12,0, TWO_PI) - HALF_PI;  



  stroke(0);   

  ellipse(185, 320, 15, 15);  

  strokeWeight(4);  

  line(wCen, hCen, cos(s) * CirR1 + wCen, sin(s) * CirR1 + hCen);  

  strokeWeight(5);  

  line(wCen, hCen, cos(m) * CirR2 + wCen, sin(m) * CirR1 + hCen);  

  strokeWeight(8);  

  line(wCen, hCen, cos(h) * CirR3 + wCen, sin(h) * CirR1 + hCen);
} 


