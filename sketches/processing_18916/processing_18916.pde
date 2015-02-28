
float x;
float y;
void setup(){
  background(255);
  size(screen.width,screen.height);
  stroke(255);
}

void draw(){
  background(0);
  fill(0, 30);
  rect(0,0, width, height);
    for(int x = 0; x<width; x+=5){
      y = 1-pow(x, 4);
      y=map(y, 0, 1-pow(x,4), 0, 600);
      println(y);
      stroke(random(255), random(255), random(255));
      ellipse(x+40,height/2,x, y); 
    
  }
}

