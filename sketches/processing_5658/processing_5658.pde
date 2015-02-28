
/*
Inspiration from Rafael Rozendaal
http://www.annoyingcursor.com/
*/
PImage a;
void setup(){size(800,600);a=loadImage("curs.png");smooth();noCursor();}
void draw(){background(255,255,255);image(a,795-mouseX,595-mouseY);}


