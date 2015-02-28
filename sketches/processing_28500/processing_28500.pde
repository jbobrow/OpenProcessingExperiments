
float time = 1;

void setup() {
  size(300,300);
  smooth();
}

void draw () {
  background (255);

  time = time+0.2;
  println (time);
  
  if (time >= 20){
    time=0;
  } 

  for (int x=0; x <= height; x=x+20) {
    for (int y=0; y<= height; y= y+20) {
      
      strokeWeight (time);
      rect (x,y, 9, 9);
    }
  }
}


