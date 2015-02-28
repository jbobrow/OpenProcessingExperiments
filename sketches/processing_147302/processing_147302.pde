
//Miranda Hayes-period 4 engineering-4.9.14

void setup()
{
  size (1200,800);
  background (#000000);
}
void draw()
{
  String a="Party On!";//tomboy
textSize(20);
fill(#00FFFF);
text(a,10,10,90,30);

  String b="Where’s My Starbucks?"; //white girl
textSize(20);
fill(#FF00FF);
text(b,120,60,110,100);

  String c="Everyday I’m Shufflin’";//tomboy
textSize(20);
fill(#00FFFF);
text(c,360,10,240,100);

  String d="HOLD MY POODLE!! HOLD MY POODLE!!";//white girl
textSize(20);
fill(#FF00FF);
text(d,570,60,480,100);
 
  String e="Nerd It Out";//white girl
textSize(20);
fill(#FF00FF);
text(e,1000,10,120,100);

  String f="Hipsta Please";
textSize(20);
fill(#FC7200);
text(f,10,110,140,100);


  String g="Yeaaaaaaaasss";
textSize(20);
fill(#FC7200);
text(g,270,110,150,100);

  String h="Zaayyyyyyyyyymmmmm";
textSize(20);
fill(#FC7200);
text(h,550,150,230,100);

  String i=" * Or Nah";//tomboy
textSize(20);
fill(#00FFFF);
text(i,1000,110,130,100);

  String j="Whats your phrase?";
textSize (90);
fill (#00FF00);
text (j,200,180,900,500);
 
   String q="PRESS THE (h) KEY NOWW!!!!";
textSize (30);
fill (#00FF00);
text (q,380,290,900,500);

  String k="if you answer mostly pink press the (a) key";
textSize (20);
fill (#FF0000);
text (k,10,340,450,100);

  String l="if you answer mostly teal press the (s) key";
textSize (20);
fill (#FF0000);
text (l,780,340,900,500);

  String m="if you answer mostly orange press the (d) key";
textSize (20);
fill (#FF0000);
text (m,380,380,900,500);

if (keyPressed) {
    if (key == 'a' || key == 'A') {
     String n=" you are a white girl your fun to be around but you might say like a lot or care more about your starbucks then life but we all love you. :)";  
   textSize (25);
   fill (#FF00FF);
   text (n,10,400,200,350);
  }
  } else {
    fill(255,0,0);
  }
if (keyPressed) {
    if (key == 's' || key == 'S') {
     String o="you are a tomboy your fun to be around and you always hang out with the guys. You have very few girl besties but they all love you as the best sister/bro";  
   textSize (25);
   fill (#00FFFF);
   text (o,230,400,230,350);
  }
  } else {
    fill(255,0,0);
  }
if (keyPressed) {
    if (key == 'd' || key == 'D') {
     String p="you are a hipster your fun to be around and you always hang out with the kool kidz. You have very few best friend but you do have the best style";  
   textSize (25);
   fill (#FC7200);
   text (p,500,400,230,350);
  }
  } else {
    fill(255,0,0);
  }

if (keyPressed) {
    if (key == 'h' || key == 'H') {
     String p="Whaterver you get as your answer your amazing and a great person this was fun to make yeahhhhhhssss the world thinks you amazing in every way oh yeah :)";  
   textSize (25);
   fill (#00FF00);
   text (p,800,400,230,400);
  }
  } else {
    fill(255,0,0);
  }

}
