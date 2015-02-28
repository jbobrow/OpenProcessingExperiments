
void setup() {
  size(400,400);
  //  noLoop();
  background(60,0,0);
  frameRate(1);
  smooth();
}




void draw() {
  int rostox = round(random(200,400));
  int rostoy = round(random(150,400));
  float pele = random(0,255);
  int nariz = round(random(10,40));



  fill(pele);
  rectMode(CENTER);
  rect(width/2,height/2,rostox,rostoy);
  olho((width/2)-(rostox/2)+60,(height/2)-(rostoy/2)+60);
  olho(
  (width/2)+(rostox/2)-60, 
  (height/2)-(rostoy/2)+60);
  fill(200,0,0);
  rect(width/2,height/2,nariz,nariz);
  noFill();
  stroke(200,0,0);
  strokeWeight(4);

  // arc(width/2,(height/2)+30,random(50,80),random(50,80),0,PI);

  arc(width/2,

  ((height/2)+(rostoy/2))-70,

  random(50,110),random(50,110),0,PI);

}

void olho(int x, int y) {
  fill(0,0,128);
  strokeWeight(3);
  line(x,y,x-23,y-23);
  line(x,y,x+23,y-23);
  line(x,y,x,y-30);
  line(x,y,x+30,y);
  line(x,y,x-30,y);
  ellipse(x,y,30,30);

}
