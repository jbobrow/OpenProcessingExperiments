
void setup(){
  size(400,400);
  smooth();
  frameRate(4);
  background(255);
}
void draw(){
  for(int i=5;i<200;i+=5){
    noStroke();
    fill(255);
    ellipse(220,100,i,i);
    ellipse(80,220,100,100);
    ellipse(320,240,70,70);
  }
  //shore
  fill(245,222,179);
  rect(0,290,400,110);
  fill(242,71,63);
  triangle(320,340,360,340,340,400);
  rect(270,330,30,30);
  ellipse(285,390,20,20);
  stroke(242,71,63);
  strokeWeight(3);
  line(285,360,285,390);
  noStroke();
  fill(245,222,179);
  ellipse(285,390,15,15);
  rect(330,375,20,25);
  
  //surf
  for(int x=0;x<500;x+=20){
    for(int y=0;y<300;y+=20){
      bubble(x,y);
      doublebubble(x,y);
    }
  }
}
void bubble(int x, int y){
  float b=random(20);
  strokeWeight(4);
  stroke(99,209,244);
  noFill();
  ellipse(x,y,b,b);
}
void doublebubble(int x, int y){
  float b=random(20);
  strokeWeight(4);
  stroke(244,247,118);
  noFill();
  ellipse(x+5,y+10,b,b);
}
