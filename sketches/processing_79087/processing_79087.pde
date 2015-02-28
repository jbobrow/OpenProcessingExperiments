
/* @pjs preload="dasha_in_the_sky.png"; */
/* @pjs font="Ubuntu-B.ttf"; */
size(800,600);
colorMode(HSB, 360,100,100);
PImage img=loadImage("dasha_in_the_sky.png");
tint(150,100,100);
image(img,0,0,400,600);
tint(50,100,100);
image(img,400,0);

PFont font= createFont("Ubuntu-B.ttf",30);
textFont(font);
textSize(80);
fill(0,0,100,150);
String s="i messaggi della gioia";
for (int i=0; i<s.length(); i++) {
  text(s.charAt(i),i*27,100);
}  
//di solito ho da far cose più serie, costruire su macerie o mantenermi vivo...




