
void setup(){
  size (600,600);
  background(180,180,180);
  
}


void draw(){
  background(180,180,180);
  noStroke();
  fill(29,52,23);
  //stroke(0,255,40);
  strokeWeight(0);
  rect(width/5,width/5,150,30);
  rect(3*width/5,width/5,150,30);
  rect(width/5,3*width/5,150,30);
  rect(3*width/5,3*width/5,150,30);
  fill(165,5,5);
  ellipse(width/2+17,mouseY,25,25);
  ellipse(width/5+75,75,10,10);
  ellipse(3*width/5+75,3*width/5-50,10,10);
  fill(245,211,17);
  rect(3*width/5+70,width/5-50,10,10);
  rect(width/5+70,3*width/5-50,10,10);
 
  
  }


