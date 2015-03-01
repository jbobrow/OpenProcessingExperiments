

float r;
float g;
float b;
float a;

void setup() {
  size(400, 400);
}
 
void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  fill(255);
  rectMode(CENTER);
   
  rect(width/2, height/2, 100, 100);
}

void mousePressed (){
  if(mouseX > 150 && mouseX < 250 && mouseY > 150 && mouseY <250){
    background (r,g,b,a);
  }
}
