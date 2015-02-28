
void setup(){
  size(300,300);
}
float x=2;
float y=10;

void draw() {
  background(234,23,y);
  smooth();
  noStroke();
  fill(255,57,18);
  ellipse(width/2,height/2,20+x,20+x);
  fill(255,130,18);
    ellipse(width/2,height/2,y,x);
    fill(255,141,y);
    ellipse(width/2,height/2,y/2,x/2);



/*strokeWeight(3);
  stroke(141,255,18);
  line(0,0,x,x);
  line(width,0,x,x);
  line(0,height,x,x);*/
  

  y++;
  x++;
  
  
}

