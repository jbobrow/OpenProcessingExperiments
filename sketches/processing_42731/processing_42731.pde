
boolean paused = false;

void setup() {
  size(500,700);
  background(255);
  smooth();
noStroke();
}

void draw() {

  for (int a=10; a<=width; a=a+20){
      for (int b=10; b<=height; b=b+20){
       if (!paused){
    
    ellipse(a,b,10,10);
        fill(random(255),random(255),random(255));
       }
  }
  }
}

void mouseClicked() {
  if(paused) {
    paused = false;
  }
  else{
  paused = true;
  }  
}

