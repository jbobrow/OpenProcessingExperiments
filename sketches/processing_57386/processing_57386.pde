
int x=150;
  int y=170;
  int h=200;
  int w=200;
  
  size(400, 400);
  background(255);
  smooth();
 
  
  //legR
  line(x, y, x+60, y+60);
 //legL
  line(x, y, x-60, y+60);
 //footR
 fill(161, 86, 237); 
 ellipse(x+60, y+60, h/5, w/5);
 //footL
 ellipse(x-60, y+60, h/5, w/5);

noStroke();
//body
fill(161, 86, 237);
  ellipse(x, y, h, w);
//head
fill(6, 196, 137);
  ellipse(x, y-50, h-40, w-40);
//eyeL
fill(31, 83, 222);
  ellipse(x-40, y-40, h/2-10, w/2-10);
 fill(0);
  ellipse(x-40, y-40, h/5, w/5);
//eyeR
fill(31, 83, 222);
  ellipse(x+40, y-40, h/2-10, w/2-10);
fill(0);
  ellipse(x+40, y-40, h/5, w/5);



 //eyebrowL
 noFill();
 stroke(0);
 strokeWeight(4);
  arc(x-40, y-40, h-40, w-40, PI, PI+HALF_PI);
  
  //eyebrowR
    arc(x+40, y-40, h-40, w-40, PI+HALF_PI, TWO_PI);


