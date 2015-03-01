

void setup(){
   size(400,400);
   strokeWeight(4);

 }

void draw(){
  pushMatrix();
  scale(.5);
  translate(mouseX,mouseY);
  background(255,128,0);
  
  // wings
  fill(222,0,129);
  triangle(200,200,275,125,275,275);
  triangle(200,200,125,125,125,275);
  //body
  fill(25,214,0);
  ellipse(200,200,20,100);
  //head
  ellipse(200,150,30,30);
  //antenna
  line(210,137,220,120); 
  line(190,137,180,120);
  //eyes
  point(196,145);
  point(204,145);
  popMatrix();
  
}

  






