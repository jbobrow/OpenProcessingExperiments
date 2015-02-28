

int timer;

void setup() {
  size(500, 500);
  frameRate(1);
  background(255);
}
 
void draw() {
  
  timer = timer + 1;
  
  if (timer > 0 && timer < 60) {
    smooth();
    noFill();
    stroke(2, 100);
    strokeWeight(10);
    float i =random(10, 450);
    ellipse(width/2, height/2 ,i ,i );
    println(second());
  }
  
  if(timer == 60){
   timer = 0;
   background(255);
  }

  
}
 

