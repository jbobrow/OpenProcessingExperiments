
void setup() {
  size(600,600);
  background(255,255,255);
  frameRate(200);
}

void draw() {
  if(mousePressed){
    float rnd = random(230,255);
    float rnd2 = random(230,255);
    float rnd3 = random(230,255);
    float siz1 = random(100,200);
    float siz2 = random(100,200);
    float siz3 = random(100,200);
    float siz4 = random(100,200);
    translate(mouseX,mouseY);
    rotate(random(-PI,PI));
    translate(50,50);
    fill (rnd,rnd3,rnd2);
    noStroke();
    triangle(-siz1/3,-siz2/3,-siz3/3,-siz4/3,0,0);
    
   
  }}

