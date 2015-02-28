
void setup() {
  size(200,200);
}

void draw() {
  for(int y=10; y<=200; y=y+20){
    for(int x=10; x<=200; x=x+20)
    {
    noStroke();
    fill(random(255), random(0), random(255));
    ellipse(random(x),random(y),sin(10),10);
    }
  }
}

              
                				
