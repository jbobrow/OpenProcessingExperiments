
int x;

void setup() {
  size(800, 600);
  noStroke();
  textFont(createFont("helvetica",36));
  x = 8000;
}
  
void draw() {
  background(255);
  fill(0);
  
  textSize(256);
  text(millis()/1000,width/4, height/3);
 
  textSize(18);
  text("seconds:",width/8, height/6);
  
  if (millis() < 5000) {  
    text("only show for 4 seconds",2*width/3-100, 3*height/4-120);
    rectMode(CENTER);
    rect(2*width/3, 3*height/4, 200, 200);
  }
  
  textSize(18);
  if (millis() >= x) {  
    text("this will show on " + x + "ms",2*width/3-100, 3*height/4-120);
    rectMode(CENTER);
    rect(2*width/3, 3*height/4, 200, 200);
  }
  
  if (millis() >= x*2) {  
    text("this will show on " + x*2 + "ms",width/3-100, 3*height/4-120);
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(width/3, 3*height/4, 200, 200);
  }
  
  //x += 2000; don't know how to hide it or show every 8 seconds
  
}
