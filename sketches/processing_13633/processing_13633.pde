
float y=200;

void setup(){
 size(200,200);
}

void draw(){
 background(sin(y)*100, random(y), random(y));
 if(y<=0){
  y=200;
 } 
  noStroke(0);
  ellipse(random(y),sin(y), cos(y)*200,800)
}

