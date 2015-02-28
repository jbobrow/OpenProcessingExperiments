
float angle=0.0;
void setup(){
  size (250,250);
  smooth();
  noStroke();
}

void draw (){
  fill(255,255,240,12);
  rect(0,0,width,height);
  noFill();
  stroke(255);
  angle=angle+0.02;
  translate (100,100);
  rotate (angle);
  ellipse (-30,-30,120,120);
  stroke(255);
  ellipse (-30,-30,120,120);
   stroke(232,178,209);
  ellipse (-20,-20,40,40);
  stroke(178,192,232);
  ellipse (-20,-20,140,140);
  stroke(255);
  ellipse (-20,-20,160,160);
  stroke(232,178,209);
  ellipse (-20,-20,180,180);
  stroke(178,192,232);
  ellipse (-20,-20,80,80);
  stroke(255);
  ellipse (-20,-20,210,210);
  stroke(178,192,232);
  ellipse (-20,-20,240,240);
  
  rect (-20,-20,250,250);

}



