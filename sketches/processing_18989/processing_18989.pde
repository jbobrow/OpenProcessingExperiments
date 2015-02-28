
//Adam Oaks


void setup(){
  size(400,400);
  smooth();
  background(143,167,209);
  stroke(0);
  strokeWeight(4);
  line(0,75,400,75);
 strokeWeight(1);
  rectMode(CENTER);
  fill(255,204,51);
  rect(width/2,80,20,30);
  rect(width/2,215,125,250);
  fill(50);
  ellipse(width/2,140,70,70);
  ellipse(width/2,215,70,70);
  ellipse(width/2,290,70,70);
}

int x=1;

void draw(){
  fill(77,166,25);
  ellipse(width/2,290,70,70);
  x++;
  
 if(x>100){
    fill(50);
  ellipse(width/2,290,70,70);
  fill(255,235,0);
  ellipse(width/2,215,70,70);
  }
 
  if(x>250){
    fill(50);
  ellipse(width/2,215,70,70);
  fill(255,0,0);
  ellipse(width/2,140,70,70);
}
  
  if(x>500){
    fill(50);
  ellipse(width/2,140,70,70);
  fill(77,166,25);
  ellipse(width/2,290,70,70);
  }
}

