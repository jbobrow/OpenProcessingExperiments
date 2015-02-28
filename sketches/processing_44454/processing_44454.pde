
void setup() {
  size(1000,750);
  background(0);
   
 for(float rCount = 0; rCount < 255; rCount++) {
   rectMode(CORNER);
   noStroke();
   fill(0+rCount);
   rect(((1.82*rCount)+550),0,(1.82),height);
   

 }
 
 PImage don;
   noStroke();
  don = loadImage("bigger2.jpg");
  int y = don.width*1;
  int z = don.height*1;
  image (don, 318, 0, y/1, z/1);

fill(250,255,255,150);
smooth();
ellipse(1000, 620, 75, 75);
ellipse(950, 620, 130, 130);
ellipse(870, 620, 40, 40);
ellipse(820, 620, 95, 95);
ellipse(600, 670, 200, 200);
ellipse(530, 620, 165, 165);
ellipse(430, 620, 80, 80);
ellipse(300, 620, 100, 100);
ellipse(250, 620, 70, 70);
ellipse(180, 620, 20, 20);
ellipse(150, 620, 110, 110);
ellipse(20, 620, 200, 200);


 
fill(255);
rect(0, 630, 1000, 630);
 
   
 
  stroke(#D33A3A);
strokeWeight(3);
line(0, 665, 1000, 665);
stroke(#AF2727);
strokeWeight(1.25);
line(0, 650, 1000, 650);
strokeWeight(1);
line(0, 640, 1000, 640);
strokeWeight(.75);
line(0, 635, 1000, 635);
stroke(#6A0909);
strokeWeight(.50);
line(0, 630, 1000, 630);

  
  PImage con;
smooth();
con = loadImage("legs and mirror b and w.png");
int m = con.width/1;
int n = con.height/1;
image (con, 420, 50, m/1, n/1);

PFont font;
smooth();
font = loadFont("Monospaced-12.vlw");
textFont(font);
fill(100);
String s = "i love you much(most beautiful darling)";
text(s, 10, 10, 500, 700);
String t = "more than anyone on the earth and i";
text(t, 50, 95, 500, 700);
String u = "like you better than everything in the sky";
text(u, 60, 115, 500, 700);
String v = "-sunlight and singing welcome your coming";
text(v, 80, 150, 500, 700);
String w = "although winter may be everywhere";
text(w, 30, 175, 500, 700);
String x = "with such a silence and such a darkness";
text(x, 60, 225, 500, 700);
String o = "none can quite begin to guess";
text(o, 60, 250, 500, 700);
String p = "(except my life)the true time of year-";
text(p, 10, 300, 500, 700);
String a = "and if what calls itself a world should have";
text(a, 40, 325, 500, 700);
String b = "the luck to hear such singing(or glimpse such";
text(b, 40, 350, 500, 700);
String c = "sunlight as will leap higher than high";
text(c, 40, 375, 500, 700);
String d = "through gayer than gayest someone's heart at your each";
text(d, 40, 400, 500, 700);
String e = "nearness)everyone certainly would(my";
text(e, 70, 460, 500, 700);
String f = "most beautiful darling)believe in nothing but love";
text(f, 100, 500, 500, 700);
 


}



