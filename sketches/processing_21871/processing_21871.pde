
void setup (){
size (800,600);
background (128);
}
void draw () {
  noLoop();
strokeWeight (10);
smooth ();
line ( width ,height/6,0, height/6);
line ( width ,height/2,0, height/2);
line ( width/6,0 ,width/6, height);
ellipse (200,200,200,200);
ellipse (400,200,200,200);
ellipse (600,200,200,200);
ellipse (200,400,200,200);
ellipse (400,400,200,200);
ellipse (600,400,200,200);
fill (128,50,200);
ellipse (200,400,100,100);
ellipse (400,400,100,100);
ellipse (600,400,100,100);
fill (128,50,50);
ellipse (90,90,100,100);
ellipse (300,85,100,100); fill (128,0,128,80);
ellipse (350,200,100,100);
ellipse (300,310,100,100);
}
void mousePressed () {
  saveFrame ("dibu-####.png");}
  

