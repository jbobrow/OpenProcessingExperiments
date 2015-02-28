
/*@pjs preload= "http://oi60.tinypic.com/20st3xt.jpg"; */

void setup(){
 
size (500, 500);
background (74,255,247);

}

void draw(){
  
PImage img;
img = loadImage("http://oi60.tinypic.com/20st3xt.jpg");
image(img,random(1,500), 250, 80, 70);

  
fill (10,30,50,10);
strokeWeight(10);
stroke (0, 0, 0);
rect (random(1,200), 50, 500, 400);
 
fill (255,10);
rect (random(1,200), 250, 100, 275);
rect (275, random(1,300), 275, 100);
 
fill (245,3,3,10) ;
ellipse(random(1,500), 250, 275, 275);

}
 


