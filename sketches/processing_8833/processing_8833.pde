
//Owaun Scantlebury
//April 12th 2010
void setup(){

  size(600,600,JAVA2D);
  smooth();
  lock();

}

void draw(){

}
void keyPressed(){
  if (key=='1')lock();
  if (key=='2')house();
  if (keyCode=='3')redraw();
  if (!online && key=='s')save("lock.png");
}
void house(){
  background(-1);
  scale(2);
  translate(-width/4,-height/4);

  rectMode(CENTER);
  ellipseMode(CENTER);
  noFill();
  stroke(1);
  strokeWeight(3);
  ellipse(width/2-2,height/2-5,50,50);
  noStroke();
  strokeWeight(1);
  fill(1);
  rect(width/2,height/2,20,20);
  noStroke();
  triangle(width/2-10,height/2-10,width/2,height/2-20,width/2+10,height/2-10);
  fill(-1);
  rect(width/2-5,height/2-5,5,5);

  rect(width/2+5,height/2+5,5,10);
  fill(1);
  rect(width/2-5,height/2-15,5,10);
  filter(INVERT);

  noLoop();
}
void lock(){
  background(-1);
  scale(2);
  translate(-width/4,-height/4);

  rectMode(CENTER);
  ellipseMode(CENTER);

  noFill();
  stroke(1);
  strokeWeight(3);
  ellipse(width/2-1,height/2-2,50,50);
  noStroke();
  strokeWeight(1);

  fill(1);

  ellipse(width/2,height/2-10,15,15);
  fill(-1);
  ellipse(width/2,height/2-10,10,10);
  fill(1);
  rect(width/2,height/2,20,20);
  noFill();
  ellipse(width/2,height/2,25,25);

  filter(INVERT);

  noLoop();


}




