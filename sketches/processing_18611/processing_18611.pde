
float angle=0.0;

void setup(){
  size(250,250);
  smooth();
}

void draw(){ 
  fill(0, 12); 
  rect(0-2, 0-2, width+5, height+5); 
  noStroke();
  fill(random(0,50));
  ellipse(175,75,40,40);
  stroke(255);
  angle= angle-0.02;
  translate(200,100);
  rotate(angle);
  triangle(70,70,90,50,110,70);
  triangle(50,50,120,30,190,50);
  
  
}

