
int funky=0;
int chunky=0;
int plumpy=0;
int bumpy=0;



void setup(){
  size(400,800);
  
  background(32,167,242);
  smooth();
 
  
}



void draw(){
  
 
 stroke(255,255,255);
 strokeWeight(10);
 line(0,bumpy,width,bumpy);
 bumpy = bumpy+40; 

 
  fill(0,0,0); 
  noStroke();
  triangle(funky,chunky,chunky,plumpy,funky,plumpy);
  funky = funky+10;
  chunky = chunky+50;
  plumpy = plumpy+100;
  
 
  
  fill(49,7,167);
  noStroke();
  triangle(0,0,400,600,400,150);
 
  
  
}




