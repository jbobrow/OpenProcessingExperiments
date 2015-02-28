
int x,y;
void setup(){
size(500,300);}
void draw(){
  background(230);
  noFill();  
  strokeWeight(7);
  smooth();
  x=int (random(500));
  y=int (random(300));
  if((x!=350) && (y!=80)){ 
    stroke(250,0,0);
    ellipse(x,y,130,120);
  }
  else{ 
    stroke(250,0,0);
    ellipse(350,80,130,120);
    noLoop();
  }
  

  stroke(0,0,250);
  ellipse(70,80,130,120);
  stroke(0,0,0);
  ellipse(210,80,130,120);
  stroke(250,250,0);
  ellipse(140,150,130,120);
  stroke(0,180,0);
  ellipse(285,150,130,120);
}





