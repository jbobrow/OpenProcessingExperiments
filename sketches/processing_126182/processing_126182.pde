
void setup(){
  size(640,400); 
  smooth();
}

void draw(){
  background(255);
  for(int x=0;x<=width;x+=40){
    for(int y=0;y<=height;y+=40){
      stroke(100+random(255));
      line(x,y,106,66);
    }
  }
    for(int x=0;x<=width;x+=40){
    for(int y=0;y<=height;y+=40){
      noStroke();
      ellipse(x,y,15,15);
      fill(random(255),random(255),random(255));
    }
  }
}


