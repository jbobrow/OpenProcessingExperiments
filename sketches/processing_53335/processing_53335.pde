
int toggle = 0;
int squareCount = 0;
int arcCount = 0;


void setup(){
  size(500,500);
  smooth();
  background(300);
  noFill();

  smooth();
}

void draw(){
  smooth();
  noStroke();
  fill(random(255), random(255), random(255), random(150));
  if(mousePressed){
    ellipse(mouseX+random(250), mouseY-random(250), 600, 50);
    quad(mouseX-random(250), mouseY+random(250), 40,70,300,70,400,10);
    
    

}
}

