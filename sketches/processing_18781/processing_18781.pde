
void setup () {
  size (250,250);
  background (#000000);
  frameRate (100);
  smooth ();
  noCursor (); //mouse removed
  
}

void draw() {
  
  //mid circle
  fill (#FF1544,random(10));
  noStroke ();
  for (int x = 0; x < 150; x+=10){
    ellipse (125,125,5+x,5+x);
  }
  fill (#FF1544,random(5));
  for (int x = 0; x < 100; x+=10){
    ellipse (205,205,3+x,3+x);
  }
   
  fill (#FF1544,random(5));
  for (int x = 0; x < 100; x+=10){
    ellipse (45,45,3+x,3+x);
  }

  fill (#FF1544,random(5));
  for (int x = 0; x < 100; x+=10){
    ellipse (45,205,3+x,3+x);
  }
  
   fill (#FF1544,random(5));
  for (int x = 0; x < 100; x+=10){
    ellipse (205,45,3+x,3+x);
  }
  
  fill(0,20); // use black with alpha 10

 
  rectMode(CORNER);
 
  rect(0,0,width,height);
 
  // moving mouse
  fill(#FF1544,random(100));
  noStroke ();
  if (mousePressed == false);
ellipse(pmouseX,pmouseY,15,15);
ellipse(pmouseY+10,pmouseX+30,10,10);
stroke(#FFFFFF,random(50));
}


