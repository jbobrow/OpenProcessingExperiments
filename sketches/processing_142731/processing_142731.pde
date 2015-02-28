
void setup (){
  size (500,500);
  background (0);
}

void draw (){
  background(0);
  noStroke();
  fill (200);
  ellipse (250,250,10,10);
  fill(110);
  ellipse (100,250,10,10);
  fill(160);
  ellipse (250,100,10,10);
  fill(30);
  ellipse (400,250,10,10);
  fill (70);
  ellipse (250,400,10,10);
 

 if (mousePressed) {
   fill(255);
 
  ellipse (250,250,130,130);
  ellipse (100,250,130,130);
  ellipse (250,100,130,130);
  ellipse (400,250,130,130);
  ellipse (250,400,130,130);}

  
 
}
