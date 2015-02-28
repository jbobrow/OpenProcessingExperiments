
float x;
float y;
int value = 0;

void setup (){
  size(800,600);
  background(0,0,0);
  frameRate(60);

}

void draw (){
  x= (800);
  y= (600);
  fill(random(255),random(255),random(255),random(255));
  ellipse((400),(300),(mouseX-random(1)),(mouseY-random(1)));
  strokeWeight(10);
line(20, 70, 80, 70);
  //rect(var 1, var 2, var 3, var 4);
  

  
}

void mousePressed(){

}


void keyPressed(){
}


void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;

  }
}
