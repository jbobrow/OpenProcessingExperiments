
void setup() {
  size(1000,750);
  background(0);
  
  
}

void draw () {
   
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
con = loadImage("legs and mirror b and w.png");
int m = con.width/1;
int n = con.height/1;
image (con, 420, 50, m/1, n/1);

PFont font;
font = loadFont("Zapfino-10.vlw");
textFont(font);
fill(255);
String s = "i love you much(most beautiful darling)";
text(s, 10, 10, 500, 700);
String t = "more than anyone on the earth and i";
text(t, 50, 50, 500, 700);
String u = "like you better than everything in the sky";
text(u, 60, 75, 500, 700);
String v = "-sunlight and singing welcome your coming";
text(v, 80, 150, 500, 700);
String w = "although winter may be everywhere";
text(w, 30, 225, 500, 700);
String x = "with such a silence and such a darkness";
text(x, 60, 270, 500, 700);
String y = "none can quite begin to guess";
text(y, 60, 290, 500, 700);
String z = "(except my life)the true time of year-";
text(z, 10, 350, 500, 700);
String a = "and if what calls itself a world should have";
text(a, 40, 400, 500, 700);
String b = "the luck to hear such singing(or glimpse such";
text(b, 43, 430, 500, 700);
String c = "sunlight as will leap higher than high";
text(c, 46, 460, 500, 700);
String d = "through gayer than gayest someone's heart at your each";
text(d, 49, 490, 500, 700);
String e = "nearness)everyone certainly would(my";
text(e, 70, 570, 500, 700);
String f = "most beautiful darling)believe in nothing but love";
text(f, 160, 590, 500, 700);


}




