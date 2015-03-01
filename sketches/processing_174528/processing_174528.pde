
int x = 0;

void setup(){
    size(500,500);
    colorMode(HSB,100);
    background(99);
    frameRate(10);
 }

 void draw(){
    fill(random(100), 40, 99);
    noStroke();
    smooth();
   ellipse(mouseX, mouseY, pmouseX/2, pmouseX/2);
 } 
 
 void mousePressed(){
  background(99);
}

void keyPressed(){
  
  switch(key) {
  case 'a':
  background(99);
  println("a");
  break;
  }
}


