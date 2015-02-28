
void setup(){
  size(500,500);
  
}


void draw(){

    noStroke();
  fill(random(255),random(255),random(255));
  rect(0,0,500,500);
  
  noStroke();
  fill(random(255),75,random(255));
  rect(50,50,400,400);
  
  noStroke();
  fill(random(255),random(255),120);
  rect(100,100,300,300);
  
  noStroke();
  fill(random(255),175,random(255));
  rect(150,150,200,200);
  
  noStroke();
  fill(random(255),random(255),255);
  rect(200,200,100,100);
  
  noStroke();
  fill(125,160,215,mouseY);
  rect(0,0,500,500);
  
  noStroke();
  fill(170,185,195,mouseY);
  rect(50,50,400,400);
  
  noStroke();
  fill(210,215,170,mouseY);
  rect(100,100,300,300);
  
  noStroke();
  fill(225,240,155,mouseY);
  rect(150,150,200,200);
  
  noStroke();
  fill(255,255,125,mouseY);
  rect(200,200,100,100);

  
}
